package com.spring.cafealley.ordering.service;

import java.util.List;

import com.spring.cafealley.command.OrderingVO;

public interface IOrderingService {

	void order(OrderingVO vo);
	
	List<OrderingVO> getList(String userId);
	
	OrderingVO getOrder(String userid, int carttype);
	
	void modify(OrderingVO vo);
	
	void delete(int ordernum);
}
