package com.pzhu.bookstore.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="kind")
public class Kind implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(length=20)
	private String id;
	
	@Column(length=20)
	private String type;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date creatTime;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updateTime;
	
	@Column(length=2)
	private String status;
	
	@OneToMany(mappedBy="kind")
	private List<BookInfo> books;

	public Kind() {
	}

	public Kind(String id, String type, Date creatTime, List<BookInfo> books) {
		super();
		this.id = id;
		this.type = type;
		this.creatTime = creatTime;
		this.books = books;
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

	public List<BookInfo> getBooks() {
		return books;
	}

	public void setBooks(List<BookInfo> books) {
		this.books = books;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	




	

}
