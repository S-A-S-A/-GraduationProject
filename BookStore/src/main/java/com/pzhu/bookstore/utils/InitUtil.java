package com.pzhu.bookstore.utils;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Component;

import com.pzhu.bookstore.pojo.Kind;
import com.pzhu.bookstore.pojo.PoxyKind;
import com.pzhu.bookstore.service.KindService;
import com.pzhu.bookstore.service.impl.KindServiceImpl;


//@Component
public class InitUtil{

	@Resource
	private KindService kindService;
	
	

	//@PostConstruct
	public void init() {
		List<Kind> kinds = kindService.findAll();
		List<PoxyKind> lists = new ArrayList<>();
		System.out.println("执行了");
		PoxyKind poxyKind = null;
		for (Kind kind : kinds) {
			poxyKind = new PoxyKind(kind);
			System.out.println(kind.getId());
			lists.add(poxyKind);
		}
		
	}
}
