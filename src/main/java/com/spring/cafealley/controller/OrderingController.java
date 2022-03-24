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
	
	// 주문 페이지 이동
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
		List<OrderingVO> orderlist = service.getList("allofthem");
		for(int i =0; i<orderlist.size(); i++) {
			for(int j=0; j<orderlist.get(i).getOrdercart().size(); j++) {
 				 String proname = cartservice.selectOne(orderlist.get(i).getOrdercart().get(j).getCartno()).getProname();
 				 int filenum = cartservice.selectOne(orderlist.get(i).getOrdercart().get(j).getCartno()).getFilenum();
 				 orderlist.get(i).getOrdercart().get(j).setProname(proname);
 				 orderlist.get(i).getOrdercart().get(j).setFilenum(filenum);
			 }
		}
		System.out.println(orderlist);
		model.addAttribute("orderList" , orderlist);
		
	}
	@PostMapping("/orderModify/{ordernum}/{orderstatus}/{deliverytracknum}")
	public String modify(@PathVariable int ordernum,
						 @PathVariable String orderstatus,
						 @PathVariable String deliverytracknum) {
		System.out.println("/orderModify/{" + ordernum + "}/{" + orderstatus + "}/{"+ deliverytracknum + "}: POST");
		OrderingVO vo = new OrderingVO();
		vo.setOrdernum(ordernum);
		vo.setOrderstatus(orderstatus);
		if(!deliverytracknum.equals("0")) {
			vo.setDeliverytracknum(deliverytracknum);
		}
		service.modify(vo);
		return "redirect:/ordering/orderManagement";
	}
	
	// 주문 보는 페이지 이동 
	// (userid를 받음으로서 주문자와 관리자 모두 이 메서드 사용가능)
	// (주문자는 페이지에서 세션스코프 이용해 ${login.userid}로 묻힐 것이고,)
	// (관리자는 페이지에서 주문자 아이디를 이용해 묻혀서 요청하기때문.)
	@GetMapping("/orderDetail/{ordernum}/{userid}")
	public String detail(@PathVariable int ordernum,
						 @PathVariable String userid,
						Model model){
		System.out.println("/ordering/orderDetail/{" + ordernum + "}:  POST");
		
		OrderingVO order = service.getOrderByOrdernum(ordernum);
		List<CartVO> cartList = cartservice.select(userid, order.getCarttype()); 
		
		model.addAttribute("order", order);
		model.addAttribute("cartList", cartList);
		return "/ordering/orderDetail";
	}
	
	
	
	
	
	@GetMapping("/exchangeRefund")
	public void exrefund() {};
	
	
	
}
