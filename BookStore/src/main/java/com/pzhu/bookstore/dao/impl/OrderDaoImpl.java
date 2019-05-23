package com.pzhu.bookstore.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.pzhu.bookstore.dao.OrderDao;
import com.pzhu.bookstore.pojo.Order;

@Repository
public class OrderDaoImpl implements OrderDao{

	@Resource
	private SessionFactory sessionFactory;

	@Override
	public void addOrder(Order order) {
		sessionFactory
		.getCurrentSession()
		.merge(order);
	}

	@Override
	public List<Order> findMyOrder(Integer id) {
		String hql = "from Order o where user_id=:id";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, Order.class)
				.setParameter("id", id)
				.getResultList();
	}

	@Override
	public Order findById(String id) {
		String hql = "from Order  o where o.id=:id";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, Order.class)
				.setParameter("id", id)
				.uniqueResult();
	}

	@Override
	public List<Order> findAll() {
		String hql = "from Order";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, Order.class)
				.getResultList();
	}

	@Override
	public void delete(Order order) {
		sessionFactory
		.getCurrentSession()
		.delete(order);
	}

	@Override
	public List<Order> search(String id, String receiverName) {
		String hql = "from Order where 1=1";
		if(!"".equals(id.trim()) && id!=null){
			hql += " and id like '%"+id+"%'";
		}
		if(!"".equals(receiverName)&&receiverName!=null){
			hql += " and receiverName='"+receiverName+"'";
		}
		System.out.println(hql);
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql)
				.getResultList();
	}

	@Override
	public void deleteById(String id) {
		String sqlString = "DELETE FROM Order WHERE id=:id";
		sessionFactory.getCurrentSession().createSQLQuery(sqlString).setString("id", id).executeUpdate();
	}
	
	
}
