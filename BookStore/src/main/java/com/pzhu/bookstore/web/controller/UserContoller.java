package com.pzhu.bookstore.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzhu.bookstore.pojo.Admin;
import com.pzhu.bookstore.pojo.AutoLogin;
import com.pzhu.bookstore.pojo.Message;
import com.pzhu.bookstore.pojo.User;
import com.pzhu.bookstore.service.AdminService;
import com.pzhu.bookstore.service.UserService;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/user")
public class UserContoller {

	@Resource
	private UserService userService;
	@Resource
	private AdminService adminService;
	
	@RequestMapping("/register")
	@ResponseBody
	public Message register(User user, HttpServletRequest request){
		Message msg = new Message();
		try {
			msg =	userService.register(user);
			request.getSession().setAttribute("user", user);
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			msg.setMsg("操作错误");
			return msg;
		}
	}
	
	@RequestMapping("/myAccount")
	public String myAccount(){
		return "myAccount";
	}
	
	@RequestMapping("/login")
	public String login(User user, HttpServletRequest request, Model model, String isAdmin, String auto, HttpServletResponse response){
		Message msg = new Message();
		String path = "";
		HttpSession session = request.getSession();
		if("checked".equals(isAdmin)){
			msg = adminService.login(user.getUsername(), user.getPassword());
			if(msg.getList()!=null){
				Admin admin = (Admin) msg.getList().get(0);
				if(admin!=null){
					session.setAttribute("admin", admin);
					path = "/admin/login/home";
				}else {
					model.addAttribute("msg", msg.getMsg());
					path = "login";
				}
			}else {
				model.addAttribute("msg", msg.getMsg());
				path = "login";
			}
			
		}else {
			msg = userService.login(user);
			if(msg.getUser()!=null){
				session.setAttribute("user", msg.getUser());
				if("checkbox".equals(auto)){
					AutoLogin autoLogin = new AutoLogin();
					autoLogin.setPassword(msg.getUser().getPassword());
					autoLogin.setUsername(msg.getUser().getUsername());
					JsonConfig js = new JsonConfig();
					js.setRootClass(AutoLogin.class);
					JSONObject fromObject = JSONObject.fromObject(autoLogin);
					Cookie cookie = new Cookie("auto", fromObject.toString());
					cookie.setPath("/BookStore");
					cookie.setMaxAge(Integer.MAX_VALUE);
					response.addCookie(cookie);
				}
				path = "redirect:/index/";
			}else {
				model.addAttribute("msg", msg.getMsg());
				path = "login";
			}
		}
		
		return path;
		
	}
	@RequestMapping("/updatePwd")
	public String updatePwd(User user,  HttpServletRequest request){
		Message msg = userService.updatePwd(user);
		request.getSession().setAttribute("user", msg.getUser());
		return "index";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response){
		request.getSession().removeAttribute("user");
		Cookie[] cookies = request.getCookies();
		if(cookies!=null&&cookies.length>0){
			String key = "auto";
			for (Cookie cookie : cookies) {
				if(key.equals(cookie.getName())){
					Cookie cookie2 = new Cookie("auto", null);
					cookie2.setMaxAge(0);
					cookie2.setPath("/BookStore");
					response.addCookie(cookie2);
					break;
				}
			}
			
		}
		return "redirect:/index/";
	}
	
	@RequestMapping("/findAll")
	public String findAll(Model model){
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		return "admin/user/list";
	}
	
	@RequestMapping("/delUser")
	@ResponseBody
	public Message delUser(Integer id)
	{
		Message message=userService.delUser(id);
		return message;
	}
}
