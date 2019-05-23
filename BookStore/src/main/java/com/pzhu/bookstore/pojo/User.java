package com.pzhu.bookstore.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GeneratorType;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="user")
public class User implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(length=6)
	private Integer id; // 用户编号
	
	@Column(length=20)
	private String username; // 用户姓名
	
	@Column(length=20)
	private String password; // 用户密码
	
	@Column(length=2)
	private String gender; // 用户性别
	
	@Column(length=20)
	private String email; // 用户邮箱
	
	@Column(length=11)
	private String telephone; // 用户联系电话
	
	@Column(length=100)
	private String introduce; // 用户介绍
	
	@Column(length=6)
	private String activeCode; // 激活码
	
	@Column(length=2)
	private String role; // 用户角色  1至尊会员  2超级会员 3普通会员
	
	@Column(length=2)
	private int state; // 用户状态
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date registTime;// 注册时间
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updateTime;// 修改时间
	
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="user")
	private List<Order> orders;
	
	public User() {	}

	public User(Integer id, String username, String password, String gender, String email, String telephone,
			String introduce, String activeCode, String role, int state, Date registTime, Date updateTime) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.email = email;
		this.telephone = telephone;
		this.introduce = introduce;
		this.activeCode = activeCode;
		this.role = role;
		this.state = state;
		this.registTime = registTime;
		this.updateTime = updateTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getActiveCode() {
		return activeCode;
	}

	public void setActiveCode(String activeCode) {
		this.activeCode = activeCode;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getRegistTime() {
		return registTime;
	}

	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", gender=" + gender
				+ ", email=" + email + ", telephone=" + telephone + ", introduce=" + introduce + ", activeCode="
				+ activeCode + ", role=" + role + ", state=" + state + ", registTime=" + registTime + ", updateTime="
				+ updateTime + ", orders=" + orders + "]";
	}
	
	
	
}
