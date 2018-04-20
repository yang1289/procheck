package procheck.tools;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public  class ExcelImportUtil {
    private static Logger logger= LogManager.getLogger(ExcelImportUtil.class);

    public static boolean isExcel2003(String filePath){
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    public static boolean isExcel2007(String filePath){
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }
    public static boolean validateExcel(String filePath){
        logger.info("FilePath:"+filePath);
        if(filePath==null||!(isExcel2003(filePath)||isExcel2007(filePath))){
            return false;
        }
        return true;
    }
}
