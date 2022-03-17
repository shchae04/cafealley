package com.spring.cafealley.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.cafealley.board.service.INoBoardService;

@Controller
@RequestMapping("/noBoard")
public class NoBoardController {

	@Autowired
	private INoBoardService service;
	
	@GetMapping("/noticeBoardDetail")
	public String nodetail() {
		System.out.println("공지 상세보기 페이지로 이동");		
		return "communityboard/comBoardDetail";
	}
	
	@GetMapping("/noList")
	public String nolist() {
		System.out.println("공지 리스트 페이지로 이동");
		return "communityboard/comBoardList";
	}
	
	
}
