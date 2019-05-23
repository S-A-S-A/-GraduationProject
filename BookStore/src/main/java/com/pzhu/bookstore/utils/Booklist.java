package com.pzhu.bookstore.utils;


import com.pzhu.bookstore.pojo.BookInfo;

public class Booklist {

	private BookInfo book;
	
	private Double sum = 0.0;
	
	private Integer quantity;

	public BookInfo getBook() {
		return book;
	}

	public void setBook(BookInfo book) {
		this.book = book;
	}

	public Double getSum() {
		return sum;
	}

	public void setSum(Double sum) {
		this.sum = sum;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
}
