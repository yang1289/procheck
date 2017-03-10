package procheck.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2017/3/10.
 */
@Entity
@Table(name = "pro_major")
public class Major implements Serializable{

    @Id
    @GeneratedValue
    private int id;

    private String name;

    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "academy_id")
    @JsonIgnore
    private Academy academy;

    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "major")
    @JsonIgnore
    private Set<Grade> grades =new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "major")
    @JsonIgnore
    private Set<User> users=new HashSet<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Academy getAcademy() {
        return academy;
    }

    public void setAcademy(Academy academy) {
        this.academy = academy;
    }

    public Set<Grade> getGrades() {
        return grades;
    }

    public void setGrades(Set<Grade> grades) {
        this.grades = grades;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
