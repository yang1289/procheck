package procheck.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2017/3/2.
 */

@Entity
@Table(name="pro_project")
public class Project implements Serializable {

    @Id
    @GeneratedValue
    private int id;

    private String projectName;
    private String projectInfo;
    private String adviserAdvice;
    private boolean adviserIsCheck;
    private String academyAdvice;
    private boolean academyIsCheck;
    private String collegeAdvice;
    private boolean collegeIsCheck;
    private boolean isPublish;
    private Date createTime;


}
