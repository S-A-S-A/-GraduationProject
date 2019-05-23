package com.pzhu.bookstore.pojo;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;




@Entity
@Table(name="orderbook")
public class OrderBook {
	
	@Id
	@Column(length=10)
	@GeneratedValue(strategy=GenerationType.TABLE)
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name="orderId",nullable=true )
	private Order order;
	
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name="bookId",nullable=true)
	private BookInfo bookInfo;

	
	/*
	 * @Column(length=32) private String orderId;
	 * 
	 * @Column(length=32) private String bookId;
	 */
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date gmtCreate;

	/*
	 * public OrderBook(String orderId, String bookId) { super(); this.orderId =
	 * orderId; this.bookId = bookId; this.gmtCreate = new Date(); }
	 * 
	 * public String getOrderId() { return orderId; }
	 * 
	 * public void setOrderId(String orderId) { this.orderId = orderId; }
	 * 
	 * public String getBookId() { return bookId; }
	 * 
	 * public void setBookId(String bookId) { this.bookId = bookId; }
	 */
	
	
	

	public Date getGmtCreate() {
		return gmtCreate;
	}

	

	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public BookInfo getBookInfo() {
		return bookInfo;
	}

	public void setBookInfo(BookInfo bookInfo) {
		this.bookInfo = bookInfo;
	}

	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	
	
	

}
