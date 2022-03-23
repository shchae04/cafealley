package com.spring.cafealley.ordering.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cafealley.command.OrderingVO;

public interface IOrderingMapper {
	
	void order(OrderingVO vo);
	
	List<OrderingVO> getList(String userId);
	
	OrderingVO getOrder(@Param("userid") String userid, 
						@Param("carttype") int carttype);
	
	void modify(OrderingVO vo);
	
	void delete(int ordernum);
	 
}
