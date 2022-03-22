package com.spring.cafealley.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String replyRegist(@RequestBody ReplyVO vo, HttpSession session) {
		System.out.println("댓글 등록 : POST요청");
		System.out.println("댓글 값:" + vo);
		service.replyRegist(vo);
		//nullpointerexception이 발생!
		
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
	public String update(@RequestBody ReplyVO rno, HttpSession session) {
	
		//user 작성자 검증  
		/*
		  UserVO uvo = (UserVO) session.getAttribute("login"); String uwriter
		  =uvo.getUserid(); System.out.println("세션에서 가져온 write" + uwriter); String
		 rwriter = rno.getWriter(); System.out.println("댓글 작성자" + rwriter);
		
		if(uwriter.equals(rwriter)) {
			service.replyDelete(rno.getRno());
			return "modSuccess";
		} else {
			return "fail";
		}
		 */
		System.out.println("수정 요청값:" + rno);
		service.replyUpdate(rno.getRno());
		return "modSuccess";
	
		
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
