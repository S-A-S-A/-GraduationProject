package com.pzhu.bookstore.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;
import org.hibernate.query.criteria.internal.expression.function.AggregationFunction.SUM;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "t_order")
public class Order implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(length = 10)
	private String id;

	@Column(length = 20)
	private String address;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creatDate;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateDate;

	@Column(length = 2) // 0 未支付 1 已支付 2等待发货 3已发货 4配送中 5 已签收 6 订单完成
	private String status;

	@Column(length = 12)
	private String receiverName;

	@Column(length = 6)
	private double sumCast = 0;

	@Column(length = 11)
	private String receiverPhone;

	@Column(length = 6)
	private Integer quantity;

	@ManyToOne( optional = true)
	@JoinColumn(name = "user_id")
	private User user;

	/*
	 * @ManyToMany(cascade={CascadeType.ALL}, fetch=FetchType.EAGER)
	 * 
	 * @JoinTable( name = "orderbook", joinColumns =@JoinColumn(name = "orderId"),
	 * inverseJoinColumns = @JoinColumn(name = "bookId") ) private Set<BookInfo>
	 * bookInfos = new HashSet<>();
	 */

	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<OrderBook> orderBooks = new HashSet<>();

	public Order() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCreatDate() {
		return creatDate;
	}

	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	

	public String getReceiverName() {
		return receiverName;
	}

	public Set<OrderBook> getOrderBooks() {
		return orderBooks;
	}

	public void setOrderBooks(Set<OrderBook> orderBooks) {
		this.orderBooks = orderBooks;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public double getSumCast() {
		return sumCast;
	}

	public void setSumCast(double sumCast) {
		this.sumCast = sumCast;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
