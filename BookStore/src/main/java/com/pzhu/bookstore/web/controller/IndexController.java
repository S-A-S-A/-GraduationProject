package com.pzhu.bookstore.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pzhu.bookstore.pojo.OrderBook;
import com.pzhu.bookstore.service.IndexService;
import com.pzhu.bookstore.service.KindService;


@Controller
@RequestMapping(value={"/index","/"})
public class IndexController {

	@Resource
	private KindService kindService;
	@Resource
	private IndexService indexService;
	
	@RequestMapping(value={"/","","index.jsp"})
	public String index(HttpServletRequest request, Model model){
		/*查询出最近七天销量最好的书籍*/
		List<OrderBook> orderBooks = indexService.queryHotBook();
		
		model.addAttribute("orderBooks", orderBooks);
		return "index";
	}
}
