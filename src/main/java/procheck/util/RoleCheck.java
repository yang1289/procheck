package procheck.util;

/**
 * Created by Administrator on 2017/3/7.
 */
public class RoleCheck {

    private String rolename;
    private final static String ADVISER="adviser";
    private final static String STUDENT="student";
    private final static String DSOADMIN="dsoAdmin";
    private final static String CTSECRETARY="ctsecretary";
    private final static String FPGROUP="fpgroup";
    private final static String CPGROUP="cpgroup";

    public RoleCheck(){

    }
    public RoleCheck(String rolename){
        this.rolename=rolename;
    }

    public boolean isStudent(String name){
        if(name.equals(STUDENT)){
            return true;
        }else{
            return false;
        }
    }
    public boolean isAdviser(String name){
        if(name.equals(ADVISER)){
            return true;
        }else{
            return false;
        }
    }

    public boolean isAdviser(){
        if(rolename.equals(ADVISER)){
            return true;
        }else{
            return false;
        }
    }

    public boolean isFpgroup(String name){
        if(name.equals(FPGROUP)||name.equals(CTSECRETARY)){
            return true;
        }else{
            return false;
        }
    }

    public boolean isCpgroup(String name){
        if(name.equals(CPGROUP)||name.equals(DSOADMIN)){
            return true;
        }else{
            return false;
        }
    }

}
