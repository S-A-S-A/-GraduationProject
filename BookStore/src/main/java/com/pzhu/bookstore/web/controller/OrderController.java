package com.pzhu.bookstore.web.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzhu.bookstore.pojo.Order;
import com.pzhu.bookstore.pojo.OrderBook;
import com.pzhu.bookstore.pojo.User;
import com.pzhu.bookstore.service.OrderService;


@Controller
@RequestMapping("/order")
public class OrderController {

	@Resource
	private OrderService orderService;
	
	@RequestMapping("/orderlist")
	public String orderlist(HttpServletRequest request, Model model){
		User user = (User) request.getSession().getAttribute("user");
		List<Order> orders = orderService.findMyOrder(user.getId());
		model.addAttribute("orders", orders);
		model.addAttribute("size", orders.size());
		return "orderlist";
	}
	
	@RequestMapping("/{id}/orderInfo")
	public String orderInfo(@PathVariable String id, Model model){
		Order order = orderService.findById(id);
		model.addAttribute("orders", order);
		return "orderInfo";
	}
	
	@RequestMapping("/findAll")
	public String findAll(Model model){
		List<Order> orders = orderService.findAll();
		model.addAttribute("orders", orders);
		return "admin/orders/list";
	}
	
	
	@RequestMapping("/salesList")
	public String salesList(Model model, String range){
		Date startDate = null;
		Date endDate = null;
		if(range!=null && range.trim()!=null) {
			range = range.trim();
			String[] strings = range.split(" - ");
			
			if(strings.length == 2) {
				String startTimeString = strings[0];
				String endTimeString = strings[1];
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
				try {
					startDate = sdf.parse(startTimeString);
					endDate = sdf.parse(endTimeString);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}else {
			endDate = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(endDate);
			calendar.add(Calendar.MONTH, -31);
			startDate = calendar.getTime();
		}
		
		if(startDate == null || endDate == null) {
			model.addAttribute("msg", "条件错误");
			return "admin/products/salelist";
		}
		
		List<OrderBook> orderBooks = orderService.salesList(startDate, endDate);
		model.addAttribute("orderBooks", orderBooks);
		return "admin/products/salelist";
	}
	
	@RequestMapping("/{id}/findById")
	public String findById(@PathVariable String id, Model model){
		Order order = orderService.findById(id);
		model.addAttribute("order", order);
		return "admin/orders/view";
	}
	
	@RequestMapping("/deleteOrder")
	public @ResponseBody String deleteOrder(String id){
		String falg = orderService.deleteOrder(id);
		return falg;
	}
	
	@RequestMapping("/search")
	public String search(String id,  String receiverName, Model model){
		List<Order> orders = orderService.search(id, receiverName);
		model.addAttribute("orders", orders);
		return "admin/orders/list";
	}
	
	@RequestMapping("/toPay")
	public String toPay(String orderId, Model model) {
		Order order = orderService.findById(orderId);
		
		model.addAttribute("order", order);
		return "pay";
	}
	
	@RequestMapping("/pay")
	public String pay(String orderId, Model model, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		List<Order> orders = orderService.payOrder(user.getId(), orderId);
		model.addAttribute("orders", orders);
		model.addAttribute("size", orders.size());
		return "orderlist";
	}
}
