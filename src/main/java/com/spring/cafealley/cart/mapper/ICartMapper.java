package com.spring.cafealley.cart.mapper;

import java.util.List;

import com.spring.cafealley.command.CartVO;

public interface ICartMapper {

	void insert(CartVO vo);
	
	List<CartVO> select(String userid);
	
	void delete(int cartno);
	
}

