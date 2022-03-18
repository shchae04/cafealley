package com.spring.cafealley.img.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cafealley.command.ImgVO;


public interface IImgService {

	//파일 업로드
	void upload(List<MultipartFile> files);
	
	//파일 가져오기?
	ImgVO select(int filenum);
		
	//파일 삭제
	void delete(int filenum);
	
	// 방금 업로드한 파일번호가져오기
	int getLastUploaded();
}
