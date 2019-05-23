package com.pzhu.bookstore.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pzhu.bookstore.pojo.BookInfo;
import com.pzhu.bookstore.pojo.Message;
import com.pzhu.bookstore.utils.Booklist;
import com.pzhu.bookstore.utils.PageBean;


public interface ProductService {

	List<BookInfo> findAll();

	Message addBook(BookInfo bookInfo, String category);

	BookInfo findById(String id);

	Message UpdateBook(BookInfo bookInfo, String category);

	void deleteById(String id);

	void deleteAll(String str);

	PageBean findByKind(String category, Integer currentCount, Integer currentPage);

	Boolean validStock(String id);

	String addCart(String id, HttpServletRequest request, HttpServletResponse response);

	List<Booklist> findAllProducts(String id, HttpServletRequest request);

	String deleteCart(String id, HttpServletRequest request, HttpServletResponse response);

	List<Booklist> myCart(HttpServletRequest request);

	List<Booklist> buyProducts(HttpServletRequest request, HttpServletResponse response);

	void deleteCookies(HttpServletRequest request, HttpServletResponse response);

	List<BookInfo> search(String id, String kind_id, String bookName, String minprice, String maxprice);
	
	PageBean findProductBySearch(String name, Integer currentCount, Integer currentPage);

}
