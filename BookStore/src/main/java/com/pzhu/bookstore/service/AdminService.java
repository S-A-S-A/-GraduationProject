package com.pzhu.bookstore.service;

import java.util.List;

import com.pzhu.bookstore.pojo.Admin;
import com.pzhu.bookstore.pojo.Message;


public interface AdminService {

	Message login(String username, String password);

	/**
	 * @return
	 * List<Admin>
	 */
	List<Admin> query(Admin admin);

	/**
	 * @param id
	 * void
	 */
	Message deleteById(String id);

	Admin addAdmin(Admin admin);

}
