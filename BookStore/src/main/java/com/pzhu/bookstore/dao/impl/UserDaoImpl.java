package com.pzhu.bookstore.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.pzhu.bookstore.dao.UserDao;
import com.pzhu.bookstore.pojo.User;


@Repository
public class UserDaoImpl implements UserDao{

	@Resource
	private SessionFactory sessionfactory;
	@Override
	public User findUserByName(String username) {
		
		String hql = "from User u where u.username=:username";
		User user = sessionfactory.getCurrentSession().createQuery(hql , User.class).setParameter("username", username).uniqueResult();
		return user;
	}

	@Override
	public List<User> findAll() {
		String hql = "from User";
		return sessionfactory.getCurrentSession().createQuery(hql, User.class).getResultList();
	}

	@Override
	public void addUser(User user) {
		sessionfactory.getCurrentSession().persist(user);
	}

	@Override
	public void updateUser(User user) {
		sessionfactory.getCurrentSession().merge(user);
	}

	@Override
	public User findUserById(Integer id) {
		String hql = "from User u where u.id=:id";
		return sessionfactory.getCurrentSession().createQuery(hql,User.class).setParameter("id", id).uniqueResult();
	}

	@Override
	public void deleteUser(User user) {
		sessionfactory.getCurrentSession().delete(user);
	}

	@Override
	public List<User> findUserByLike(String uName) {
		String hql = "from User u where u.uName like :uName";
		return sessionfactory.getCurrentSession().createQuery(hql,User.class).setParameter("uName", "%"+uName+"%").getResultList();
	}

}
