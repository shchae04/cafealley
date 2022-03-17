package com.spring.cafealley.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {

	//관리자 상품 목록
	@GetMapping("/productDetail")
	public String getlist() {
		
		
		return "product/productDetail";
	}
	
	//관리자 상품 수정
	@GetMapping("/productModify")
	public String modify() {
		
		return "product/productModify";
	}
	
	
	//관리자 상품 등록 
	@GetMapping("/productWrite")
	public String write() {
		
		return "product/productWrite";
	}
	
}
