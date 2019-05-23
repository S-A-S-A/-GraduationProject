package com.pzhu.bookstore.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.pzhu.bookstore.dao.AdminDao;
import com.pzhu.bookstore.pojo.Admin;
import com.pzhu.bookstore.pojo.Message;
import com.pzhu.bookstore.service.AdminService;


@Service
@Transactional
public class AdminServiceImpl implements AdminService{

	@Resource
	private AdminDao adminDao;

	@Override
	public Message login(String username, String password) {
		Message msg = new Message();
		Admin admin = adminDao.findByUsername(username);
		if(admin!=null){
			if (admin.getPassword().equals(password)){
				List<Admin> admins = new ArrayList<>();
				admins.add(admin);
				msg.setList(admins);
			}else {
				msg.setMsg("密码错误");
			}
		}else {
			msg.setMsg("您不是管理员账号");
		}
		return msg;
	}

	
	/*
	 * 查找所有的管理员
	 * */
	@Override
	public List<Admin> query(Admin admin) {
		List<Admin> admins=adminDao.findAll(admin);
		return admins;
	}


	
	@Override
	public Message deleteById(String id) {
		Message message=new Message();
		try {
			Admin admin=adminDao.findById(id);
			adminDao.deleteById(admin);
			message.setMsg("删除成功");
			return message;
		} catch (Exception e) {
			message.setMsg("删除失败");
			e.printStackTrace();
			return message;
		}
		
	}


	@Override
	public Admin addAdmin(Admin admin) {
		String id = UUID.randomUUID().toString().substring(0, 8);
		admin.setId(id);
		admin.setLevel("2");
		admin.setCreatTime(new Date());
		admin.setUpdateTime(new Date());
		adminDao.addAdmin(admin);
		return admin;
	}
	
	
	
	
}
