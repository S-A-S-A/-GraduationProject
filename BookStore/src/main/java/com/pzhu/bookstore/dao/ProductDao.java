package com.pzhu.bookstore.dao;

import java.util.List;

import com.pzhu.bookstore.pojo.BookInfo;

public interface ProductDao {

	List<BookInfo> findAll();

	List<BookInfo> findById(String id);

	void updateProduct(BookInfo book);

	BookInfo findByBookName(String bookName);
	
	List<BookInfo> findBookByLikeName(String bookName, Integer currentCount, Integer currentPage);

	void add(BookInfo bookInfo);

	BookInfo findByBookInfoId(String id);

	void delete(BookInfo bookInfo);

	int findSumBooks(String category);

	List<BookInfo> findByKind(Integer currentCount, Integer currentPage, String category);

	List<BookInfo> searchBooks(String id, String kind_id, String bookName, String minprice, String maxprice);

	int countBookByLikeName(String name);

}
