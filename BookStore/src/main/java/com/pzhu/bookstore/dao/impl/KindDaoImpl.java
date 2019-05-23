package com.pzhu.bookstore.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.pzhu.bookstore.dao.KindDao;
import com.pzhu.bookstore.pojo.Kind;



@Repository
public class KindDaoImpl implements KindDao{

	@Resource
	private SessionFactory sessionFactory;

	@Override
	public List<Kind> findAllKind() {
		String hql = "from  Kind k where k.status='1'";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql,Kind.class)
				.getResultList();
	}

	@Override
	public Kind findKindByType(String type) {
		String hql = "from Kind k where k.type=:type";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, Kind.class)
				.setParameter("type", type)
				.uniqueResult();
	}

	@Override
	public void addKind(Kind kind) {
		sessionFactory
		.getCurrentSession()
		.persist(kind);
	}

	@Override
	public void updateKind(Kind kind) {
		sessionFactory
		.getCurrentSession()
		.merge(kind);
	}

	@Override
	public void deleteKindById(Kind kind) {
		kind.setStatus("0");
		sessionFactory
		.getCurrentSession()
		.merge(kind);
	}

	@Override
	public Kind findById(String kId) {
		String hql = "from Kind k where k.id=:kId";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, Kind.class)
				.setParameter("kId", kId)
				.uniqueResult();
	}

	@Override
	public Kind findKindById(String category) {
		String hql = "from Kind k where k.id=:category";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, Kind.class)
				.setParameter("category", category)
				.getSingleResult();
	}
}
