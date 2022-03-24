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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 바로구매로 주문 페이지 이동
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
	
	

	
	
	// 주문
	@PostMapping("/orderRegist")
	public String orderRegist(OrderingVO vo, RedirectAttributes ra, HttpSession session){
		System.out.println("/ordering/orderRegist: POST");
		String userid = ((UserVO) session.getAttribute("login")).getUserid();
		System.out.println(vo);
		service.order(vo);
		OrderingVO lastOrdered = service.getOrder(userid, vo.getCarttype());
		ra.addFlashAttribute("lastOrdered",lastOrdered);
		ra.addFlashAttribute("cartList",cartservice.select(userid, lastOrdered.getCarttype()));
		return "redirect:/ordering/orderFinish";
	}
	
	@GetMapping("/orderFinish")
	public void finish() {}
	
	@GetMapping("/orderManagement")
	public void manage(Model model){
		System.out.println("/ordering/orderManagement: GET");
		List<OrderingVO> orderlist = service.getList("");
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
