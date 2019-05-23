package com.pzhu.bookstore.pojo;

import java.util.List;


public class Message {

	private String msg;

	private User user;
	
	private List<?> list;
	
	private Kind kind;
	
	public void setKind(Kind kind) {
		this.kind = kind;
	}
	public Kind getKind() {
		return kind;
	}
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}
	
	
}
