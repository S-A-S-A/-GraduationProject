package com.pzhu.bookstore.dao;

import java.util.List;

import com.pzhu.bookstore.pojo.Order;


public interface OrderDao {

	void addOrder(Order order);

	List<Order> findMyOrder(Integer id);

	Order findById(String id);

	List<Order> findAll();

	void delete(Order order);

	List<Order> search(String id, String receiverName);

	void deleteById(String id);

}
