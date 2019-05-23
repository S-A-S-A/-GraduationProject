package com.pzhu.bookstore.web.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pzhu.bookstore.pojo.AutoLogin;
import com.pzhu.bookstore.pojo.Kind;
import com.pzhu.bookstore.pojo.PoxyKind;
import com.pzhu.bookstore.pojo.User;
import com.pzhu.bookstore.service.KindService;
import com.pzhu.bookstore.service.UserService;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

public class LoginFilter implements HandlerInterceptor {

	@Resource
	private KindService kindService;
	@Resource
	private UserService userService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 编码过滤
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		if (req.getServletContext().getAttribute("menu") == null) {
			List<Kind> kinds = kindService.findAll();
			List<PoxyKind> lists = new ArrayList<>();
			PoxyKind poxyKind = null;
			System.out.println("==================加载目录===========================");
			for (Kind kind : kinds) {
				poxyKind = new PoxyKind(kind);
				// System.out.println(kind.getId());
				lists.add(poxyKind);
			}
			req.getServletContext().setAttribute("menu", lists);
		}
		Object object = req.getSession().getAttribute("user");
		if (object == null) {
			Cookie[] cookies = req.getCookies();
			if (cookies != null && cookies.length > 0) {
				JsonConfig js = new JsonConfig();
				js.setRootClass(AutoLogin.class);
				String key = "auto";
				for (Cookie cookie : cookies) {
					String name = cookie.getName();
					// 当cookie里包含登录信息时进行数据库查询登录
					if (key.equals(name)) {
						String value = cookie.getValue();
						JSONObject fromObject = JSONObject.fromObject(value);
						AutoLogin autoLogin = (AutoLogin) JSONSerializer.toJava(fromObject, js);
						User user = userService.loginByUsername(autoLogin);
						if (user != null) {
							System.out.println("=================自动登录===================");
							req.getSession().setAttribute("user", user);
							// req.getRequestDispatcher(req.getContextPath()+"/index").forward(req,
							// resp);
							return true;
						} else {
							System.out.println("=================密码错误===================");
							req.setAttribute("msg", "密码或账号有错");
							req.getRequestDispatcher("/login.jsp").forward(req, resp);
						}
					}
				}
			}
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
