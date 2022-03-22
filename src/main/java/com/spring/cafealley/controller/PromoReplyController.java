package com.spring.cafealley.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cafealley.command.PromoReplyVO;
import com.spring.cafealley.promoreply.service.IPromoReplyService;

@Controller
@RequestMapping("/promoReply")
public class PromoReplyController {

	@Autowired
	private IPromoReplyService service;
	
	@PostMapping("/regist")
	@ResponseBody
	public String regist(@RequestBody PromoReplyVO vo) {
		System.out.println("댓글 등록 요청 들어왔어요.");
		System.out.println(vo);
		
		service.replyRegist(vo);
		
		return "success";
	}
	
	@GetMapping("/replyList/{bno}")
	@ResponseBody
	public List<PromoReplyVO> replyList(@PathVariable int bno) {
		System.out.println("댓글 목록 요청 들어옴.");
		return service.getList(bno);
	}
	
	
}


































