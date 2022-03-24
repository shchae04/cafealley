package com.spring.cafealley.cart.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cafealley.cart.mapper.ICartMapper;
import com.spring.cafealley.command.CartVO;
import com.spring.cafealley.command.UserVO;

@Service
public class CartService implements ICartService {

	@Autowired
	private ICartMapper mapper;
	
	
	//장바구니 추가 cartno_seq만 증가 carttype_seq증가x 가능한가?..
	@Override
	public void insert(List<CartVO> cartList, String type, String userid) {
		
		if(type.equals("real")) {
			for(CartVO vo : cartList) {
				vo.setUserid(userid);
				// 실제 장바구니에 해당 prono가 존재하면 수량이랑 totalprice만 추가된 상태로 수정해야함.
				List<CartVO> realcart =  mapper.select(userid, 0);
				System.out.println("realcart : " + realcart);
				boolean thereisone = false;
				for(CartVO rvo : realcart) {
					System.out.println("rvo.getProno : " + rvo.getProno());
					System.out.println("vo.getProno : " + vo.getProno());
					if(rvo.getProno() == vo.getProno()) { // 존재하면 update
						// update 됨.
						rvo.setCarttotalprice(rvo.getCarttotalprice() + vo.getCarttotalprice());
						rvo.setCartamount(rvo.getCartamount() + vo.getCartamount());
						mapper.update(rvo);
						thereisone = true;
						break;
					}
				}
				if(!thereisone) mapper.insert(vo,0); // 존재하지않으면 insert
			}
		}else{
			int count = 0;
			for(CartVO vo : cartList) {
				vo.setUserid(userid);
				if(count ==0)
					mapper.insert(vo, 1); // 임시장바구니 시작
				else
					mapper.insert(vo, 2); // 임시장바구니 이어가기
				count++;
			}
		}
		
		
	}

	//장바구니 가져오기
	@Override
	public List<CartVO> select(String userid, int type) {
		return mapper.select(userid, type);
	}

	//삭제
	@Override
	public void delete(int cartno) {
		mapper.delete(cartno);
	}
	
	// 수정
	@Override
	public void update(CartVO vo) {
		mapper.update(vo);
	}
	
	// 해당유저 가장 큰 carttype가져오기 
	@Override
	public int getMaxCarttype(String userid) {
		if(mapper.countCart(userid)==0) {
			return 0;
		}else {
			return mapper.getMaxCarttype(userid);
		}
	}
	
	@Override
	public CartVO selectOne(int cartno) {
		return mapper.selectOne(cartno);
	}

	

}
