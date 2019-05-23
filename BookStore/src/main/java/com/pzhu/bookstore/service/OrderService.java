package com.pzhu.bookstore.service;

import java.util.Date;
import java.util.List;

import com.pzhu.bookstore.pojo.Order;
import com.pzhu.bookstore.pojo.OrderBook;
import com.pzhu.bookstore.pojo.User;
import com.pzhu.bookstore.utils.Booklist;
import com.pzhu.bookstore.utils.PageBean;


public interface OrderService {

	PageBean addOrder(List<Booklist> booklists, User user, Order order);

	List<Order> findMyOrder(Integer id);

	Order findById(String id);

	List<Order> findAll();

	String deleteOrder(String id);

	List<Order> search(String id, String receiverName);

	List<Order> payOrder(Integer userId, String orderId);

	List<OrderBook> salesList(Date startDate, Date endDate);

}
