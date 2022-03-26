package com.spring.cafealley.shopboard.service;

import java.util.List;

import com.spring.cafealley.command.ShopboardVO;

public interface IShopboardService {

	// 글 등록
	void regist(ShopboardVO vo);
	
	// 글 조회
	List<ShopboardVO> getList();
	
	// 글 상세조회
	ShopboardVO getContent(int bno);
	
	// 글 수정
	void modify(ShopboardVO vo);
	
	// 글 삭제
	void delete(int bno);
	
	// 조회수 증가
	void hit(int bno);
}
