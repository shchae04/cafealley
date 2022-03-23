package com.spring.cafealley.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.cafealley.cart.service.ICartService;
import com.spring.cafealley.command.CartVO;
import com.spring.cafealley.command.OrderingVO;
import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.ordering.service.IOrderingService;

@Controller
@RequestMapping("/ordering")
public class OrderingController {
	
	@Autowired
	IOrderingService service;
	@Autowired
	ICartService cartservice;
	
	@GetMapping("/orderRegist/{carttype}")
	public String regist(@PathVariable int carttype, Model model, HttpSession session) {
		System.out.println("order/orderRegist: GET");
		String userid = ((UserVO) session.getAttribute("login")).getUserid();
		List<CartVO> lastInsertedCartList = cartservice.select(userid, carttype);
		System.out.println("ordercontroller에서 부른 lastInsertedCartList : ");
		System.out.println(lastInsertedCartList);
		model.addAttribute("cartList", lastInsertedCartList);
		return "ordering/orderRegist";
	}

	@PostMapping("/orderRegist")
	public String orderRegist(OrderingVO vo){
		System.out.println("/ordering/orderRegist: POST");
		System.out.println(vo);
		service.order(vo);
		
		return "ordering/orderFinish";
	}
	
	@GetMapping("/orderFinish")
	public void finish() {}
	
	@GetMapping("/orderManagement")
	public void manage(Model model){
		System.out.println("/ordering/orderManagement: GET");
		String userid="abc1234";
		List<OrderingVO> orderlist = service.getList(userid);
		System.out.println(orderlist);
		model.addAttribute("orderList" , orderlist);		
	}
	@PostMapping("/orderModify/{ordernum}/{orderstatus}")
	public String modify(@PathVariable int ordernum,
						 @PathVariable String orderstatus) {
		OrderingVO vo = new OrderingVO();
		vo.setOrdernum(ordernum);
		vo.setOrderstatus(orderstatus);
		service.modify(vo);
		return "redirect:/ordering/orderManagement";
	}
	
}
