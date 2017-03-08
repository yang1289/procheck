package procheck.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2017/3/7.
 */
@Entity
@Table(name = "pro_academy")
public class Academy implements Serializable{
    @Id
    @GeneratedValue
    private int id;
    @Column(nullable = false)
    private String name;

    private int pid;

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "academy")
    private Set<User> users=new HashSet<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
