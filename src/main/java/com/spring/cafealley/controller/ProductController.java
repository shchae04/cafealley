package com.spring.cafealley.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {

	//관리자 상품 목록 이동
	@GetMapping("/productDetail")
	public void getlist(){}
	
	//
	
	
	//관리자 상품 수정 이동
	@GetMapping("/productModify")
	public void modify() {}
	
	
	//관리자 상품 등록 이동
	@GetMapping("/productWrite")
	public void write() {}
	
}
