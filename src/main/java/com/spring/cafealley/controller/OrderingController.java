package com.spring.cafealley.controller;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.cafealley.command.OrderingVO;
import com.spring.cafealley.ordering.service.IOrderingService;

@Controller
@RequestMapping("/ordering")
public class OrderingController {
	
	@Autowired
	IOrderingService service;
	
	
	@GetMapping("/orderRegist")
	public void regist() {}

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
