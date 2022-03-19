package com.spring.cafealley.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cafealley.cart.mapper.ICartMapper;
import com.spring.cafealley.command.CartVO;

@Service
public class CartService implements ICartService {

	@Autowired
	private ICartMapper mapper;
	
	
	//장바구니 추가 cartno_seq만 증가 carttype_seq증가x 가능한가?..
	@Override
	public void insert(CartVO vo) {
		mapper.insert(vo);
	}

	//장바구니 가져오기
	@Override
	public List<CartVO> select(String userid) {
	
		return mapper.select(userid);
	}

	//삭제
	@Override
	public void delete(int cartno) {
		mapper.delete(cartno);
	}
	


}
