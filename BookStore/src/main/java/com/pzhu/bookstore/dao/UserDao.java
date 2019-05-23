package com.pzhu.bookstore.dao;

import java.util.List;

import com.pzhu.bookstore.pojo.User;



public interface UserDao {
	
	public User findUserByName(String uName);

	public List<User> findAll();

	public void addUser(User user);

	public void updateUser(User user);

	public User findUserById(Integer id);

	public void deleteUser(User user);

	public List<User> findUserByLike(String uName);
}
