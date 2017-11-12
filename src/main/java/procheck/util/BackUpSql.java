package procheck.util;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import procheck.common.config.MysqlConfig;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/3/16.
 */


public class BackUpSql {
    Logger logger=Logger.getLogger(BackUpSql.class);


    public String backUp(String url,String username,String password,String backuppath){
        File path=new File(backuppath);
        if(!path.exists()){
            path.mkdirs();
        }
        Date date=new Date();
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        Runtime rt=Runtime.getRuntime();
        String osname=System.getProperty("os.name");
        String url1[]=url.split("/");
        String sch= url1[3];
        sch=sch.substring(0,sch.indexOf("?"));
        String urlNoPort=url1[2].split(":")[0];
        String port=url1[2].split(":")[1];
        logger.info("urlNoPort:"+urlNoPort+" prot:"+port+" database Name:"+sch);
        String filename=sch+"_"+format.format(date)+".sql";
        String dump="";
        logger.info("osName:==="+osname);
        OutputStreamWriter writer=null;
        FileOutputStream fout=null;
        try {
            if(osname.contains("Windows")){
                String backbat=backuppath+"../backup.bat";
                fout=new FileOutputStream(backbat);
                writer=new OutputStreamWriter(fout,"utf-8");
                StringBuffer sb=new StringBuffer("");
                sb.append("mysqldump "+sch+">"+backuppath+filename+"\r\n");
                sb.append("exit");
                String outstr=sb.toString();
                writer.write(outstr);
                writer.flush();
                writer.close();
                fout.close();
                dump="cmd /c "+backbat;
            }
            if(osname.contains("Linux")){
                String backsh=backuppath+"../backup.sh";
                File file=new File(backsh);
                fout=new FileOutputStream(file);
                writer=new OutputStreamWriter(fout,"utf-8");
                StringBuffer sb=new StringBuffer("");
                sb.append("#/bin/sh"+"\r\n");
                sb.append("mysqldump -u"+username+" -p"+password+" --databases "+sch+">"+backuppath+filename+"\r\n");
                sb.append("exit");
                String outstr=sb.toString();
                writer.write(outstr);
                writer.flush();
                writer.close();
                fout.close();
                dump="/bin/sh -c "+backsh;
                file.setExecutable(true);
            }
        }catch (IOException e){
            e.printStackTrace();
        }

        logger.info("dump:==="+dump);
       // String[] dump={"D:/mysql-5.7.17-winx64/bin/mysqldump.exe","-uroot","-pyq199410","--database sch",">","D:/workstation/procheck/sql/procheck2.sql"};
       // dump[1]=" -u"+username+" -p"+password+" --databases "+sch+">"+backuppath+filename;
        String message="";
        try {
            Process process=rt.exec(dump);
            InputStream in=process.getInputStream();
            InputStreamReader reader=new InputStreamReader(in,"utf-8");
            BufferedReader br=new BufferedReader(reader);
            String instr;
            while((instr=br.readLine())!=null){
                logger.info("process==="+instr);
            }
            process.destroy();
            message="success";
        } catch (IOException e) {
            e.printStackTrace();
            message="error";
        }
        return message;
    }
}
