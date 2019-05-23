package com.pzhu.bookstore.pojo;

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
@Table(name="logininfo")
public class LoginInfo {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(length=6)
	private Integer aid;

	@Column(length=6)
	private Integer userid;

	@Column(length=16)
	private String ip;

	@Column(length=6)
	private String address;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date logintime;

	@Column(length=6)
	private String identity;

	@Column(length=100)
	private String description;

	@Column(length=20)
	private String username;
	
	public LoginInfo() {
		// TODO Auto-generated constructor stub
	}

	public LoginInfo(Integer aid, Integer userid, String ip, String address, Date logintime, String identity,
			String description, String username) {
		super();
		this.aid = aid;
		this.userid = userid;
		this.ip = ip;
		this.address = address;
		this.logintime = logintime;
		this.identity = identity;
		this.description = description;
		this.username = username;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getLogintime() {
		return logintime;
	}

	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	
}
