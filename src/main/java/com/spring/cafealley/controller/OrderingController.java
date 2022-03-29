package com.spring.cafealley.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.cafealley.cart.service.ICartService;
import com.spring.cafealley.command.CartVO;
import com.spring.cafealley.command.OrderingVO;
import com.spring.cafealley.command.ProductVO;
import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.ordering.service.IOrderingService;
import com.spring.cafealley.product.service.IProductService;
import com.spring.cafealley.util.PageCreator;
import com.spring.cafealley.util.PageVO;

@Controller
@RequestMapping("/ordering")
public class OrderingController {
	
	@Autowired
	IOrderingService service;
	@Autowired
	ICartService cartservice;
	@Autowired
	IProductService productservice;
	
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
		
		
		int registCarttype = vo.getCarttype();
		String registUserId = vo.getUserid();
		List<CartVO> registCartList = cartservice.select(registUserId, registCarttype);
		for(CartVO registCart :registCartList) {
			if(productservice.getProduct(registCart.getProno()).getProstock() <  registCart.getCartamount()) {
				ra.addFlashAttribute("msg", "현재 " + registCart.getProname() + "에 대한 재고가 주문하시고자 하는 수량보다 적습니다.\n수량을 수정해주세요. \n재고 : " + productservice.getProduct(registCart.getProno()).getProstock());
				return "redirect:/cart/cartList";
			}
		}
		
		
		
		
		
		service.order(vo);
		OrderingVO lastOrdered = service.getOrder(userid, vo.getCarttype());
		ra.addFlashAttribute("lastOrdered",lastOrdered);
		ra.addFlashAttribute("cartList",cartservice.select(userid, lastOrdered.getCarttype()));
		return "redirect:/ordering/orderFinish";
	}
	
	@GetMapping("/orderFinish")
	public void finish() {}
	
	@GetMapping("/orderManagement")
	public void manage(Model model, PageVO vo){
		System.out.println("/ordering/orderManagement: GET");
		vo.setCountPerPage(10);
		List<OrderingVO> orderlist = service.getList("allofthem", vo);
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
		
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal());
		System.out.println(pc);
		model.addAttribute("pc",pc);
	}
	@PostMapping("/orderModify/{ordernum}/{orderstatus}/{deliverytracknum}")
	public String modify(@PathVariable int ordernum,
						 @PathVariable String orderstatus,
						 @PathVariable String deliverytracknum, RedirectAttributes ra) {
		System.out.println("/orderModify/{" + ordernum + "}/{" + orderstatus + "}/{"+ deliverytracknum + "}: POST");
		OrderingVO vo = new OrderingVO();
		vo.setOrdernum(ordernum);
		vo.setOrderstatus(orderstatus);
		if(!deliverytracknum.equals("0")) {
			vo.setDeliverytracknum(deliverytracknum);
		}
		
		// 출고중비중으로 바꾸는거면 실제로 재고 깎아주기.
		if(orderstatus.equals("waitdelivery")) {
			OrderingVO order = service.getOrderByOrdernum(ordernum);
			List<CartVO> orderCartList = cartservice.select(order.getUserid(), order.getCarttype());
			for(CartVO orderCart :orderCartList) {
				ProductVO voforupdate = new ProductVO();
				voforupdate.setProno(orderCart.getProno());
				voforupdate.setProstock(productservice.getProduct(orderCart.getProno()).getProstock() - orderCart.getCartamount());
				productservice.updateStock(voforupdate);
			}
			
		}
		service.modify(vo);
		
		if(orderstatus.equals("ordercancel") || orderstatus.equals("orderrefund") || orderstatus.equals("orderexchange") ) {
			ra.addFlashAttribute("msg", "정상적으로 " + (orderstatus.equals("ordercancel")?"취소요청되었습니다." 
													: orderstatus.equals("orderrefund")?"환불요청되었습니다"
													:"교환신청되었습니다." ));
			return "redirect:/user/orderDelHistory";
		}
		return "redirect:/ordering/orderManagement";
	}
	
	// 주문 보는 페이지 이동 
	// (userid를 받음으로서 주문자와 관리자 모두 이 메서드 사용가능)
	// (주문자는 페이지에서 세션스코프 이용해 ${login.userid}로 묻힐 것이고,)
	// (관리자는 페이지에서 주문자 아이디를 이용해 묻혀서 요청하기때문.)
	@GetMapping("/orderDetail/{ordernum}/{userid}")
	public String detail(@PathVariable int ordernum,
						 @PathVariable String userid,
						Model model, HttpSession session){
		System.out.println("/ordering/orderDetail/{" + ordernum + "}:  POST");
		
		if(userid.equals("0")) {
			userid = ((UserVO) session.getAttribute("login")).getUserid();
		}
		
		
		OrderingVO order = service.getOrderByOrdernum(ordernum);
		List<CartVO> cartList = cartservice.select(userid, order.getCarttype()); 
		
		model.addAttribute("order", order);
		model.addAttribute("cartList", cartList);
		return "/ordering/orderDetail";
	}
	
	
	@GetMapping("/exchangeRefund/{ordernum}")
	public String exrefund(@PathVariable int ordernum, HttpSession session, Model model) {
		System.out.println("/ordering/exchangeRefund/{" + ordernum + "}");
		
		String userid = ((UserVO) session.getAttribute("login")).getUserid();
		OrderingVO order = service.getOrderByOrdernum(ordernum);
		List<CartVO> cartList = cartservice.select(userid, order.getCarttype());
		
		model.addAttribute("order", order);
		model.addAttribute("cartList", cartList);
		return "/ordering/exchangeRefund";
	}
	
	@ResponseBody
	@PostMapping("/exchangeRefund")
	public String exrf(@RequestBody OrderingVO vo){
		// 기본주소있으면 교환임.
		if(vo.getDeliverybasicaddr() != "" && vo.getDeliverybasicaddr() != null) {
			// 교환은 기존 주문상태를 교환으로 바꾸고 리즌이랑 디테일리즌도 바꾸고
			vo.setOrderstatus("exchange");
			service.modify(vo);
			// 배송정보만 새걸로 바꾸고 새로운주문 등록해줌.
			OrderingVO conventional = service.getOrderByOrdernum(vo.getOrdernum());
			// 새 장바구니도 만들어줘야함..
			List<CartVO> newCartList = new ArrayList<>();
			List<CartVO> conventionalCartList = cartservice.select(conventional.getUserid(), conventional.getCarttype());
			for(CartVO cart : conventionalCartList) {
				newCartList.add(cart);
			}
			cartservice.insert(newCartList, "temp", conventional.getUserid());
			int lastInsertedCarttype = cartservice.getMaxCarttype(conventional.getUserid());
			OrderingVO newone = new OrderingVO(conventional.getUserid(),
											   lastInsertedCarttype,
											   conventional.getOrdertotalprice(),
											   conventional.getOrderusername(),
											   conventional.getOrderuserphone1(),
											   conventional.getOrderuserphone2(),
											   conventional.getOrderuserphone3(),
											   conventional.getOrderuseremail(),
											   vo.getDeliveryname(),
											   vo.getDeliverypostnum(),
											   vo.getDeliverybasicaddr(),
											   vo.getDeliverydetailaddr(),
											   vo.getDeliveryphone1(),
											   vo.getDeliveryphone2(),
											   vo.getDeliveryphone3(),
											   "",
											   conventional.getPaymethod(),
											   conventional.getPaybankname(),
											   conventional.getPaybank()); 
			 service.order(newone);
		}else {
			vo.setOrderstatus("refund");
			service.modify(vo);
		}
		return "exrfSuccess";
	}
	
	
	
}
