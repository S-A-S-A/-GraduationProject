package com.pzhu.bookstore.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.pzhu.bookstore.dao.BookInfoDao;
import com.pzhu.bookstore.pojo.BookInfo;
import com.pzhu.bookstore.pojo.Kind;
import com.pzhu.bookstore.pojo.Order;

@Repository
public class BookInfoDaoImpl implements BookInfoDao {

	@Resource
	private SessionFactory sessionFactory;
	
	public BookInfo selectById(String id) {
		String hql = "from BookInfo o where o.id=:id";
		
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, BookInfo.class)
				.setParameter("id", id)
				.uniqueResult();
	}

	@Override
	public void updateKind(BookInfo bookInfo) {
		sessionFactory
		.getCurrentSession()
		.merge(bookInfo);
	}
	
	
	
	
	
}
