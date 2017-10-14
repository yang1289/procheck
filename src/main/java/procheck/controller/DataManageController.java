package procheck.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import procheck.common.config.MysqlConfig;
import procheck.util.BackUpSql;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/**
 * Created by Administrator on 2017/3/21.
 */
@Controller
@EnableConfigurationProperties(MysqlConfig.class)
@RequestMapping("/dataManage")
public class DataManageController {
    private static Logger logger=Logger.getLogger(DataManageController.class);
    @Autowired
    private MysqlConfig mysqlConfig;

    @GetMapping("/list")
    public String dataList(Model model){
        String backpath=mysqlConfig.getBackupPath();
        File file=new File(backpath);
        List<String> filenames=new ArrayList<>();
        if(file.exists()){
            if(!file.isFile()){
                File[] files=file.listFiles();
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

}
