package procheck.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by Administrator on 2017/3/23.
 */
@Entity
@Table(name = "pro_applyuser")
public class ApplyUser implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String applyName;
    private String applyMajor;
    @Column(unique = true)
    private String applyNumber;
    private String applyGrade;
    @ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "applyUsers")
    private Set<Project> projects;
    public ApplyUser(){
        super();
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getApplyName() {
        return applyName;
    }

    public void setApplyName(String applyName) {
        this.applyName = applyName;
    }

    public String getApplyMajor() {
        return applyMajor;
    }

    public void setApplyMajor(String applyMajor) {
        this.applyMajor = applyMajor;
    }

    public String getApplyNumber() {
        return applyNumber;
    }

    public void setApplyNumber(String applyNumber) {
        this.applyNumber = applyNumber;
    }

    public String getApplyGrade() {
        return applyGrade;
    }

    public void setApplyGrade(String applyGrade) {
        this.applyGrade = applyGrade;
    }

    public Set<Project> getProjects() {
        return projects;
    }

    public void setProjects(Set<Project> projects) {
        this.projects = projects;
    }
}
