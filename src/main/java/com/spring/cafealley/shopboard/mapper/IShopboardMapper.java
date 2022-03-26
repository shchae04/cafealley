package com.spring.cafealley.shopboard.mapper;

import java.util.List;

import com.spring.cafealley.command.ShopboardVO;
import com.spring.cafealley.util.PageVO;

public interface IShopboardMapper {

	// 글 등록
	void regist(ShopboardVO vo);
	
	// 글 조회
	List<ShopboardVO> getList(PageVO vo);
	
	// 글 상세조회
	ShopboardVO getContent(int bno);
	
	// 글 수정
	void modify(ShopboardVO vo);
	
	// 글 삭제
	void delete(int bno);
	
	// 조회수 증가
	void hit(int bno);
	
	int getTotal();
}
