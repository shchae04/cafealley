package com.spring.cafealley.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cafealley.command.PromoReplyVO;
import com.spring.cafealley.command.UserVO;
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
	
	
	//삭제만 가능.
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody PromoReplyVO vo,HttpSession session) {
		//세션 데이터가 null(로그인 x)이 아닌 경우 
		if(session.getAttribute("login") != null) {
			
			//vo.getRno 에 따른 게시물의 작성자와 세션 아이디 비교 해야함.
			//메서드 선언.
			String writer = service.getWriter(vo.getRno());
			UserVO uvo = (UserVO) session.getAttribute("login");
			
			//admin != null 이면 모든 댓글 삭제 가능.
			if(uvo.getUserid().equals(writer) || uvo.getAdmin() != null) {
				
				System.out.println("댓글 삭제 요청 들어옴!"+ vo.getRno());
				service.replyDelete(vo.getRno());
				System.out.println("삭제 완료 전달된 댓글번호 :" + vo.getRno());
				return "success";
			}
		} return "fail";
		
	}
	
	
}


































