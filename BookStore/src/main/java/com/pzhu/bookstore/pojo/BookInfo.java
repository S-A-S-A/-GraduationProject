package com.pzhu.bookstore.pojo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;



@Entity
@Table(name="bookinfo")
public class BookInfo implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@Column(length=20)
	private String id;
	
	@Column(length=20)
	private String bookName;
	
	@Column(length=20)
	private String author;
	
	@Column(length=20)
	private String publisher; //出版社
	
	@Column(length=6)
	private Double price;
	
	@Column(length=2)
	private String status;//1正常上架， 0已下架已删除
	
	@Column(length=32)
	private String imagePath;
	
	@Column(length=100)
	private String intro;
	
	@Column(length=4)
	private Integer count;
	
	@ManyToOne
	@JoinColumn(name="kind_id")
	private Kind kind;
	
	@OneToMany(mappedBy="bookInfo", fetch = FetchType.EAGER)
	private Set<OrderBook> orderBooks = new HashSet<OrderBook>();
	
	/*
	 * @ManyToMany(mappedBy="bookInfos") private Set<Order> orders = new
	 * HashSet<>();
	 */

	public BookInfo() {
		// TODO Auto-generated constructor stub
	}

	public BookInfo(String id, String bookName, String author, String publisher, Double price, String imagePath,
			String intro, Integer count, Kind kind) {
		super();
		this.id = id;
		this.bookName = bookName;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.imagePath = imagePath;
		this.intro = intro;
		this.count = count;
		this.kind = kind;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Kind getKind() {
		return kind;
	}

	public void setKind(Kind kind) {
		this.kind = kind;
	}

	/*
	 * public Set<Order> getOrders() { return orders; }
	 * 
	 * public void setOrders(Set<Order> orders) { this.orders = orders; }
	 */

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set<OrderBook> getOrderBooks() {
		return orderBooks;
	}

	public void setOrderBooks(Set<OrderBook> orderBooks) {
		this.orderBooks = orderBooks;
	}

	
	
	
	
	
}
