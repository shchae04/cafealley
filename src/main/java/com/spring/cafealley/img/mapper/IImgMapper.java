package com.spring.cafealley.img.mapper;

import com.spring.cafealley.command.ImgVO;

public interface IImgMapper {
	
	//파일 업로드
	void upload(ImgVO vo);
	
	//파일 가져오기?
	ImgVO select(int filenum);
	
	//파일 삭제
	void delete(int filenum);
	
	//방금 업로드한 파일번호 가져오기
	int getLastUploaded();
}
