package com.spring.cafealley.cart.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.cafealley.command.CartVO;

public interface ICartService {

	// 장바구니 추가
	void insert(List<CartVO> cartList, String type, String userid);
	
	// 장바구니 찾기
	List<CartVO> select(String userid, int type);
	
	// 장바구니 하나 찾기
	CartVO selectOne(int cartno);
	
	// 장바구니 삭제
	void delete(int cartno);
	
	// 장바구니 수량 및 토탈가격 수정
	void update(CartVO vo);
	
	// 장바구니의 가장 큰 carttype 번호 가져오기
	int getMaxCarttype(String userid);
	
}
