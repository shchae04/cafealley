package com.spring.cafealley.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.spring.cafealley.board.service.IBoardService;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.util.PageCreator;
import com.spring.cafealley.util.PageVO;

@Controller
@RequestMapping("/noBoard")
public class NoBoardController {

	@Autowired
	private IBoardService service;

	//상세보기 이동
	@GetMapping("/noDetail")
	public String nodetail() {
		System.out.println("공지 상세보기 페이지로 이동");		
		return "noticeboard/noticeBoardDetail";
	}
	
	/*
	// 목록 이동
	@GetMapping("/noList")
	public String noList() {
		System.out.println("목록 페이지로 이동");
		return "noticeboard/noticeBoardList";
	}
	*/
	// 목록 화면
	@GetMapping("/noList")
	public String noList(PageVO vo, Model model) {
		System.out.println("noList 이동");
//		System.out.println("검색어: " + vo.getKeyword());
//		System.out.println("검색 조건: " + vo.getCondition());
		
		PageCreator pc = new PageCreator();
		System.out.println(pc);
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));

		System.out.println(pc);

		model.addAttribute("boardList", service.getList(vo));
		model.addAttribute("pc", pc);

		return "noticeboard/noticeBoardList";
	}
	

	//작성 이동
	@GetMapping("/noWrite")
	public String noWrite() {
		System.out.println("공지 작성 페이지로 이동");
		return "noticeboard/noticeBoardWrite";
	}



	//수정 이동
	@GetMapping("/noModi")
	public String noModi() {
		System.out.println("공지 수정 페이지로 이동");
		return "noticeboard/noticeBoardModi";
	}

	/*
	@RequestMapping(value = "/noBoard/noModi", method = RequestMethod.GET)
	public String update(@ModelAttribute("searchVO") BoardVO searchVO, @RequestParam("bno") int bno, Model model) {
		return "/noBoard/noModi";
	}
	*/




}
