package procheck.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import javax.persistence.*;

@Entity
@Table(name = "pro_permission")
public class Permission implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String description;

	private String name;

	private int pid;

	private String url;

	@ManyToMany(mappedBy = "permissions",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	private Set<Role> roles = new HashSet<Role>();

	@ManyToMany(mappedBy = "permissions", cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	private Set<ProTable> proTables=new HashSet<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<ProTable> getProTables() {
		return proTables;
	}

	public void setProTables(Set<ProTable> proTables) {
		this.proTables = proTables;
	}
}
