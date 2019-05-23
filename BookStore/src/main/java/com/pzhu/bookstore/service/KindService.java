package com.pzhu.bookstore.service;

import java.util.List;

import com.pzhu.bookstore.pojo.Kind;
import com.pzhu.bookstore.pojo.Message;


public interface KindService {

	List<Kind> findAll();

	Message addKind(Kind kind);

	Message deleteKindById(String kId);

	Message updateKind(Kind kind);
	

}
