package com.pzhu.bookstore.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pzhu.bookstore.pojo.BookInfo;
import com.pzhu.bookstore.pojo.Message;
import com.pzhu.bookstore.pojo.Order;
import com.pzhu.bookstore.pojo.User;
import com.pzhu.bookstore.service.OrderService;
import com.pzhu.bookstore.service.ProductService;
import com.pzhu.bookstore.utils.Booklist;
import com.pzhu.bookstore.utils.PageBean;
import com.pzhu.bookstore.utils.UploadUtils;

/**
 * 商品控制层
 * @author sasa4
 *
 */
@Controller
@RequestMapping("/products")
public class ProductController {

	@Resource
	private ProductService productService;
	
	@Resource 
	private OrderService orderService;
	
	
	@RequestMapping("findProductBySearch")
	public String findProductBySearch(Model model, String name, Integer currentPage) {
		
		//初始化显示每页数据
		Integer currentCount = 4;
		if(currentPage!=null){
			if(currentPage<1){
				currentPage = 1;
			}
		}else {
			currentPage = 1;
		}
		PageBean pdBean = productService.findProductBySearch(name, currentCount, currentPage);
		model.addAttribute("pb", pdBean);
		return "product_search";
	}
	
	@RequestMapping("query")
	public String queryList(Model model, String name, Integer currentPage) {
		
		//初始化显示每页数据
		Integer currentCount = 4;
		if(currentPage!=null){
			if(currentPage<1){
				currentPage = 1;
			}
		}else {
			currentPage = 1;
		}
		PageBean pdBean = productService.findProductBySearch(name, currentCount, currentPage);
		model.addAttribute("pb", pdBean);
		return "product_search_list";
	}
	
	/**
	 * 查找所有商品
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAll")
	public String findAll(Model model){
		List<BookInfo> books = productService.findAll();
		model.addAttribute("books", books);
		return "admin/products/list";
	}
	
	/**
	 * 添加商品
	 * 
	 * @param bookInfo
	 * @param file
	 * @param category
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/addProduct")
	public String addProduct(BookInfo bookInfo, MultipartFile file, String category,  HttpServletRequest request, Model model){
		Message msg = new Message();
		try {
			if(!file.isEmpty()){
				String address = UploadUtils.upfile(file, request);
				bookInfo.setImagePath(address);
			}
			msg = productService.addBook(bookInfo, category);
			model.addAttribute("msg", msg.getMsg());
		} catch (Exception e) {
			e.printStackTrace();
			msg.setMsg("操作异常");
		}
		
		return "admin/products/add";
	}
	
	/**
	 * 通过主键查找商品信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/findById")
	public String findById(String id, Model model){
		BookInfo book = productService.findById(id);
		model.addAttribute("book", book);
		return "admin/products/edit";
	}
	
	/**
	 * 更新商品
	 * @param bookInfo
	 * @param category
	 * @param model
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("/updateProduct")
	public String updateProduct(BookInfo bookInfo, String category, Model model, HttpServletRequest request, MultipartFile file){
		Message msg = new Message();
		try {
			if(!file.isEmpty()){
				String address = UploadUtils.upfile(file, request);
				bookInfo.setImagePath(address);
			}
			msg = productService.UpdateBook(bookInfo, category);
			model.addAttribute("msg", msg.getMsg());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "操作异常");
		}
		return "redirect:findAll";
	}
	
	
	@RequestMapping("/deleteById")
	@ResponseBody
	public String deleteById(String id, Model model){
		if(id!=null){
			try {
				productService.deleteById(id);
				return "yes";
			} catch (Exception e) {
				e.printStackTrace();
				
			}
		}
		return "no";
		
	}
	
	@RequestMapping("/deleteAll")
	public String deleteAll(String str, Model model){
		productService.deleteAll(str);
		return "redirect:findAll";
	}
	
	@RequestMapping("/{category}/findByKind")
	public String findByKind(@PathVariable String category, Model model, Integer currentPage){
		//初始化显示每页数据
		Integer currentCount = 4;
		if(currentPage!=null){
			if(currentPage<1){
				currentPage = 1;
			}
		}else {
			currentPage = 1;
		}
		
		PageBean pageBean = productService.findByKind(category,currentCount,currentPage);
		model.addAttribute("pb", pageBean);
		return "product_list";
	}
	
	@RequestMapping("/{id}/findBookInfoById")
	public String findBookInfoById(@PathVariable String id, Model model){
		BookInfo book = productService.findById(id);
		model.addAttribute("b", book);
		return "product_info";
	}
	
	@RequestMapping("/addCart")
	@ResponseBody
	public String addCart(String id, HttpServletRequest request, HttpServletResponse response){
		String flag = productService.addCart(id, request, response);
		
		return flag;
	}
	
	@RequestMapping("/validStock")
	@ResponseBody
	public String validStock(String id){
		Boolean flag = productService.validStock(id);
		if(flag){
			return "yes";
		}else {
			return "no";
		}
	}
	
	@RequestMapping("/{id}/buy")
	public String buy(@PathVariable String id, HttpServletRequest request, Model model, HttpServletResponse response){
		String flag = productService.addCart(id, request, response);
		List<Booklist> booklists = productService.findAllProducts(id, request);
		double all = 0.0;
		
		for (Booklist booklist : booklists) {
			all = all + booklist.getSum();
		}
		model.addAttribute("b", booklists);
		model.addAttribute("all", String.format("%.2f", all));
		return "cart";
	}
	
	@RequestMapping("/deleteCart")
	public @ResponseBody String deleteCart(String id, HttpServletRequest request, HttpServletResponse response){
		String result = productService.deleteCart(id, request, response);
		return result;
	}
	
	@RequestMapping("/myCart")
	public String myCart(HttpServletRequest request, Model model){
		List<Booklist> booklists = productService.myCart(request);
		double all = 0.0;
		
		for (Booklist booklist : booklists) {
			all = all + booklist.getSum();
		}
		model.addAttribute("b", booklists);
		model.addAttribute("all", String.format("%.2f", all));
		return "cart";
	}
	
	@RequestMapping("/buyProducts")
	public String buyProducts(HttpServletRequest request, HttpServletResponse response,Model model){
		List<Booklist> booklists = productService.buyProducts(request,response);
		double all = 0.0;
		
		for (Booklist booklist : booklists) {
			all = all + booklist.getSum();
		}
		model.addAttribute("b", booklists);
		model.addAttribute("all", String.format("%.2f", all));
		return "order";
	}
	
	@RequestMapping("/addOrder")
	public String addOrder(Order order, HttpServletRequest request, HttpServletResponse response,Model model, String token){
		List<Booklist> booklists = productService.buyProducts(request,response);
		
		
		User user = (User) request.getSession().getAttribute("user");
		PageBean pageBean = orderService.addOrder(booklists, user, order);
		
		if(pageBean.isSuccess()) {
			model.addAttribute("orders", pageBean.getOrder());
			productService.deleteCookies(request, response);
			return "orderInfo";
		}else {
			model.addAttribute("msg", pageBean.getMsg());
			model.addAttribute("b", booklists);
			return "order";
		}
		
		
		
	}
	
	@RequestMapping("/search")
	public String search(String id, String category, String bookName, String minprice, String maxprice,Model model){
		List<BookInfo> books = productService.search(id, category, bookName,minprice,maxprice);
		model.addAttribute("books", books);
		return "admin/products/list";
	}
}
