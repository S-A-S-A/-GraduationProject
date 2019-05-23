package com.pzhu.bookstore.service;

import java.util.List;

import com.pzhu.bookstore.pojo.OrderBook;

public interface IndexService {

	List<OrderBook> queryHotBook();

}
