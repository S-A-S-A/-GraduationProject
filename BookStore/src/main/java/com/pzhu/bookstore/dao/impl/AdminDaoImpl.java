package com.pzhu.bookstore.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.pzhu.bookstore.dao.AdminDao;
import com.pzhu.bookstore.pojo.Admin;


@Repository
public class AdminDaoImpl implements AdminDao{

	@Resource
	private SessionFactory sessionFactory;

	@Override
	public Admin findByUsername(String username) {
		String hql = "from Admin a where a.username=:username";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, Admin.class)
				.setParameter("username", username)
				.uniqueResult();
	}

	@Override
	public List<Admin> findAll(Admin admin) {
		String hql="FROM Admin a WHERE a.level != 1 ";
		
		if(admin.getId()!=null && admin.getId().trim() != "") {
			hql += "and id = " +admin.getId();
		}
		
		if(admin.getUsername()!=null && admin.getUsername().trim() != "") {
			hql += "and username = '" +admin.getUsername()+"'";
		}
		
		hql += " ORDER BY a.id";
		
		
		List<Admin> admins = sessionFactory
				.getCurrentSession()
				.createQuery(hql,Admin.class)
				.getResultList();
		return admins;
	}

	
	@Override
	public void deleteById(Admin admin) {
		sessionFactory
		.getCurrentSession()
		.delete(admin);
	}

	
	@Override
	public Admin findById(String id) {
		String hql="from Admin a where a.id=:id";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, Admin.class)
				.setParameter("id", id)
				.uniqueResult();
	}

	@Override
	public void addAdmin(Admin admin) {
		sessionFactory.getCurrentSession().merge(admin);
	}
	
	
}
