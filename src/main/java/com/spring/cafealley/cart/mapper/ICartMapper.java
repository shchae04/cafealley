package com.spring.cafealley.cart.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cafealley.command.CartVO;

public interface ICartMapper {

	// 장바구니 추가 카트타입추가x
	void insert(@Param("vo") CartVO vo, @Param("ct") int ct);
	
	// 장바구니 찾기
	List<CartVO> select(@Param("userid")String userid, @Param("carttype") int carttype);
	
	// 장바구니 삭제
	void delete(int cartno);
	
	// 장바구니 업데이트
	void update(CartVO vo);

	
}

