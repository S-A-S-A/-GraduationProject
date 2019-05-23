package com.pzhu.bookstore.service.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.pzhu.bookstore.dao.BookInfoDao;
import com.pzhu.bookstore.dao.OrderBookDao;
import com.pzhu.bookstore.dao.OrderDao;
import com.pzhu.bookstore.dao.ProductDao;
import com.pzhu.bookstore.pojo.BookInfo;
import com.pzhu.bookstore.pojo.Order;
import com.pzhu.bookstore.pojo.OrderBook;
import com.pzhu.bookstore.pojo.User;
import com.pzhu.bookstore.service.OrderService;
import com.pzhu.bookstore.utils.Booklist;
import com.pzhu.bookstore.utils.PageBean;


@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	
	@Resource
	private OrderDao orderDao;
	@Resource
	private ProductDao bookInfoDao;
	@Resource
	private OrderBookDao orderBookDao;
	

	@Override
	public List<Order> payOrder(Integer userId, String orderId) {
		Order order = orderDao.findById(orderId);
		/*已支付*/
		order.setStatus("1");
		order.setUpdateDate(new Date());
		orderDao.addOrder(order);
		return findMyOrder(userId);
	}

	@Override
	public PageBean addOrder(List<Booklist> booklists, User user,  Order order) {
		
		
		/* 提交（新增）订单 判断库存*/
		PageBean pageBean = new PageBean();
		
		Set<OrderBook> orderBooks = new HashSet<OrderBook>();
		
		Integer sum = 0;
		Double castsum = 0.0;
		for (Booklist booklist : booklists) {
			BookInfo bookInfo = booklist.getBook();
			/**
			 * 判断库存是否充足
			 */
			int count = bookInfo.getCount();
			
			if(count < booklist.getQuantity()) {
				pageBean.setSuccess(false);
				pageBean.setMsg(bookInfo.getBookName()+"库存不足，内存数量:"+count);
				return pageBean;
			}
			
			sum = sum + booklist.getQuantity();
			castsum = castsum + booklist.getSum();
			
			OrderBook orderBook = new OrderBook();
			orderBook.setBookInfo(bookInfo);
			orderBook.setOrder(order);
			orderBook.setGmtCreate(new Date());
		
			orderBooks.add(orderBook);
		}
		
		
		String id = UUID.randomUUID().toString().substring(0, 8);
		if(order.getId()==null) {
			order.setId(id);
		}
		order.setUser(user);
		order.setCreatDate(new Date());
		order.setStatus("0");
		
		
		
		
		
		order.setQuantity(sum);
		order.setSumCast(castsum);
		orderDao.addOrder(order);
		
		for (OrderBook orderBook : orderBooks) {
			orderBookDao.addOrder(orderBook);
		}
		
		for (Booklist booklist : booklists) {
			BookInfo bookInfo = booklist.getBook();
			bookInfo.setCount(booklist.getBook().getCount() - booklist.getQuantity());
			bookInfoDao.updateProduct(bookInfo);
		}
		order.setOrderBooks(orderBooks);
		pageBean.setOrder(order);
		return pageBean;
	}

	@Override
	public List<Order> findMyOrder(Integer id) {
		
		return orderDao.findMyOrder(id);
	}

	@Override
	public Order findById(String id) {
		Order order = orderDao.findById(id);
		
		//System.out.println("book数量:"+order.getBookInfos().size());
		//List<OrderBook> orderBooks = orderbookdao.findByOrderId(id);
		return order;
	}

	@Override
	public List<Order> findAll() {
		
		return orderDao.findAll();
	}
	
	

	@Override
	public List<OrderBook> salesList(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return orderBookDao.findByDate(startDate, endDate);
	}

	@Override
	public String deleteOrder(String id) {
		try {
			Order order = orderDao.findById(id);
			orderDao.delete(order);
			return "yes";
		} catch (Exception e) {
			e.printStackTrace();
			return "no";
		}
		
	}

	@Override
	public List<Order> search(String id, String receiverName) {
		
		return orderDao.search(id, receiverName);
	}

}
