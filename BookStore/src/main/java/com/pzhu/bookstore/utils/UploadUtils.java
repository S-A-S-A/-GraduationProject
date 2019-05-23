package com.pzhu.bookstore.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;


public class UploadUtils {

	public static String upfile(MultipartFile multipartFile, HttpServletRequest request) {
		//获取项目在Tomcat上的路径
		String realPath = request.getSession().getServletContext().getRealPath("/");
		
		String localPath = "D:\\项目\\毕业设计\\刀妹\\BookStore\\src\\main\\webapp\\";
		//设置文件上传后的保存路径
		String savePath = "/images/upFile/";
		
		File file = new File(realPath+savePath);
		File file2 = new File(localPath+savePath);
		if(!file.exists()){
			file.mkdirs();
		}
		if(!file2.exists()){
			file2.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmSSS");
		String format = sdf.format(new Date());
		//获取文件扩展名
		String extendsName = multipartFile.getOriginalFilename();
		//获取文件的后缀名
		String suffix = extendsName.substring(extendsName.lastIndexOf("."));
		String filename = format+suffix;
		String path = realPath+savePath;
		String imagePath = savePath+filename;
		try {
			multipartFile.transferTo(new File(path+filename));
			multipartFile.transferTo(new File(localPath+savePath+filename));
			return imagePath;
		} catch (IllegalStateException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return "";
	}
}
