package com.spring.cafealley.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.spring.cafealley.util.PageCreator;
import com.spring.cafealley.util.PageVO;

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
	public void shopList(Model model, PageVO paging) {
		System.out.println("/shop/shopList: GET");
		System.out.println("초기의 PageVO : " + paging);
		
		
		if(paging.getCondition() == null || paging.getCondition().equals("") )
			paging.setCondition("");
		if(paging.getKeyword() == null || paging.getKeyword().equals(""))
			paging.setKeyword("lastest");
		
		List<ShopboardVO> shopList = service.getList(paging);
		
		// 해당 판매 게시글에 등록된 상품중 최저가를 같이 뿌려주기 위함.
		List<Integer> sellPriceList = new ArrayList<>();
		for(ShopboardVO vo :shopList) {
			int min=0;
			for(ProductVO provo :vo.getProList()) {
				if(min==0) // 첫빠따가 일단 min
					min = provo.getProsellprice();
				else { // 그 이후는 제일 작은게 min
					if(min >= provo.getProsellprice())
						min = provo.getProsellprice();
				}
			}
			// 해당 게시글의 최저가 또한 shopList와 같은 순서로 저장됨.  
			sellPriceList.add(min);
		}
		System.out.println("shopList: " + shopList);
		model.addAttribute("shopList",shopList);
		model.addAttribute("sellPriceList",sellPriceList);
		
		PageCreator pc = new PageCreator();
		pc.setPaging(paging);
		pc.setArticleTotalCount(service.getTotal());
		System.out.println(pc);
		model.addAttribute("pc",pc);
	}
	
	
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
		
		ProductVO leastSellPricePro = new ProductVO();
		int min=0;
		for(ProductVO provo : proList) {
			if(min==0) { // 첫빠따가 일단 min
				min = provo.getProsellprice();
				leastSellPricePro.setProsellprice(provo.getProsellprice()) ;
				leastSellPricePro.setProprice(provo.getProprice()) ;
			}else if(min >= provo.getProsellprice()) {
				min = provo.getProsellprice();
				leastSellPricePro.setProsellprice(provo.getProsellprice()) ;
				leastSellPricePro.setProprice(provo.getProprice()) ;		
			}
		}
		System.out.println(leastSellPricePro);
		model.addAttribute("leastPro", leastSellPricePro);
		
	}
	
	@PostMapping("/shopWrite")
	public String shopRegist(@RequestParam("file") List<MultipartFile> list,
			ShopboardVO vo, HttpSession session, RedirectAttributes ra) {
		
		
		System.out.println("/shop/shopWrite: POST");
		System.out.println("shopWrite 페이지에서 들어온 vo : " + vo);
		System.out.println("shopWrite 페이지에서 들어온 파일list " + list);
		
		// 페이지에서 파일을 2개 등록하더라도 일단 페이지에 input file태그가 3개존재함.
		// 따라서 2개등록해도 저 list에는 쓰레기값파일까지 포함해서 3개들어있음.
		// 실제 쓰레기파일을 걸러줘야함. 
		
		// ArrayList의 컨커런트 모디피케이션 막기위해 뒤에서부터 삭제함.
		int a = list.size();
		for(int num= a-1; num>=0; num--) {
			if(list.get(num).isEmpty()) {
				list.remove(num);
			}
		}
		
		System.out.println("거르고난 후의 list " + list);
		imgService.upload(list);
		System.out.println("마지막 업로드된 filenum: "+ imgService.getLastUploaded());
		vo.setFilenum(imgService.getLastUploaded());
		System.out.println("vo에 filenu 세팅한 후의 vo : " + vo);
		service.regist(vo);
		ra.addFlashAttribute("msg", "판매 게시글 등록이 완료되었습니다.");
		return "redirect:/shop/shopList";
	}
	
	@GetMapping("/shopDetail/{bno}")
	public String shopDetail(@PathVariable int bno,
						   Model model, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("/shop/shopDetail: GET");
		Cookie[] cookies = request.getCookies();
		boolean onedayflag = false;
		if(cookies!= null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("shopvisited" + Integer.toString(bno))) {
					onedayflag = true;
					break;
				}
			}
		}
		// 쿠키를 뒤졌는데 24시간 이내로 방문하였던 흔적이 없다면, 쿠키만들어주고 
		if(!onedayflag) {
			Cookie shopvisited = new Cookie("shopvisited" + Integer.toString(bno), "true");
			shopvisited.setMaxAge(60 * 60 * 24);
			response.addCookie(shopvisited);
			// 조회수도 하나 증가시켜줌.
			service.hit(bno);
		}
		
		ShopboardVO vo =  service.getContent(bno);
		System.out.println("getContent에서 불러온 판매게시글 vo : "+vo);
		System.out.println("그 판매게시글의 상품들 proList: "+vo.getProList());
		ProductVO leastSellPricePro = new ProductVO();
		int min=0;
		for(ProductVO provo :vo.getProList()) {
			if(min==0) { // 첫빠따가 일단 min
				min = provo.getProsellprice();
				leastSellPricePro.setProsellprice(provo.getProsellprice()) ;
				leastSellPricePro.setProprice(provo.getProprice()) ;
			}else if(min >= provo.getProsellprice()) {
				min = provo.getProsellprice();
				leastSellPricePro.setProsellprice(provo.getProsellprice()) ;
				leastSellPricePro.setProprice(provo.getProprice()) ;		
			}
		}
		System.out.println(leastSellPricePro);
		model.addAttribute("leastPro", leastSellPricePro);
		model.addAttribute("shop",vo);
		

		return "/shop/shopDetail";
	}
	
	@GetMapping("/shopModify/{bno}")
	public String shopModify(@PathVariable int bno, Model model) {
		System.out.println("/shop/shopModify: GET");
		
		ShopboardVO vo = service.getContent(bno);
		
		ProductVO leastSellPricePro = new ProductVO();
		int min=0;
		for(ProductVO provo :vo.getProList()) {
			if(min==0) { // 첫빠따가 일단 min
				min = provo.getProsellprice();
				leastSellPricePro.setProsellprice(provo.getProsellprice()) ;
				leastSellPricePro.setProprice(provo.getProprice()) ;
			}else if(min >= provo.getProsellprice()) {
				min = provo.getProsellprice();
				leastSellPricePro.setProsellprice(provo.getProsellprice()) ;
				leastSellPricePro.setProprice(provo.getProprice()) ;		
			}
		}
		System.out.println(leastSellPricePro);
		model.addAttribute("leastPro", leastSellPricePro);		
		model.addAttribute("shop",vo);
		model.addAttribute("proList",vo.getProList());
		return "/shop/shopModify";
	}
	
	@PostMapping("/shopModify")
	public String shopUpdate(ShopboardVO vo ,RedirectAttributes ra) {
		System.out.println("/shop/shopModify: POST");
		service.modify(vo);
		ra.addFlashAttribute("msg", "판매 게시글 수정이 완료되었습니다.");
		return "redirect:/shop/shopDetail/" + vo.getBno();
	}
	@PostMapping("/shopDelete")
	public String shopDelete(int bno) {	
		service.delete(bno);
		return "redirect:/shop/shopList";
	}
	
	
	
}
