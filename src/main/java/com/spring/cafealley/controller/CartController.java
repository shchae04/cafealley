package com.spring.cafealley.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.cafealley.cart.service.ICartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	
	@Autowired
	private ICartService service;
	
	//페이지 이동
	@GetMapping("shopCart")
	public void shopCart() {}
}
