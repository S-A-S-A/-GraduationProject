package com.pzhu.bookstore.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="admin")
public class Admin implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(length=10)
	private String id;
	
	@Column(length=20)
	private String username;
	
	@Column(length=20)
	private String password;
	
	@Column(length=11)
	private String phone;
	
	@Column(length=2)
	private String level;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date creatTime;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updateTime;
	
	public Admin() {
		// TODO Auto-generated constructor stub
	}

	public Admin(String id, String username, String password, String phone, String level, Date creatTime,
			Date updateTime) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.level = level;
		this.creatTime = creatTime;
		this.updateTime = updateTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	

}
