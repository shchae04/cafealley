package com.spring.cafealley.cart.service;

import java.util.List;

import com.spring.cafealley.command.CartVO;

public interface ICartService {

	// 장바구니 추가
	void insert(CartVO vo);
	
	// 장바구니 찾기
	List<CartVO> select(String userid);
	
	// 장바구니 삭제
	void delete(int cartno);
	
	
}
