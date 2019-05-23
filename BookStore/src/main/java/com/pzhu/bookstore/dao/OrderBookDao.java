package com.pzhu.bookstore.dao;

import java.util.Date;
import java.util.List;

import com.pzhu.bookstore.pojo.Order;
import com.pzhu.bookstore.pojo.OrderBook;

public interface OrderBookDao {

	void addOrder(OrderBook orderBook);
	/**
	 *  查询近7天销量最好的的商品
	 * @return
	 */
	List<OrderBook> findHotBook();
	
	
	List<OrderBook> findByDate(Date startDate, Date endDate);
	
	
}
