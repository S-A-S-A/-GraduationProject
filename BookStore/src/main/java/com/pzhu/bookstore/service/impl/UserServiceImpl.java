package com.pzhu.bookstore.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.pzhu.bookstore.dao.UserDao;
import com.pzhu.bookstore.pojo.AutoLogin;
import com.pzhu.bookstore.pojo.Message;
import com.pzhu.bookstore.pojo.Order;
import com.pzhu.bookstore.pojo.User;
import com.pzhu.bookstore.service.OrderService;
import com.pzhu.bookstore.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;
	
	@Resource
	private OrderService orderservice;

	@Override
	public Message register(User user) {
		Message msg = new Message();
		if(user.getUsername()!="" && user.getPassword()!="" && user.getEmail()!=""){
			User user2 = userDao.findUserByName(user.getUsername());
			if(user2==null){
				user.setRole("3");
				user.setRegistTime(new Date());
				userDao.addUser(user);
				msg.setMsg("true");
			}else {
				msg.setMsg("用户名已存在");
			}
			
		}else {
			msg.setMsg("请继续完善您的信息");
		}
		
		return msg;
	}

	@Override
	public Message login(User user) {
		Message msg = new Message();
		User user2 = userDao.findUserByName(user.getUsername());
		if(user2!=null){
			if(user2.getPassword().equals(user.getPassword())){
				msg.setUser(user2);
			}else {
				msg.setMsg("密码错误");
			}
		}else {
			msg.setMsg("该用户未注册");
		}
		return msg;
	}
	
	@Override
	public Message updatePwd(User user) {
		Message msg = new Message();
		
		User user2 = userDao.findUserById(user.getId());
		if (user2!=null){
			
			user2.setPassword(user.getPassword());
			user2.setUpdateTime(new Date());
			userDao.updateUser(user2);
			msg.setMsg("修改成功");
			msg.setUser(user2);
			
		}else {
			msg.setMsg("修改失败");
		}
		return msg;
	}
	
	
	@Override
	public List<User> findAll() {
		
		return userDao.findAll();
	}

	
	/*
	 * 删除用户的方法
	 * */
	@Override
	public Message delUser(Integer id) {
		Message message=new Message();
		//查找User
		User user=userDao.findUserById(id);
		try {
			userDao.deleteUser(user);
			message.setMsg("删除成功");
			return message;
		} catch (Exception e) {
			message.setMsg("删除失败");
			return message;
		}
	}

	@Override
	public User loginByUsername(AutoLogin autoLogin) {
		User user = userDao.findUserByName(autoLogin.getUsername());
		if(user!=null && autoLogin.getPassword().equals(user.getPassword())){
			return user;
		}else {
			return null;
		}
		
		
	}
	
}
