package com.pzhu.bookstore.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.pzhu.bookstore.dao.OrderBookDao;
import com.pzhu.bookstore.pojo.OrderBook;
import com.pzhu.bookstore.service.IndexService;

/**
 * 主页数据处理
 * @author sasa4
 *
 */
@Service
@Transactional
public class IndexServiceImpl implements IndexService{
	
	
	@Resource
	private OrderBookDao orderBookDao;

	@Override
	public List<OrderBook> queryHotBook() {
	
		
		return orderBookDao.findHotBook();
	}
	
	
	

}
