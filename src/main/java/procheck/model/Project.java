package procheck.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.security.core.Authentication;
import procheck.util.constants;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
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
    private boolean published;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private User user;

    @Column(nullable = false)
    @JsonFormat(pattern = constants.DATETIME_FORMAT)
    private Date createTime;

    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "academy_id")
    private Academy academy;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectInfo() {
        return projectInfo;
    }

    public void setProjectInfo(String projectInfo) {
        this.projectInfo = projectInfo;
    }

    public String getAdviserAdvice() {
        return adviserAdvice;
    }

    public void setAdviserAdvice(String adviserAdvice) {
        this.adviserAdvice = adviserAdvice;
    }

    public boolean isAdviserIsCheck() {
        return adviserIsCheck;
    }

    public void setAdviserIsCheck(boolean adviserIsCheck) {
        this.adviserIsCheck = adviserIsCheck;
    }

    public String getAcademyAdvice() {
        return academyAdvice;
    }

    public void setAcademyAdvice(String academyAdvice) {
        this.academyAdvice = academyAdvice;
    }

    public boolean isAcademyIsCheck() {
        return academyIsCheck;
    }

    public void setAcademyIsCheck(boolean academyIsCheck) {
        this.academyIsCheck = academyIsCheck;
    }

    public String getCollegeAdvice() {
        return collegeAdvice;
    }

    public void setCollegeAdvice(String collegeAdvice) {
        this.collegeAdvice = collegeAdvice;
    }

    public boolean isCollegeIsCheck() {
        return collegeIsCheck;
    }

    public void setCollegeIsCheck(boolean collegeIsCheck) {
        this.collegeIsCheck = collegeIsCheck;
    }

    public boolean isPublished() {
        return published;
    }

    public void setPublished(boolean published) {
        this.published = published;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {

        this.createTime = createTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Academy getAcademy() {
        return academy;
    }

    public void setAcademy(Academy academy) {
        this.academy = academy;
    }
}
