package com.pzhu.bookstore.dao;

import java.util.List;

import com.pzhu.bookstore.pojo.Admin;

public interface AdminDao {

	Admin findByUsername(String username);

	/**
	 * @return
	 * List<Admin>
	 */
	List<Admin> findAll(Admin admin);

	/**
	 * @param admin
	 * void
	 */
	void deleteById(Admin admin);

	/**
	 * @param id
	 * @return
	 * Admin
	 */
	Admin findById(String id);
	
	void addAdmin(Admin admin);

}
