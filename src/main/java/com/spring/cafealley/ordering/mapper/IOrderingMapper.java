package com.spring.cafealley.ordering.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cafealley.command.OrderingVO;

public interface IOrderingMapper {
	// 주문 등록
	void order(OrderingVO vo);
	
	// 해당 아이디의 모든 주문 가져오기
	List<OrderingVO> getList(@Param("userid") String userid);
	
	OrderingVO getOrderByOrdernum(@Param("ordernum") int ordernum);
	
	// 해당 아이디와 카트타입에 해당하는 주문 하난 가져오기
	OrderingVO getOrder(@Param("userid") String userid, 
						@Param("carttype") int carttype);
	
	// 주문 수정 (교환, 환불, 주문상태, 운송장번호 등)
	void modify(OrderingVO vo);
	
	// 주문 삭제 - 주문내역을 삭제할 수는 없음. 안쓰일 것. 
	void delete(int ordernum);
	 
}
