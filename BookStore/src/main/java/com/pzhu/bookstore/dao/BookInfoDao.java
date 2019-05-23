package com.pzhu.bookstore.dao;

import com.pzhu.bookstore.pojo.BookInfo;
import com.pzhu.bookstore.pojo.Kind;

public interface BookInfoDao {
	
	BookInfo selectById(String id);
	
	void updateKind(BookInfo bookInfo);

}
