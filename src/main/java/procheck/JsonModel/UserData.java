package procheck.JsonModel;

import java.util.Date;
import java.util.List;

public class UserData {

    private int no;
    private String username;
    private List<String> rolename;
    private String registTime;
    private String email;

    public UserData() {
    }

    public UserData(int no, String username, List<String> rolename, String registTime, String email) {
        this.no = no;
        this.username = username;
        this.rolename = rolename;
        this.registTime = registTime;
        this.email = email;
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
}
