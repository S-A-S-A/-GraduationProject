package com.pzhu.bookstore.service;

import java.util.List;

import com.pzhu.bookstore.pojo.AutoLogin;
import com.pzhu.bookstore.pojo.Message;
import com.pzhu.bookstore.pojo.User;


public interface UserService {

	Message register(User user);

	Message login(User user);

	Message updatePwd(User user);

	List<User> findAll();

	/**
	 * @param id
	 * @return
	 * Message
	 */
	Message delUser(Integer id);

	User loginByUsername(AutoLogin autoLogin);

}
