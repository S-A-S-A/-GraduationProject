package com.pzhu.bookstore.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.pzhu.bookstore.dao.KindDao;
import com.pzhu.bookstore.dao.ProductDao;
import com.pzhu.bookstore.pojo.BookInfo;
import com.pzhu.bookstore.pojo.Kind;
import com.pzhu.bookstore.pojo.Message;
import com.pzhu.bookstore.pojo.PoxyKind;
import com.pzhu.bookstore.service.KindService;



@Service
@Transactional
public class KindServiceImpl implements KindService{

	@Resource
	private KindDao kindDao;
	@Resource
	private ProductDao productDao;

	@Override
	public List<Kind> findAll() {
		return kindDao.findAllKind();
	}

	@Override
	public Message addKind(Kind kind) {
		Message msg = new Message();
		Kind kind2 = kindDao.findKindByType(kind.getType());
		if(kind2 == null){
			String id = UUID.randomUUID().toString().substring(0, 4);
			System.out.println(id);
			kind.setId(id);
			kind.setStatus("1");
			kind.setCreatTime(new Date());
			kindDao.addKind(kind);
			msg.setMsg("添加成功");
			msg.setKind(kind);
			return msg;
		}else {
			msg.setMsg("该类型数据库中已存在");
			return msg;
		}
	}

	@Override
	public Message deleteKindById(String kId) {
		Message msg = new Message();
		
		Kind kind = kindDao.findById(kId);
		if(kind!=null){
			/*List<BookInfo> books = productDao.findById(kind.getId());
			if(books.size()>0){
				for (BookInfo book : books) {
					book.setKind(null);
					productDao.updateProduct(book);
				}
			}*/
			//必须先查再删 否则会报错
			kindDao.deleteKindById(kind);
			System.out.println("删除成功");
			msg.setMsg("删除成功");
		}else {
			msg.setMsg("该对象不存在");
		}
		
		return msg;
	}

	@Override
	public Message updateKind(Kind kind) {
		Kind kind1 = kindDao.findKindByType(kind.getType());
		
		Message msg = new Message();
		
		if(kind1 == null){
			kind1 = kindDao.findById(kind.getId());
			kind1.setType(kind.getType());
			kind1.setUpdateTime(new Date());
			kindDao.updateKind(kind1);
			msg.setMsg("修改成功");
			return msg;
		}else{
			msg.setMsg("输入的类型已存在!");
			return msg;
			}
	}
}
