package procheck.service;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import procheck.common.config.SiteConfig;
import procheck.dao.UserRepository;
import procheck.tools.ExcelImportUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

@Service
@Transactional
@EnableConfigurationProperties(SiteConfig.class)
public class ImportDataService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SiteConfig siteConfig;

    public boolean importData(MultipartFile file){
        boolean importOk=true;
        File fileDir=new File(siteConfig.getUploadPath()+"temp");
        if(!fileDir.exists()){
            fileDir.mkdirs();
        }
        File tempFile=null;
        if(ExcelImportUtil.isExcel2003(file.getOriginalFilename())){
            tempFile=new File(siteConfig.getUploadPath()+"temp/"+new Date().getTime()+".xls");
        }
        if(ExcelImportUtil.isExcel2007(file.getOriginalFilename())){
            tempFile=new File(siteConfig.getUploadPath()+"temp/"+new Date().getTime()+".xlsx");
        }

        FileInputStream fis=null;
        try{
            file.transferTo(tempFile);
        }catch(IOException e){
            importOk=false;
        }

        return importOk;
    }

    public Map getTempFile(){
        File fileDir=new File(siteConfig.getUploadPath()+"temp");
        File file=null;
        Map messfile=new HashMap();
        if (fileDir.exists()){
            File[] files=fileDir.listFiles();
            if(files.length>1){
                for(File file1:files){
                    file.delete();
                }
                messfile.put("message","不能指定导入的文件，请重新选择文件导入");
                messfile.put("file",null);
            }else if(files.length==1){
                messfile.put("message","success");
                messfile.put("file",files[0]);
            }else{
                messfile.put("message","没有导入的文件");
                messfile.put("file",null);
            }
        }
        return messfile;
    }
}
