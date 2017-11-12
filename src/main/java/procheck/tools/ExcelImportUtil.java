package procheck.tools;

public  class ExcelImportUtil {

    public static boolean isExcel2003(String filePath){
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    public static boolean isExcel2007(String filePath){
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }

    public static boolean validateExcel(String filePath){
        if(filePath==null||!isExcel2003(filePath)||!isExcel2007(filePath)){
            return false;
        }
        return true;
    }
}
