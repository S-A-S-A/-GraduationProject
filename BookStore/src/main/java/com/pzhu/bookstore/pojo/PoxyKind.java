package com.pzhu.bookstore.pojo;

import java.util.Date;


public class PoxyKind {

	private String id;
	
	private String type;
	
	private Date creatTime;
	
	private Date updateTime;

	
	
	public PoxyKind(Kind kind) {
		super();
		this.id = kind.getId();
		this.type = kind.getType();
		this.creatTime = kind.getCreatTime();
		this.updateTime = kind.getUpdateTime();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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
