package com.pzhu.bookstore.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzhu.bookstore.pojo.Kind;
import com.pzhu.bookstore.pojo.Message;
import com.pzhu.bookstore.service.KindService;


@Controller
@RequestMapping("/kinds")
public class KindController {

	@Resource
	private KindService kindService;

	@RequestMapping("/findAll")
	public String findAll(Model model){
		List<Kind> kinds = kindService.findAll();
		model.addAttribute("kinds", kinds);
		return "admin/products/bookKind";
	}
	
	@RequestMapping("/addKind")
	@ResponseBody
	public Message addKind(Kind kind){
		try {
			Message msg = kindService.addKind(kind);
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			Message msg = new Message();
			msg.setMsg("操作异常");
			return msg;
		}	
	}
	
	@RequestMapping("/deleteKind")
	public @ResponseBody Message deleteKind(String kId){
		try {
			Message msg = kindService.deleteKindById(kId);
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			Message msg = new Message();
			msg.setMsg("操作异常");
			return msg;
		}
		
	}
	
	@RequestMapping("/updateKind")
	@ResponseBody
	public Message updateKind(Kind kind){
		
		try {
			Message msg = kindService.updateKind(kind);
			return msg;
		} catch (Exception e) {
			e.printStackTrace();
			Message msg = new Message();
			msg.setMsg("操作异常");
			return msg;
		}
		
	}
}
