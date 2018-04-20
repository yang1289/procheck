package procheck.JsonModel;

import java.util.Date;
import java.util.List;

public class UserData {

    private int no;
    private int operateId;
    private String username;
    private List<String> rolename;
    private String registTime;
    private String email;
    private String chineseName;

    public UserData() {
    }

    public UserData(int no, String username, List<String> rolename, String registTime, String email,String chineseName,int operateId) {
        this.no = no;
        this.username = username;
        this.rolename = rolename;
        this.registTime = registTime;
        this.email = email;
        this.chineseName=chineseName;
        this.operateId=operateId;

    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<String> getRolename() {
        return rolename;
    }

    public void setRolename(List<String> rolename) {
        this.rolename = rolename;
    }

    public String getRegistTime() {
        return registTime;
    }

    public void setRegistTime(String registTime) {
        this.registTime = registTime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getChineseName() {
        return chineseName;
    }

    public void setChineseName(String chineseName) {
        this.chineseName = chineseName;
    }

    public int getOperateId() {
        return operateId;
    }

    public void setOperateId(int operateId) {
        this.operateId = operateId;
    }
}
