package procheck.tools;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import procheck.common.config.MysqlConfig;
import procheck.util.BackUpSql;

import java.io.File;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;

/**
 * Created by Administrator on 2017/3/17.
 */
@Component
@EnableConfigurationProperties(MysqlConfig.class)
public class ScheduleTask {
    Logger logger= LogManager.getLogger(ScheduleTask.class);
    @Autowired
    private MysqlConfig mysqlConfig;
    @Scheduled(cron = "0 0 0/1 * * *")
    public void backupSqlInTime(){
        Thread current = Thread.currentThread();
        BackUpSql backUpSql=new BackUpSql();
        File file=new File(mysqlConfig.getBackupPath());
        if(file.exists()){
            int len=file.listFiles().length;
            logger.info("file.len:==="+len);
            if(file.listFiles().length>10){
                File[] files=this.orderByDate(mysqlConfig.getBackupPath());
                logger.info("files:==="+files[0]);
                files[0].delete();
            }
        }
        String message=backUpSql.backUp(mysqlConfig.getUrl(),mysqlConfig.getUsername(),mysqlConfig.getPassword(),mysqlConfig.getBackupPath());
        if(message.equals("success")){
            logger.info("ScheduledTest.executeFileDownLoadTask 定时任务1:"+message);
        }else{
            logger.info("ScheduledTest.executeFileDownLoadTask 定时任务1:"+message);
        }

    }
    private static File[] orderByDate(String fliePath) {
        File file = new File(fliePath);
        File[] fs = file.listFiles();
        Arrays.sort(fs,new Comparator< File>(){
            public int compare(File f1, File f2) {
                long diff = f1.lastModified() - f2.lastModified();
                if (diff > 0)
                    return 1;
                else if (diff == 0)
                    return 0;
                else
                    return -1;
            }
            public boolean equals(Object obj) {
                return true;
            }

        });
        return fs;
    }

}
