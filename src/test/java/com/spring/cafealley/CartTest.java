package com.spring.cafealley;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.cart.mapper.ICartMapper;
import com.spring.cafealley.command.CartVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class CartTest {
	
	@Autowired
	private ICartMapper mapper;
//	
//	//장바구니 삽입 테스트
//	@Test
//	public void insert() {
//		CartVO vo = new CartVO();
////		 카트타입을 주지않으면 시퀀스값을 올리고 주면 currval. 처음에는 주어야함.
//		
//		vo.setCartamount(1);
//		vo.setCarttotalprice(10000);
//		vo.setProno(3);
//		vo.setUserid("abc1234");
//		mapper.insert(vo);
//	}
//	
//	//카트타입을 준 insert
//	@Test
//	public void insert2() {
//		CartVO vo = new CartVO();
//		vo.setCartamount(1);
//		vo.setCarttype(2);
//		vo.setCarttotalprice(10000);
//		vo.setProno(3);
//		vo.setUserid("abc1234");
//		mapper.insert(vo);
//		
//	}

}
