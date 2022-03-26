package com.spring.cafealley.ordering.service;

import java.util.List;

import com.spring.cafealley.command.OrderingVO;
import com.spring.cafealley.util.PageVO;

public interface IOrderingService {

	void order(OrderingVO vo);
	
	OrderingVO getOrderByOrdernum(int ordernum);
	
	List<OrderingVO> getList(String userid, PageVO vo);
	
	OrderingVO getOrder(String userid, int carttype);
	
	void modify(OrderingVO vo);
	
	void delete(int ordernum);
	
	int getTotal();
}
