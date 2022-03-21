package com.spring.cafealley.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.cafealley.command.ReplyVO;
import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.reply.service.IReplyService;


@RestController
@RequestMapping("/noReply")
public class NoReplyController {
	
	@Autowired
	private IReplyService service;
	
	//댓글 등록
	@PostMapping("/replyRegist")
	public String replyRegist(@RequestBody ReplyVO vo,HttpServletRequest request) {
		System.out.println("댓글 등록 : POST요청");
		System.out.println("댓글 값:" + vo);
		service.replyRegist(vo);
		HttpSession session = request.getSession();
		session.getAttribute("login");
		
		return "regSuccess";
	}
	
	//페이징 없이 댓글목록가져옴.
	@GetMapping("/getList/{bno}")
	public Map<String, Object> getList(@PathVariable int bno,Model model) {
		
		List<ReplyVO> list = service.getList(bno);
		
		//list로 받아보려했는데 시간이없다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	
	@PostMapping("/update")
	public String update(@RequestBody ReplyVO rvo,HttpSession session) {
	
		//user 작성자 검증  
		UserVO uvo = (UserVO) session.getAttribute("login");
		String uwriter =uvo.getUserid();
		System.out.println("세션에서 가져온 write" + uwriter);
		String rwriter = rvo.getWriter();
		System.out.println("댓글 작성자" + rwriter);
		
		if(uwriter.equals(rwriter)) {
			service.replyDelete(rvo.getRno());
			return "modSuccess";
		} else {
			return "fail";
		}
		
	
		
	}
	
	@PostMapping("/delete")
	public String delete(@RequestBody ReplyVO rvo, UserVO uvo) {
	
		//user 작성자 검증  
		String uwriter =uvo.getUserid();
		String rwriter = rvo.getWriter();
		
		if(uwriter.equals(rwriter)) {
			service.replyDelete(rvo.getRno());
			return "delSuccess";
		} else {
			return "fail";
		}
		
	
		
	}
	
}
