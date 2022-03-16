package com.spring.cafealley.cart.mapper;

import java.util.List;

import com.spring.cafealley.command.CartVO;

public interface ICartMapper {

	
	List<CartVO> select(String userid);
	
}
