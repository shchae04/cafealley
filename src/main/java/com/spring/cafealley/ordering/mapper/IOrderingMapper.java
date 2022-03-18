package com.spring.cafealley.ordering.mapper;

import java.util.List;

import com.spring.cafealley.command.OrderingVO;

public interface IOrderingMapper {
	
	void order(OrderingVO vo);
	
	List<OrderingVO> getList(String userId);
	
	OrderingVO getOrder();
	
	void modify(OrderingVO vo);
	
	void delete(int ordernum);
	 
}
