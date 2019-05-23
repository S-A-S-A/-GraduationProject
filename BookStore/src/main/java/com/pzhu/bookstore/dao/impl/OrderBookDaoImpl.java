package com.pzhu.bookstore.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.ScrollableResults;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.pzhu.bookstore.dao.OrderBookDao;
import com.pzhu.bookstore.pojo.Order;
import com.pzhu.bookstore.pojo.OrderBook;

@Repository
public class OrderBookDaoImpl implements OrderBookDao {
	
	@Resource
	private SessionFactory sessionFactory;

	@Override
	public void addOrder(OrderBook orderBook) {
		sessionFactory
		.getCurrentSession()
		.merge(orderBook);
	}

	@Override
	public List<OrderBook> findHotBook() {
		Date nowDate = new Date();
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(nowDate);
		calendar.add(Calendar.DAY_OF_YEAR, -7);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String hqlString = "from OrderBook o where o.gmtCreate between '"+sdf.format(calendar.getTime())+"' and '"+sdf.format(nowDate)+"'";
		Query query = sessionFactory
		.getCurrentSession()
		.createQuery(hqlString);
		 //得到滚动结果集
        ScrollableResults scroll = query.scroll();
        //滚动到最后一行
        scroll.last();
        int i = scroll.getRowNumber() + 1;
        //设置分页位置
        
        query.setFirstResult(0);
        query.setMaxResults(2);
	
		
		return query.list();
	}

	@Override
	public List<OrderBook> findByDate(Date startDate, Date endDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String hqlString = "from OrderBook o where o.gmtCreate between '"+sdf.format(startDate)+"' and '"+sdf.format(endDate)+"'";
		return sessionFactory.getCurrentSession().createQuery(hqlString, OrderBook.class).getResultList();
	}
	
	

}
