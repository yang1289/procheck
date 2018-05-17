package procheck.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import procheck.util.constants;
@Entity
@Table(name="pro_user")
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(unique=true,nullable=false)

	private String username;
	private String chineseName;

	@Column(nullable=false)
	@JsonIgnore
	private String password;
	
	@Column(nullable=false)
	@JsonFormat(pattern=constants.DATETIME_FORMAT)
	private Date registTime;
	
	private String email;
	
	private String url;

	private char sex;

	private String jobTile;

	private String profession;

	private String education;


	@ManyToMany(cascade=CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinTable(
				name="pro_user_role",
				joinColumns={@JoinColumn(name="user_id")},
				inverseJoinColumns={@JoinColumn(name="role_Id")}
			)
	@JsonIgnore
	private Set<Role> roles=new HashSet<>();

	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "user")
	private Set<Project> projects=new HashSet<>();

	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinColumn(name = "academy_id")
	private Academy academy;
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinColumn(name = "major_id")
	private Major major;
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinColumn(name = "grade_id")
	private Grade grade;
	@OneToMany(cascade = {CascadeType.REFRESH,CascadeType.MERGE,CascadeType.PERSIST},fetch=FetchType.LAZY,mappedBy = "adviser")
	private Set<Project> checkProjects=new HashSet<>();

	public User(){
		
	}
	
	public User(String username, String password,String chineseName, Date registTime,Academy academy,Major major,Grade grade,Role role) {
		
		this.username = username;
		this.password = password;
		this.registTime = registTime;
		this.academy=academy;
		this.major=major;
		this.grade=grade;
		roles.add(role);
		this.chineseName=chineseName;

		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegistTime() {
		return registTime;
	}

	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}

	public String getChineseName() {
		return chineseName;
	}

	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}

	public Academy getAcademy() {
		return academy;
	}

	public void setAcademy(Academy academy) {
		this.academy = academy;
	}

	public Major getMajor() {
		return major;
	}

	public void setMajor(Major major) {
		this.major = major;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public Set<Project> getCheckProjects() {
		return checkProjects;
	}

	public void setCheckProjects(Set<Project> checkProjects) {
		this.checkProjects = checkProjects;
	}

	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
	}

	public String getJobTile() {
		return jobTile;
	}

	public void setJobTile(String jobTile) {
		this.jobTile = jobTile;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	@Override
	public boolean equals(Object obj) {
		User user=(User) obj;
		if(username.equals(user.username)){
			return true;
		}
		return false;
	}
}
