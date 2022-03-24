package com.spring.cafealley.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.cafealley.cart.service.ICartService;
import com.spring.cafealley.command.CartVO;
import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.ordering.service.IOrderingService;

@Controller
@RequestMapping("/cart")
public class CartController {

	
	@Autowired
	private ICartService service;
	@Autowired
	private IOrderingService orderservice;
	// 실제 장바구니에 넣는 URL
	@ResponseBody
	@PostMapping("/cartRegist")
	public String cartRegist(@RequestBody List<CartVO> cartList,  HttpSession session){
		System.out.println("/cart/cartRegist: POST");
		System.out.println("들어온 cartList : " + cartList);

		String userid = ((UserVO) session.getAttribute("login")).getUserid();
		
		// 실제 카트에 넣음.
		
		service.insert(cartList, "real", userid);
		return "registSuccess";
	}
	
	@ResponseBody
	@PostMapping("/cartOrder")
	public String cartOrder(@RequestBody List<CartVO> cartList, HttpSession session) {
		System.out.println("/cart/cartOrder: POST");
		System.out.println("들어온 cartList : " + cartList);

		String userid = ((UserVO) session.getAttribute("login")).getUserid();
		// 해당 유저의 장바구니타입중 가장 큰 carttype 가져옴.
		int maxCartType = service.getMaxCarttype(userid);
		
		System.out.println("maxCartType : " + maxCartType);
		System.out.println("이 카트타입과 지금아이디로 가져온 오더 :" + orderservice.getOrder(userid, maxCartType));
		
		/*
		 	가져온 maxCartType에따라서 
		 	maxCartType = 0 : 임시장바구니 하나도없는 것. 그냥 바로 insert때리면 됨.
		 	maxCartType = 0이 아닌 값 : 임시 장바구니 만들어본적이 있음. 
		 							  최근에 만들어진 임시 장바구니가 실제 주문까지 이뤄졌는지 확인해야함
		 */
		if(maxCartType != 0) {
			// 이게 주문으로까지 안이어졌으면, 이거 메모리 낭비니깐 삭제
			if(orderservice.getOrder(userid, maxCartType)==null) {
				List<CartVO> tempCartList = service.select(userid, maxCartType);
				for(CartVO vo : tempCartList) {
					service.delete(vo.getCartno());
				}
			}
			// 주문으로 이어졌으면 그냥 insert하면 됨. else문 필요 없음.
		}
		// 그 다음 insert
		service.insert(cartList, "temp", userid);
		// 방금 insert한 carttype가져오기.
		int lastInsertedCarttype = service.getMaxCarttype(userid);
		System.out.println("lastInsertedCarttype:" + lastInsertedCarttype);
		// 방금 insert된 모든 장바구니 데이터 가져오기
		List<CartVO> lastInsertedCartList =  service.select(userid, lastInsertedCarttype);
		System.out.println("lastInsertedCartList:" + lastInsertedCartList);
		return Integer.toString(lastInsertedCarttype);
	}
	
	
	
	
	
	//페이지 이동
	@GetMapping("/cartList")
	public void cartList(){
		System.out.println("/cart/cartList: GET");
	}
	
	//비동기 getjson으로 리스트 불러오기
	@GetMapping("/getList/{type}")
	@ResponseBody
	public List<CartVO> getList(@PathVariable int type, HttpSession session) {
		System.out.println("/cart/getList: POST");
		String userid = ((UserVO)session.getAttribute("login")).getUserid();
		return service.select(userid, type);
	}
	
	// 비동기 ajax 업데이트
	@ResponseBody
	@PostMapping("/cartModify")
	public String cartModify(@RequestBody CartVO vo) {
		System.out.println("/cart/cartModify: POST");
		service.update(vo);
		return "modifySuccess";
	}
	
	// 비동기 ajax 삭제
	@ResponseBody
	@PostMapping("/cartDelete")
	public String cartDelete(@RequestBody String cartno) {
		int cn =  Integer.parseInt(cartno);
		System.out.println("/cart/cartDelete: POST");
		service.delete(cn);
		return "delSuccess";
	}
	
	// 비동기 ajax 여러개 삭제
	@ResponseBody
	@PostMapping("/cartSelDelete")
	public String cartDelete(@RequestBody List<Integer> cartnos) {
		System.out.println("/cart/cartSelDelete: POST");
		for(int cartno : cartnos) {
			service.delete(cartno);
		}
		return "delSuccess";
	}
	
	@ResponseBody
	@PostMapping("/cartRealOrder")
	public String cartRealOrder(@RequestBody List<Integer> cartnos, HttpSession session) {
		System.out.println("/cart/cartRealRegist: POST");
		
		String userid = ((UserVO)session.getAttribute("login")).getUserid();
		
		List<CartVO> selList = new ArrayList<>();
		// 주문되면 이제 박제될거니깐 임시장바구니로 복제해둠.
		for(int cartno : cartnos) {
			selList.add(service.selectOne(cartno));
		}
		service.insert(selList, "temp", userid);
		int maxCartType = service.getMaxCarttype(userid);
		
		// 복제 후에는 실제 장바구니에서 제거해줌.
		for(int cartno : cartnos) {
			service.delete(cartno);
		}
		
		return Integer.toString(maxCartType);
	}
	
}
