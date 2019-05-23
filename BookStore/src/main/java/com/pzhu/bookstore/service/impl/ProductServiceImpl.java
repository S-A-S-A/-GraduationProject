package com.pzhu.bookstore.service.impl;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.springframework.stereotype.Service;

import com.pzhu.bookstore.dao.KindDao;
import com.pzhu.bookstore.dao.ProductDao;
import com.pzhu.bookstore.pojo.BookInfo;
import com.pzhu.bookstore.pojo.Kind;
import com.pzhu.bookstore.pojo.Message;
import com.pzhu.bookstore.service.ProductService;
import com.pzhu.bookstore.utils.BookCart;
import com.pzhu.bookstore.utils.Booklist;
import com.pzhu.bookstore.utils.PageBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;


@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Resource
	private ProductDao productDao;
	@Resource
	private KindDao kindDao;
	
	

	@Override
	public List<BookInfo> findAll() {

		return productDao.findAll();
	}

	@Override
	public Message addBook(BookInfo bookInfo, String category) {
		Message msg = new Message();
		Kind kind = kindDao.findKindById(category);
		if (kind != null) {
			BookInfo book = productDao.findByBookName(bookInfo.getBookName());
			if (book == null) {
				String id = UUID.randomUUID().toString().substring(0, 8);
				bookInfo.setId(id);
				bookInfo.setKind(kind);
				bookInfo.setStatus("1");
				productDao.add(bookInfo);
				msg.setMsg("添加成功");
			} else {
				msg.setMsg("该商品已存在，请勿重复添加！");
			}
		} else {
			msg.setMsg("类型不存在");
		}

		return msg;
	}

	@Override
	public BookInfo findById(String id) {
		BookInfo bookInfo = productDao.findByBookInfoId(id);
		return bookInfo;
	}

	@Override
	public Message UpdateBook(BookInfo bookInfo, String category) {
		Message msg = new Message();
		Kind kind = kindDao.findKindById(category);
		if (kind != null) {
			BookInfo book = productDao.findByBookInfoId(bookInfo.getId());
			if (book != null) {
				bookInfo.setKind(kind);
				bookInfo.setStatus("1");
				productDao.updateProduct(bookInfo);
				msg.setMsg("修改成功");
			} else {
				msg.setMsg("该商品不存在");
			}
		} else {
			msg.setMsg("类型不存在");
		}

		return msg;
	}

	@Override
	public void deleteById(String id) {
		BookInfo bookInfo = productDao.findByBookInfoId(id);
		productDao.delete(bookInfo);
	}

	@Override
	public void deleteAll(String str) {
		String[] ids = str.split("&");
		for (String id : ids) {
			BookInfo bookInfo = productDao.findByBookInfoId(id);
			productDao.delete(bookInfo);
		}
	}

	@Override
	public PageBean findByKind(String category, Integer currentCount, Integer currentPage) {
		// List<BookInfo> list = productDao.findById(category);
		int totalCount;
		try {
			
			totalCount = productDao.findSumBooks(category);
			int totlaPage = (int) Math.ceil(totalCount * 1.0 / currentCount);// 总页数
			List<BookInfo> list = productDao.findByKind(currentCount, currentPage, category);
			PageBean pb = new PageBean();
			pb.setTotalPage(totlaPage);
			pb.setCurrentCount(currentCount);
			pb.setPs(list);
			pb.setTotalCount(totalCount);
			pb.setCurrentPage(currentPage);
			pb.setCategory(category);
			pb.setType(kindDao.findById(category).getType());
			return pb;
		} catch (Exception e) {

			e.printStackTrace();
		} // 总条数
		return null;
	}

	@Override
	public Boolean validStock(String id) {
		BookInfo bookInfo = productDao.findByBookInfoId(id);
		System.out.println(bookInfo.getCount());
		if (bookInfo.getCount() > 0) {
			return true;
		} else {
			return false;
		}

	}

	// ====================购物车 Cookie模块==============================
	@Override
	public String addCart(String id, HttpServletRequest request, HttpServletResponse response) {
		List<BookCart> carts = new ArrayList<>();
		// json配置
		JsonConfig js = new JsonConfig();
		// 设置需要转化的类
		js.setRootClass(BookCart.class);

		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			String key = "bookstore";
			for (Cookie cookie : cookies) {
				String name = cookie.getName();
				if (key.equals(name)) {
					String value = cookie.getValue();
					// 转化value 的字符编码
					// value = URLEncoder.encode(value);
					// 将json格式的字符串转化为json数组
					JSONArray jsonArray = JSONArray.fromObject(value);
					// 把js数组转化为java集合
					carts = (List<BookCart>) JSONSerializer.toJava(jsonArray, js);
					// 判断是否存在
					boolean isExsit = false;
					for (BookCart cart : carts) {
						if (id.equals(cart.getId())) {
							Integer count = cart.getQuantity();
							count++;
							cart.setQuantity(count);
							isExsit = true;
						}
					}
					// 如果不存在 加入购物车中
					if (!isExsit) {
						BookCart cart = new BookCart();
						cart.setId(id);
						cart.setQuantity(1);
						carts.add(cart);
					}

				} // 2 if

			} // for

		} // 1 if
		if (carts.size() == 0) {
			BookCart cart = new BookCart();
			cart.setId(id);
			cart.setQuantity(1);
			carts.add(cart);
		}
		// 把java集合转化为json数组
		JSONArray jsonArray = JSONArray.fromObject(carts);
		// 将json数组转化为string类型
		String result = jsonArray.toString();

		Cookie cookie = new Cookie("bookstore", result);
		cookie.setPath("/BookStore");
		cookie.setMaxAge(Integer.MAX_VALUE);
		response.addCookie(cookie);
		return "yes";
	}

	@Override
	public List<Booklist> findAllProducts(String id, HttpServletRequest request) {
		List<Booklist> booklists = new ArrayList<>();
		// BookInfo bookInfo = productDao.findByBookInfoId(id);
		//
		// booklist.setBook(bookInfo);
		JsonConfig jsonConfig = new JsonConfig();

		jsonConfig.setRootClass(BookCart.class);
		boolean isExsit = false;
		Cookie[] cookies = request.getCookies();
		List<BookCart> carts = new ArrayList<>();
		if (cookies != null && cookies.length > 0) {
			String key = "bookstore";
			for (Cookie cookie : cookies) {
				String name = cookie.getName();
				if (key.equals(name)) {
					String value = cookie.getValue();
					JSONArray jsonArray = JSONArray.fromObject(value);
					carts = (List<BookCart>) JSONSerializer.toJava(jsonArray, jsonConfig);

					for (BookCart cart : carts) {
						BookInfo bookInfo = productDao.findByBookInfoId(cart.getId());
						Booklist booklist = new Booklist();
						booklist.setBook(bookInfo);
						if (bookInfo.getId().equals(id)) {
							Integer count = cart.getQuantity();
							count++;
							booklist.setQuantity(count);
							isExsit = true;
						} else {
							booklist.setQuantity(cart.getQuantity());
						}
						booklist.setSum(bookInfo.getPrice() * booklist.getQuantity());
						booklists.add(booklist);
					}
				}

			} // for

		}
		if (!isExsit) {
			BookInfo bookInfo = productDao.findByBookInfoId(id);
			Booklist booklist = new Booklist();
			booklist.setBook(bookInfo);
			booklist.setSum(bookInfo.getPrice());
			booklist.setQuantity(1);
			booklists.add(booklist);
		}
		return booklists;
	}

	@Override
	public String deleteCart(String id, HttpServletRequest request, HttpServletResponse response) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setRootClass(BookCart.class);

		Cookie[] cookies = request.getCookies();

		List<BookCart> carts = new ArrayList<>();
		if (cookies != null && cookies.length > 0) {
			String key = "bookstore";
			for (Cookie cookie : cookies) {
				String name = cookie.getName();
				if (key.equals(name)) {
					String value = cookie.getValue();
					JSONArray jsonArray = JSONArray.fromObject(value);
					carts = (List<BookCart>) JSONSerializer.toJava(jsonArray, jsonConfig);
					for (int i = 0; i < carts.size(); i++) {
						BookCart cart = carts.get(i);
						if (id.equals(cart.getId())) {
							carts.remove(i);
						}
					}

				}

			}
		}
		// 把java集合转化为json数组
		JSONArray jsonArray = JSONArray.fromObject(carts);
		// 将json数组转化为string类型
		String result = jsonArray.toString();

		Cookie cookie = new Cookie("bookstore", result);
		cookie.setPath("/BookStore");
		cookie.setMaxAge(Integer.MAX_VALUE);
		response.addCookie(cookie);
		return "yes";
	}
	// =========================================================================

	@Override
	public List<Booklist> myCart(HttpServletRequest request) {
		List<Booklist> booklists = new ArrayList<>();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setRootClass(BookCart.class);

		Cookie[] cookies = request.getCookies();
		List<BookCart> carts = new ArrayList<>();
		if (cookies != null && cookies.length > 0) {
			String key = "bookstore";
			for (Cookie cookie : cookies) {
				String name = cookie.getName();
				if (key.equals(name)) {
					String value = cookie.getValue();
					JSONArray jsonArray = JSONArray.fromObject(value);
					carts = (List<BookCart>) JSONSerializer.toJava(jsonArray, jsonConfig);

					for (BookCart cart : carts) {
						BookInfo bookInfo = productDao.findByBookInfoId(cart.getId());
						Booklist booklist = new Booklist();
						booklist.setBook(bookInfo);

						booklist.setQuantity(cart.getQuantity());
						booklist.setSum(bookInfo.getPrice() * booklist.getQuantity());
						booklists.add(booklist);
					}
				}

			} // for

		}
		return booklists;
	}

	@Override
	public List<Booklist> buyProducts(HttpServletRequest request, HttpServletResponse response) {
		List<Booklist> booklists = new ArrayList<>();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setRootClass(BookCart.class);

		Cookie[] cookies = request.getCookies();
		List<BookCart> carts = new ArrayList<>();
		if (cookies != null && cookies.length > 0) {
			String key = "bookstore";
			for (Cookie cookie : cookies) {
				String name = cookie.getName();
				if (key.equals(name)) {
					String value = cookie.getValue();
					JSONArray jsonArray = JSONArray.fromObject(value);
					carts = (List<BookCart>) JSONSerializer.toJava(jsonArray, jsonConfig);

					for (BookCart cart : carts) {
						BookInfo bookInfo = productDao.findByBookInfoId(cart.getId());
						Booklist booklist = new Booklist();
						booklist.setBook(bookInfo);

						booklist.setQuantity(cart.getQuantity());
						booklist.setSum(bookInfo.getPrice() * booklist.getQuantity());
						booklists.add(booklist);
					}
				}

			} // for

		}
		return booklists;
	}
	
	@Override
	public void deleteCookies(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		if(cookies!=null && cookies.length>0){
			String key = "bookstore";
			Cookie cookie = new Cookie(key, null);
			cookie.setPath("/BookStore");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			/*for (Cookie cookie : cookies) {
				String name = cookie.getName();
				if(key.equals(name)){
					
				}
			}*/
		}
	}

	@Override
	public List<BookInfo> search(String id, String kind_id, String bookName, String minprice, String maxprice) {
		List<BookInfo> list = null;
		try {
			list = productDao.searchBooks(id,kind_id, bookName,minprice,maxprice);
			if(list!=null){
				return list;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		
		return null;
	}

	@Override
	public PageBean findProductBySearch(String name, Integer currentCount, Integer currentPage) {
		int totalCount;
		try {
			
			totalCount = productDao.countBookByLikeName(name);
			int totlaPage = (int) Math.ceil(totalCount * 1.0 / currentCount);// 总页数
			List<BookInfo> list = productDao.findBookByLikeName(name, currentCount, currentPage);
			PageBean pb = new PageBean();
			pb.setTotalPage(totlaPage);
			pb.setCurrentCount(currentCount);
			pb.setPs(list);
			pb.setTotalCount(totalCount);
			pb.setBookName(name);
			pb.setCurrentPage(currentPage);
			return pb;
		} catch (Exception e) {

			e.printStackTrace();
		} // 总条数
		return null;
		
	}
}
