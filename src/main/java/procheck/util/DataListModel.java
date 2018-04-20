package procheck.util;

public class DataListModel {
    private int column;
    private String column_name;

    public DataListModel(int column, String column_name) {
        this.column = column;
        this.column_name = column_name;
    }
    public DataListModel(){}
    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public String getColumn_name() {
        return column_name;
    }

    public void setColumn_name(String column_name) {
        this.column_name = column_name;
    }
}
