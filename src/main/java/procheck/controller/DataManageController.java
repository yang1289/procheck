package procheck.controller;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.google.gson.Gson;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import procheck.common.config.MysqlConfig;
import procheck.common.config.SiteConfig;
import procheck.service.ImportDataService;
import procheck.tools.ExcelImportUtil;
import procheck.util.BackUpSql;
import procheck.util.DataListModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.management.ManagementFactory;
import java.net.URLEncoder;
import java.util.*;

/**
 * Created by Administrator on 2017/3/21.
 */
@Controller
@EnableConfigurationProperties(MysqlConfig.class)
@RequestMapping("/dataManage")
public class DataManageController {
    private static Logger logger=Logger.getLogger(DataManageController.class);
    @Autowired
    private static MysqlConfig mysqlConfig;
    @Autowired
    private ImportDataService importDataService;

    @GetMapping("/list")
    public String dataList(Model model){
        String backpath=mysqlConfig.getBackupPath();
        File file=new File(backpath);
        List<String> filenames=new ArrayList<>();
        if(file.exists()){
            if(!file.isFile()){
                File[] files=orderByFileName(file);
                for(File f:files){
                    filenames.add(f.getName());
                }
            }else{
                model.addAttribute("message","不能是文件地址");
            }
        }else{
            model.addAttribute("message","没有找到路径");
        }
        model.addAttribute("filenames",filenames);
        return "/dataManage/datalist";
    }
    @GetMapping("/getFileNow")
    public void getFileNow(HttpServletResponse response, HttpServletRequest request){
        BackUpSql backUpSql=new BackUpSql();
        backUpSql.backUp(mysqlConfig.getUrl(),mysqlConfig.getUsername(),mysqlConfig.getPassword(),mysqlConfig.getBackupPath());
        File[] files=this.orderByDate(mysqlConfig.getBackupPath());
        File file=files[0];
        String fileName=file.getName();
        logger.info("fileName:===="+fileName);
        try {
            response.setHeader("content-type", "application/octet-stream");
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(fileName,"utf-8"));
            OutputStream out=response.getOutputStream();
            FileInputStream filein=new FileInputStream(file);
            byte[] buffer=new byte[1024];
            int len=0;
            while((len=filein.read(buffer))>0){
                out.write(buffer,0,len);
            }
            out.close();
            filein.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    @PostMapping("/importData")
    @ResponseBody
    public String importData(@RequestParam MultipartFile userData,HttpServletResponse response){
        Map<String,String> responseMap=new HashMap<>();
        Gson gson=new Gson();
        if(userData==null){
            responseMap.put("status","error");
            responseMap.put("message","没有需要导入的数据");
            return gson.toJson(responseMap);
        }
        String fileName=userData.getOriginalFilename();
        if(!ExcelImportUtil.validateExcel(fileName)){
            responseMap.put("status","error");
            responseMap.put("message","请上传Excel文件");
            return gson.toJson(responseMap);
        }
        long size=userData.getSize();
        if(StringUtils.isEmpty(fileName)||size==0){
            responseMap.put("status","error");
            responseMap.put("message","上传的Excel的文件为空");
            return gson.toJson(responseMap);
        }
        logger.info("fileName:"+userData.getOriginalFilename());
        importDataService.importData(userData);
        try {
            response.sendRedirect("/dataManage/importOption");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @GetMapping("/dataManage/importOption")
    public String importDataOption(Model model){
        Map messfile=importDataService.getTempFile();
        Map data=new HashMap();
        String message=(String) messfile.get("message");
        List<DataListModel> dataListModels=new ArrayList<>();
        if(message.equals("success")){
            data=getDataList((File) messfile.get("file"));
            if(data.containsKey("message")){
                model.addAttribute("message",(String)data.get("message"));
            }else if(data.containsKey("dataList")){
                model.addAttribute("dataList",(List<DataListModel>)data.get("dataList"));
            }else{
                model.addAttribute("message","没有数据信息，请重新导入");
            }
        }else{
            model.addAttribute("message",(String)messfile.get("message"));
        }
        return "/dataManage/importOption";
    }

    private static File[] orderByDate(String fliePath) {
        File file = new File(fliePath);
        File[] fs = file.listFiles();
        Arrays.sort(fs,new Comparator< File>(){
            public int compare(File f1, File f2) {
                long diff = f1.lastModified() - f2.lastModified();
                if (diff > 0)
                    return -1;
                else if (diff == 0)
                    return 0;
                else
                    return 1;
            }
            public boolean equals(Object obj) {
                return true;
            }

        });
        return fs;
    }

    private static File[] orderByFileName(File file){
        File[] files=file.listFiles();
        Arrays.sort(files, new Comparator<File>() {
            @Override
            public int compare(File f1, File f2) {
                if(f1.getName().compareTo(f2.getName())>=1){
                    return -1;
                }else if(f1.getName().compareTo(f2.getName())==0){
                    return 0;
                }else{
                    return 1;
                }
            }
            public boolean equals(Object object){
                return true;
            }
        });
//        Arrays.sort(sortFileName);
        for(int i=0;i<files.length;i++){
            System.out.println("sortFileName.fileName:"+files[i].getName());
        }
        return files;
    }

    private static Map getDataList(File file){
        FileInputStream is=null;
        Workbook workbook=null;
        Map datas=new HashMap();
        try {
            is=new FileInputStream(file);
            String filename=file.getName();
            if(ExcelImportUtil.isExcel2003(filename)){
                workbook=new HSSFWorkbook(is);
            }
            if(ExcelImportUtil.isExcel2007(filename)){
                workbook=new XSSFWorkbook(is);
            }
            datas=readData(workbook);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return datas;
    }

    private static Map readData(Workbook workbook){
        Map messData=new HashMap();
        String message="";
        Sheet sheet=workbook.getSheetAt(0);
        int totalRows=sheet.getPhysicalNumberOfRows();
        int totalCells=0;
        if(totalRows>=2&&sheet.getRow(1)!=null){
            totalCells=sheet.getRow(1).getPhysicalNumberOfCells();
        }else{
            message="没有数据存在,请导入正确的数据";
            messData.put("message",message);
        }
        List<DataListModel> dataListModels=new ArrayList<>();
        DataListModel dataListModel;
        for(int i=1;i<totalCells;i++){
            if(sheet.getRow(1).getCell(i)!=null){
                String value=sheet.getRow(1).getCell(i).getStringCellValue();
                dataListModel=new DataListModel(i,value);
                dataListModels.add(dataListModel);
            }else{
                messData.put("message","数据的列名不能为空,请导入正确的数据");
                break;
            }
        }
        messData.put("dataList",dataListModels);
        return messData;
    }

}
