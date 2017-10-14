package procheck.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.security.core.Authentication;
import procheck.util.constants;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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
    @ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinTable(
            name = "pro_project_applyuser",
            joinColumns = {@JoinColumn(name = "project_id")},
            inverseJoinColumns = {@JoinColumn(name="applyuser_id")}
    )
    private Set<ApplyUser> applyUsers=new HashSet<>();

    private String jobTitle;
    private String libName;
    private String teachUnit;
    private String searchCondition;
    private String searchPlan;
    private String createPoint;
    private String searchConditionSupport;
    private String achievenmentMethod;
    private String adviserAdvice;
    private boolean adviserIsCheck;
    private String academyAdvice;
    private boolean academyIsCheck;
    private String collegeAdvice;
    private boolean collegeIsCheck;
    private boolean published;
    private boolean isCreated;
    private boolean needCheck;
    @ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinTable(name = "pro_project_progressplans",
            joinColumns = {@JoinColumn(name = "project_id")},
            inverseJoinColumns = {@JoinColumn(name="progressplan_id")})
    private Set<ProgressPlan> progressPlans=new HashSet<>();
    @ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinTable(
            name = "pro_project_expenditure",
            joinColumns = {@JoinColumn(name = "project_id")},
            inverseJoinColumns = {@JoinColumn(name = "expenditure_id")}
    )
    private Set<Expenditure> expenditures=new HashSet<>();
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Column(nullable = false)
    @JsonFormat(pattern = constants.DATETIME_FORMAT)
    private Date createTime;

    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "academy_id")
    private Academy academy;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "adviserId")
    private User adviser;

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

    public Set<ProgressPlan> getProgressPlans() {
        return progressPlans;
    }

    public void setProgressPlans(Set<ProgressPlan> progressPlans) {
        this.progressPlans = progressPlans;
    }

    public Set<Expenditure> getExpenditures() {
        return expenditures;
    }

    public void setExpenditures(Set<Expenditure> expenditures) {
        this.expenditures = expenditures;
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

    public Set<ApplyUser> getApplyUsers() {
        return applyUsers;
    }

    public void setApplyUsers(Set<ApplyUser> applyUsers) {
        this.applyUsers = applyUsers;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getLibName() {
        return libName;
    }

    public void setLibName(String libName) {
        this.libName = libName;
    }

    public String getTeachUnit() {
        return teachUnit;
    }

    public void setTeachUnit(String teachUnit) {
        this.teachUnit = teachUnit;
    }

    public String getSearchCondition() {
        return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }

    public String getSearchPlan() {
        return searchPlan;
    }

    public void setSearchPlan(String searchPlan) {
        this.searchPlan = searchPlan;
    }

    public String getCreatePoint() {
        return createPoint;
    }

    public void setCreatePoint(String createPoint) {
        this.createPoint = createPoint;
    }

    public String getSearchConditionSupport() {
        return searchConditionSupport;
    }

    public void setSearchConditionSupport(String searchConditionSupport) {
        this.searchConditionSupport = searchConditionSupport;
    }

    public String getAchievenmentMethod() {
        return achievenmentMethod;
    }

    public void setAchievenmentMethod(String achievenmentMethod) {
        this.achievenmentMethod = achievenmentMethod;
    }

    public boolean isCreated() {
        return isCreated;
    }

    public void setCreated(boolean created) {
        isCreated = created;
    }

    public boolean isNeedCheck() {
        return needCheck;
    }

    public void setNeedCheck(boolean needCheck) {
        this.needCheck = needCheck;
    }

    public User getAdviser() {
        return adviser;
    }

    public void setAdviser(User adviser) {
        this.adviser = adviser;
    }
}
