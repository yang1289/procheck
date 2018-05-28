package procheck.controller;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import procheck.common.config.MysqlConfig;
import procheck.common.config.SiteConfig;
import procheck.model.Academy;
import procheck.model.Role;
import procheck.model.User;
import procheck.service.AcademyService;
import procheck.service.ImportDataService;
import procheck.service.RoleService;
import procheck.service.UserService;
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
    private static Logger logger=LogManager.getLogger(DataManageController.class);
    @Autowired
    private  MysqlConfig mysqlConfig;
    @Autowired
    private ImportDataService importDataService;
    @Autowired
    private AcademyService academyService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @GetMapping("/list")
    public String dataList(Model model){
        logger.info(mysqlConfig.getUrl());
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
            responseMap.put("message",new String("没有需要导入的数据"));

            return gson.toJson(responseMap);
        }
        String fileName=userData.getOriginalFilename();
        logger.info("fileName::"+fileName);
        if(!ExcelImportUtil.validateExcel(fileName)){
            responseMap.put("status","error");
            responseMap.put("message",new String("请上传Excel文件"));
            return gson.toJson(responseMap);
        }
        long size=userData.getSize();
        if(StringUtils.isEmpty(fileName)||size==0){
            responseMap.put("status","error");
            responseMap.put("message",new String("上传的Excel的文件为空"));
            return gson.toJson(responseMap);
        }
        logger.info("fileName:"+userData.getOriginalFilename());
        importDataService.importData(userData);
        responseMap.put("status","success");
        responseMap.put("message","/dataManage/importOption");
        return gson.toJson(responseMap);
    }

    @GetMapping("/importOption")
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

    @PostMapping("/importDataed")

    public String importData(int usernameColumn,String pwoption,String costumPassword,int chineseNameColumn,int academyColumn,int sexColumn,int jobTitleColumn,int educationColumn,int professionColumn,HttpServletResponse response,Model model){
        Map columnMap=new HashMap<>();
        boolean isSame=false;
        List<User> users;
        if(!columnMap.containsValue(usernameColumn)){
            columnMap.put("usernameColumn",usernameColumn);
        }else{
            isSame=true;
        }
        if(!columnMap.containsValue(chineseNameColumn)){
            columnMap.put("chineseNameColumn",chineseNameColumn);
        }else{
            isSame=true;
        }

        if(!columnMap.containsValue(academyColumn)){
            columnMap.put("academyColumn",academyColumn);
        }else{
            isSame=true;
        }
        if(!columnMap.containsValue(sexColumn)){
            columnMap.put("sexColumn",sexColumn);
        }else{
            isSame=true;
        }
        if(!columnMap.containsValue(jobTitleColumn)){
            columnMap.put("jobTitleColumn",jobTitleColumn);
        }else{
            isSame=true;
        }
        if(!columnMap.containsValue(educationColumn)){
            columnMap.put("educationColumn",educationColumn);
        }else{
            isSame=true;
        }
        if(!columnMap.containsValue(professionColumn)){
            columnMap.put("professionColumn",professionColumn);
        }else{
            isSame=true;
        }
        if(isSame!=true){

            Map tempMap=importDataService.getTempFile();

            if(((String)tempMap.get("message")).equals("success")){
                File tempFile=(File) tempMap.get("file");
                if(pwoption.equals("aspwd")){
                    users=getImportData(tempFile,columnMap,"username" ,academyService);
                }else{
                    users=getImportData(tempFile,columnMap,costumPassword,academyService);
                }
                logger.info("users.size:"+users.size());
                if(users!=null||users.size()>0){

                   userService.saveAllUsers(users);
                    try {
                        response.sendRedirect("/user/list");
                        tempFile.delete();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }catch (Exception e){
                        e.printStackTrace();
                    }

                }else{
                    model.addAttribute("message","获取Excel文件内容失败");
                }

            }else{
                model.addAttribute("message",(String)tempMap.get("message"));
            }
        }else{
            model.addAttribute("message","需要导入的数据请选择不一样的");


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
        logger.info("getRow().getcell:"+sheet.getRow(1).getCell(0).getCellTypeEnum());
        for(int i=0;i<totalCells;i++){
            if(sheet.getRow(0).getCell(i)!=null){
                Cell cell=sheet.getRow(0).getCell(i);
                String value="";
                switch (cell.getCellTypeEnum()){
                    case NUMERIC:
                        value =new Double(cell.getNumericCellValue()).toString();
                    case STRING:
                        value =new String(cell.getStringCellValue());
                }

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

    private  List<User> getImportData(File file,Map columnMap,String password,AcademyService academyService){
        List<User> users=new ArrayList<>();
        try {
            FileInputStream is=new FileInputStream(file);
            Workbook workbook=null;
            if(ExcelImportUtil.isExcel2003(file.getName())){
                workbook=new HSSFWorkbook(is);
            }
            if(ExcelImportUtil.isExcel2007(file.getName())){
                workbook=new XSSFWorkbook(is);
            }
            Sheet sheet=workbook.getSheetAt(0);
            int totalRows=sheet.getPhysicalNumberOfRows();
            Map tempMap=null;
            User user=null;
            Set<Role> roles=new HashSet<>();
            logger.info(roleService.findByName("student").getDescription());
            roles.add(roleService.findByName("adviser"));
            for(int i=1;i<totalRows;i++){
                user=new User();
               if(sheet.getRow(i).getCell((Integer)columnMap.get("usernameColumn")).getCellTypeEnum()==CellType.STRING){
                   user.setUsername(sheet.getRow(i).getCell((Integer)columnMap.get("usernameColumn")).getStringCellValue());
               }else{
                   return new ArrayList<>();
               }
                if(sheet.getRow(i).getCell((Integer)columnMap.get("chineseNameColumn")).getCellTypeEnum()==CellType.STRING){
                    user.setChineseName(sheet.getRow(i).getCell((Integer)columnMap.get("chineseNameColumn")).getStringCellValue());
                }else{
                    return new ArrayList<>();
                }
                if(sheet.getRow(i).getCell((Integer)columnMap.get("academyColumn")).getCellTypeEnum()==CellType.STRING){

                    String name=sheet.getRow(i).getCell((Integer)columnMap.get("academyColumn")).getStringCellValue();
                    Academy academy=academyService.isContainsName(name);
                    if(academy!=null){
                        user.setAcademy(academy);
                    }else{
                        academy=new Academy();
                        academy.setName(name);
                        user.setAcademy(academy);
                    }
                }else{
                    return new ArrayList<>();
                }
                if(sheet.getRow(i).getCell((Integer)columnMap.get("sexColumn")).getCellTypeEnum()==CellType.STRING){
                    String cellName=sheet.getRow(i).getCell((Integer)columnMap.get("sexColumn")).getStringCellValue();
                    if(cellName.equals("男")){
                        user.setSex('1');
                    }else{
                        user.setSex('0');
                    }
                }else if(sheet.getRow(i).getCell((Integer)columnMap.get("sexColumn")).getCellTypeEnum()==CellType.NUMERIC){
                    Double cellName=sheet.getRow(i).getCell((Integer)columnMap.get("sexColumn")).getNumericCellValue();
                    if(cellName>0){
                        user.setSex('1');
                    }else{
                        user.setSex('0');
                    }
                }else{
                    return new ArrayList<>();
                }

                if(sheet.getRow(i).getCell((Integer)columnMap.get("jobTitleColumn")).getCellTypeEnum()==CellType.STRING){
                    user.setJobTile(sheet.getRow(i).getCell((Integer)columnMap.get("jobTitleColumn")).getStringCellValue());
                }else{
                    return new ArrayList<>();
                }

                if(sheet.getRow(i).getCell((Integer)columnMap.get("educationColumn")).getCellTypeEnum()==CellType.STRING){
                    user.setJobTile(sheet.getRow(i).getCell((Integer)columnMap.get("educationColumn")).getStringCellValue());
                }else{
                    return new ArrayList<>();
                }
                if(sheet.getRow(i).getCell((Integer)columnMap.get("professionColumn")).getCellTypeEnum()==CellType.STRING){
                    user.setJobTile(sheet.getRow(i).getCell((Integer)columnMap.get("professionColumn")).getStringCellValue());
                }else{
                    return new ArrayList<>();
                }
                if(password.equals("username")){
                    String pwd=new BCryptPasswordEncoder().encode(user.getUsername());
                    user.setPassword(pwd);
                }else{
                    String pwd=new BCryptPasswordEncoder().encode(password);
                }
                Date date=new Date();
                user.setRegistTime(date);
                user.setRoles(roles);
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

}
