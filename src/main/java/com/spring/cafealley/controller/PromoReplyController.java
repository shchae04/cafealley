package com.spring.cafealley.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public List<PromoReplyVO> replyList(@PathVariable int bno,Model model) {
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
			//왜 null값이 오지..
			System.out.println(vo);
			PromoReplyVO pvo = service.getReplyContent(vo.getRno());
			System.out.println("삭제할 댓글 데이터:" + pvo);
			String writer = pvo.getWriter();
			UserVO uvo = (UserVO) session.getAttribute("login");
			System.out.println("userid :" + uvo.getUserid() + "작성자 :" + writer);
			
			//admin이면 모든 댓글 삭제 가능.
			if(uvo.getUserid().equals(writer) || uvo.getAdmin() != null || !uvo.getAdmin().equals("")) {
				System.out.println("삭제됨");
				
				service.replyDelete(vo.getRno());
				return "success";
			}
		} return "fail";
		
	}
	
	
}


































