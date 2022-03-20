package com.spring.cafealley.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.cafealley.board.service.IBoardService;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.img.service.IImgService;
import com.spring.cafealley.util.PageVO;


@Controller
@RequestMapping("/noBoard")
public class NoBoardController {

	@Autowired
	private IBoardService service;
	
	@Autowired
	private IImgService imgservice;
	
	//상세보기 이동처리
	@GetMapping("/noDetail")
	public String getContent(int bno, @ModelAttribute("p") PageVO vo, Model model) {
		System.out.println("공지 상세보기 페이지로 이동");
		model.addAttribute("article",service.getContent(bno));
		
		return "noticeboard/noticeBoardDetail";
		
	}
	
	//목록 이동처리
	@GetMapping("/noList")
	public String nolist(PageVO vo, Model model) {
		System.out.println("공지 리스트 페이지로 이동");
		
		//목록 불러와라
		service.getList(vo);
		
		model.addAttribute("noList",service.getList(vo));
		
//		페이징처리
//		model.addAttribute("pc",pc); 
		
		return "noticeboard/noticeBoardList";
	}
	
	//작성 이동처리
	@GetMapping("/noWrite")
	public String noWrite() {
		System.out.println("공지 작성 페이지로 이동");
		return "noticeboard/noticeBoardWrite";
	}
	
	
	//수정 페이지 이동.
	@GetMapping("/noModi")
	public String noModi(int bno,Model model) {
		model.addAttribute("article",service.getContent(bno));
		System.out.println("공지 수정 페이지로 이동");
		return "noticeboard/noticeBoardModi";
	}
	
	//글 등록 처리
	@PostMapping("/write")
	public String write(BoardVO vo,MultipartFile file) {
		System.out.println("작성요청이 들어옴");
		System.out.println("받은값 : " + vo +"파일"+ file);
		
		List<MultipartFile> files =  new ArrayList<MultipartFile>();
		files.add(file);
		


		//key를 가장최근 업로드된 번호로 가져온다
		if(file.getSize() == 0) {
			//파일이 없다.
			vo.setKey(0);
		} else {		
			//파일이 있다.
			imgservice.upload(files);
			System.out.println("file: " + files);
			vo.setKey(imgservice.getLastUploaded());
		}
		
		//key값.
		System.out.println("key값"+vo.getKey());
		System.out.println("작성내용"+vo);
		service.regist(vo);
		
		System.out.println("글 작성 완료 LIST로 이동");
		
		
		 
		
		
		return "redirect:/noBoard/noList";
	}
	
	//수정 처리
	@PostMapping("/modify")
	public String modify(BoardVO vo) {
		
		service.update(vo);
		
		
		return "redirect:/noBoard/noDetail?bno=" + vo.getBno();
	}
	
	
	//삭제 처리
	@PostMapping("/delete")
	public String freeDelete(BoardVO vo) {
		service.delete(vo.getBno());
		System.out.println("삭제완료");
		return "redirect:/noBoard/noList";
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
