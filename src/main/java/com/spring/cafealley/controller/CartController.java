package com.spring.cafealley.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cafealley.cart.service.ICartService;
import com.spring.cafealley.command.CartVO;
import com.spring.cafealley.command.UserVO;

@Controller
@RequestMapping("/cart")
public class CartController {

	
	@Autowired
	private ICartService service;
	
	// 실제 장바구니에 넣는 URL
	@ResponseBody
	@PostMapping("/cartRegist")
	public String cartRegist(@RequestBody List<CartVO> cartList, HttpSession session){
		System.out.println("/cart/cartRegist: POST");
		System.out.println("들어온 cartList : " + cartList);

		String userid = ((UserVO) session.getAttribute("login")).getUserid();
		
		// 실제 카트에 넣음.
		service.insert(cartList, "real", userid);
		return "registSuccess";
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
	
	@ResponseBody
	@PostMapping("/cartSelDelete")
	public String cartDelete(@RequestBody List<Integer> cartnos) {
		System.out.println("/cart/cartSelDelete: POST");
		for(int cartno : cartnos) {
			service.delete(cartno);
		}
		return "delSuccess";
	}
	
}
