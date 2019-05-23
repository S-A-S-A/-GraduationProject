package com.pzhu.bookstore.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.pzhu.bookstore.dao.ProductDao;
import com.pzhu.bookstore.pojo.BookInfo;


@Repository
public class ProductDaoImpl implements ProductDao {

	@Resource
	private SessionFactory sessionFactory;

	@Override
	public List<BookInfo> findAll() {
		String hql = "from BookInfo b where b.status='1'";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, BookInfo.class)
				.getResultList();
	}

	@Override
	public List<BookInfo> findById(String id) {
		String hql = "from BookInfo b where kind_id=:id";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, BookInfo.class)
				.setParameter("id", id)
				.getResultList();
	}

	@Override
	public void updateProduct(BookInfo book) {
		sessionFactory.getCurrentSession().merge(book);
	}

	@Override
	public BookInfo findByBookName(String bookName) {
		String hql = "from BookInfo b where b.bookName=:bookName";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql,BookInfo.class)
				.setParameter("bookName", bookName)
				.uniqueResult();
	}
	

	@Override
	public void add(BookInfo bookInfo) {
		sessionFactory
		.getCurrentSession()
		.merge(bookInfo);
	}
	
	@Override
	public BookInfo findByBookInfoId(String id) {
		String hql = "from BookInfo b where b.id=:id";
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, BookInfo.class)
				.setParameter("id", id)
				.uniqueResult();
	}

	@Override
	public void delete(BookInfo bookInfo) {
		bookInfo.setStatus("0");
		sessionFactory
		.getCurrentSession()
		.merge(bookInfo);
	}

	@Override
	public int findSumBooks(String category) {
	
		String hql = "from BookInfo b where kind_id=:category";
		/*Query query = sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter(0, category);
		int count = ((Long)query.iterate().next()).intValue();*/
			
		return sessionFactory
				.getCurrentSession()
				.createQuery(hql, BookInfo.class)
				.setParameter("category", category)
				.getResultList().size();
	}

	@Override
	public List<BookInfo> findByKind(Integer currentCount, Integer currentPage, String category) {
		Integer start = (currentPage-1)*currentCount;
		String hql = "from BookInfo b where kind_id=:category";
		Query query = sessionFactory.getCurrentSession().createQuery(hql).setParameter("category", category);

        //得到滚动结果集
        ScrollableResults scroll = query.scroll();
        //滚动到最后一行
        scroll.last();
        int i = scroll.getRowNumber() + 1;
        System.out.println("总计路数：" + i);

        //设置分页位置
        query.setFirstResult(start);
        query.setMaxResults(currentCount);

        System.out.println(query.list());
		return query.list();
	}

	public List<BookInfo> searchBooks(String id, String kind_id) {
		String sql = "from BookInfo where 1=1";
		List<BookInfo> bookInfos = new ArrayList<>();
		Session session = sessionFactory.getCurrentSession();
	
		if(!"".equals(id.trim()) &&!"".equals(kind_id)){//去掉空格
			sql += " and id like :id and kind_id=:kind_id";
			bookInfos = session
					.createQuery(sql, BookInfo.class)
					.setParameter("id", id)
					.setParameter("kind_id", kind_id)
					.getResultList();
		}else	if(!"".equals(kind_id)){
			sql += " and kind_id=:kind_id";
			bookInfos = session
					.createQuery(sql, BookInfo.class)
					.setParameter("kind_id", kind_id)
					.getResultList();
		}else if (!"".equals(id)) {
			sql += " and id like :id";
			bookInfos = session
					.createQuery(sql, BookInfo.class)
					.setParameter("id", id)
					.getResultList();
		}else{
			bookInfos = session
					.createQuery(sql, BookInfo.class)
					.getResultList();
		}
		
		return bookInfos;
	}
	
	@Override
	public List<BookInfo> searchBooks(String id, String kind_id, String bookName, String minprice, String maxprice) {
		String hql = "from BookInfo where 1=1";
		List<BookInfo> bookInfos = new ArrayList<>();
		if(!"".equals(id.trim()) && id!=null){
			hql += " and id like '%"+id+"%'";
		}
		if(!"".equals(kind_id) && kind_id!=null ){
			hql += " and kind_id='"+kind_id+"'";
			
		}
		if(!"".equals(bookName) && bookName!=null){
			hql += " and bookName like '%"+bookName+"%'";
			
		}
		if(!"".equals(minprice) && minprice!=null ){
			hql += " and price>"+minprice;
			
		}
		if(!"".equals(maxprice) && maxprice!=null){
			hql += " and price<"+maxprice;
			
		}
		System.out.println(hql);
		bookInfos = sessionFactory
				.getCurrentSession()
				.createQuery(hql)
				.getResultList();
		return bookInfos;
	}

	@Override
	public List<BookInfo> findBookByLikeName(String bookName, Integer currentCount, Integer currentPage) {
		String hql = "from BookInfo where 1=1";
		
		if(bookName!=null && bookName.trim() != "") {
			hql += "and bookName like '%"+bookName+"%'";
		}
		
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

        //得到滚动结果集
        ScrollableResults scroll = query.scroll();
        //滚动到最后一行
        scroll.last();
        int i = scroll.getRowNumber() + 1;
        System.out.println("总计路数：" + i);

        //设置分页位置
        Integer start = (currentPage-1)*currentCount;
        query.setFirstResult(start);
        query.setMaxResults(currentCount);

        System.out.println(query.list());
		return query.list();
	}

	@Override
	public int countBookByLikeName(String bookName) {
		String hql = "from BookInfo where 1=1";
		
		if(bookName!=null && bookName.trim() != "") {
			hql += "and bookName like '%"+bookName+"%'";
		}
		return sessionFactory.getCurrentSession().createQuery(hql).getResultList().size();
	}
	
	
}
