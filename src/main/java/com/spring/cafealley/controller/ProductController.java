package com.spring.cafealley.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cafealley.command.ProductVO;
import com.spring.cafealley.img.service.IImgService;
import com.spring.cafealley.img.service.ImgService;
import com.spring.cafealley.product.service.IProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private IProductService service;
	
	@Autowired
	private IImgService imgservice;

	//관리자 상품 목록 이동
	@GetMapping("/productList")
	public void getlist(){
		System.out.println("관리자 상품목록페이지 이동");
	}
	
	
	//관리자 상품 수정 이동
	@GetMapping("/productModify")
	public void modify() {
		System.out.println("관리자 상품수정페이지 이동");
		
	}
	
	
	//관리자 상품 등록 이동
	@GetMapping("/productWrite")
	public void writepage() {
		System.out.println("관리자 상품작성페이지 이동");
		
	}
	
	@PostMapping("/productWrite")
	public String write(ProductVO vo, MultipartFile filename, HttpSession session) {
		service.insertProduct(vo);
		imgservice.upload(null, null, null);
		System.out.println("productWrite: Post요청");
		
		return "redirect:/product/productList";
	}
	
	@PostMapping("/productModify")
	public String modify(ProductVO vo,HttpSession session) {
		service.updateProduct(vo);
		System.out.println("productModify: Post요청");
		return "redirec:/product/productList";
	}
}
