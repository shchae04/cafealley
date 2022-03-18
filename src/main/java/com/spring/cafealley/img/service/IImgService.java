package com.spring.cafealley.img.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.spring.cafealley.command.ImgVO;

public interface IImgService {

	//파일 업로드
	void upload(MultipartFile files,String filename, HttpSession session);
	
	//파일 가져오기?
	ImgVO select(int filenum);
		
	//파일 삭제
	void delete(int filenum);
}
