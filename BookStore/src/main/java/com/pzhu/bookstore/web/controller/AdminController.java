
package com.pzhu.bookstore.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pzhu.bookstore.pojo.Admin;
import com.pzhu.bookstore.pojo.User;
import com.pzhu.bookstore.service.AdminService;
import com.pzhu.bookstore.service.UserService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource
	private AdminService adminservice;
	@Resource
	private UserService userService;
	
	@RequestMapping("findAll")
	public String findAll(Model model, Admin admin)
	{
		List<Admin>admins=adminservice.query(admin);
		model.addAttribute("admins", admins);
		return "admin/admin/admin";
	}
	
	@RequestMapping("deleteById")
	public String findAll(String id)
	{
		adminservice.deleteById(id);
		 return "admin/admin/admin";
	}
	
	@RequestMapping("userlist")
	public String userList(Model model){
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		return "admin/user/list";
	}
	
	@RequestMapping("addAdmin")
	public String addUser(Admin admin, Model model) {
		
		adminservice.addAdmin(admin);
		List<Admin>admins=adminservice.query(new Admin());
		model.addAttribute("admins", admins);
		return "admin/admin/admin";
	}
}
