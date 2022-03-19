package com.spring.cafealley.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.cafealley.command.ProductVO;
import com.spring.cafealley.command.ShopboardVO;
import com.spring.cafealley.img.service.IImgService;
import com.spring.cafealley.product.service.IProductService;
import com.spring.cafealley.shopboard.service.IShopboardService;

@Controller
@RequestMapping("/shop")
public class ShopboardController {

	
	@Autowired
	IShopboardService service;
	@Autowired
	IProductService productService;
	@Autowired
	IImgService imgService;
	
	@GetMapping("/shopList")
	public void shopList() {}
	
	
	@GetMapping("/shopWrite")
	public void shopWrite(int prono, int prono2,
						  int prono3, int prono4, Model model){
		// 상품관리페이지에서 체크한 상품 번호들고 shopWrite.jsp에 뿌려줘야함.
		System.out.println("/shop/shopWrite: GET");
		List<ProductVO> proList = new ArrayList<>();
		if(prono != 0) // int의 초기화 하지 않은 default 값은 0이다. prono의 sequence는 1부터시작하니 0인 상품번호를 가진 상품데이터는 없다
			proList.add(productService.getProduct(prono));
		if(prono2 != 0)
			proList.add(productService.getProduct(prono2));
		if(prono3 != 0)
			proList.add(productService.getProduct(prono3));
		if(prono4 !=0)
			proList.add(productService.getProduct(prono4));
		model.addAttribute("proList",proList);
	}
	
	@PostMapping("/shopWrite")
	public String shopRegist(@RequestParam("file") List<MultipartFile> list,
			ShopboardVO vo, HttpSession session, RedirectAttributes ra) {
		System.out.println("/shop/shopWrite: POST");
		System.out.println("페이지에서 들어온 vo : " + vo);
		imgService.upload(list);
		System.out.println("마지막 업로드된 filenum: "+ imgService.getLastUploaded());
		vo.setFilenum(imgService.getLastUploaded());
		System.out.println("vo에 filenu 세팅한 후의 vo : " + vo);
		service.regist(vo);
		ra.addFlashAttribute("msg", "상품 등록이 완료되었습니다.");
		return "redirect:/shop/shopList";
	}
	
}
