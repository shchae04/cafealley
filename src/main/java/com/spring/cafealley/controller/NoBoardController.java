package com.spring.cafealley.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.mail.Multipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.cafealley.board.service.IBoardService;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.img.service.IImgService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/noBoard")
public class NoBoardController {

	@Autowired
	private IBoardService service;
	
	@Autowired
	private IImgService imgservice;
	
	@GetMapping("/noDetail")
	public String nodetail() {
		System.out.println("공지 상세보기 페이지로 이동");		
		return "noticeboard/noticeBoardDetail";
	}
	
	@GetMapping("/noList")
	public String nolist() {
		System.out.println("공지 리스트 페이지로 이동");
		return "noticeboard/noticeBoardList";
	}
	
	@GetMapping("/noWrite")
	public String noWrite() {
		System.out.println("공지 작성 페이지로 이동");
		return "noticeboard/noticeBoardWrite";
	}
	
	
	@GetMapping("/noModi")
	public String noModi() {
		System.out.println("공지 수정 페이지로 이동");
		return "noticeboard/noticeBoardModi";
	}
	
	@PostMapping("/write")
	public String write(BoardVO vo,MultipartFile file) {
		System.out.println("작성요청이 들어옴");

		
		List<MultipartFile> files =  new ArrayList<MultipartFile>();
		files.add(file);
			
			
		
		imgservice.upload(files);
		System.out.println("file: " + files);
		

		//key를 가장최근 업로드된 번호로 가져온다
		vo.setKey(imgservice.getLastUploaded());
		
		//key값.
		System.out.println("key값"+vo.getKey());
		System.out.println("작성내용"+vo);
		service.regist(vo);
		
		
		
		
		
		
		 
		
		
		return "redirect:/noticeBoard/noticeBoardList";
	}
	
	
//	@ResponseBody
//	@PostMapping("/upload")
//	public String upload(MultipartFile file) {
//		
//		List<MultipartFile> files = new ArrayList<>();
//		files.add(file);
//		
//		imgservice.upload(files);
//		System.out.println("DB파일업로드");
//		//ajax응답.
//		return "noList";
//	}
//	
	
	
}
