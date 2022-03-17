package com.spring.cafealley.img.mapper;

import com.spring.cafealley.command.ImgVO;

public interface IImgMapper {
	
	//파일 업로드
	void upload(ImgVO vo);
	
	
	
	//파일 삭제
	void delete(ImgVO vo);

}
