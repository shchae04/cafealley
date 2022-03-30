package com.spring.cafealley.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.cafealley.board.service.IBoardService;
import com.spring.cafealley.board.service.IEvBoardService;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.command.ImgVO;
import com.spring.cafealley.img.service.IImgService;
import com.spring.cafealley.util.PageCreator;
import com.spring.cafealley.util.PageVO;


@Controller
@RequestMapping("/evBoard")
public class EvBoardController {

	@Autowired
	private IEvBoardService service;
	
	@Autowired
	private IImgService imgservice;
	
	//상세보기 이동처리
	@GetMapping("/evDetail")
	public String getContent(int bno, @ModelAttribute("p") PageVO vo, Model model) {
		System.out.println("이벤트 게시글 상세보기 페이지로 이동");
	
		BoardVO bo = service.getContent(bno);

		model.addAttribute("article",service.getContent(bno));

		
		return "eventboard/EventBoardDetail";
		
		
	}
	
	//목록 이동처리
	@GetMapping("/evList")
	public String evlist(PageVO vo, Model model) {
		System.out.println("이벤트 게시글 리스트 페이지로 이동");
		
		//목록 불러와라
		service.getList(vo);
		
		model.addAttribute("evList",service.getList(vo));
		
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		System.out.println(pc);
//		페이징처리
		model.addAttribute("pc",pc); 
		
		return "eventboard/EventBoardList";
	}
	
	//작성 이동처리
	@GetMapping("/evWrite")
	public String evWrite() {
		System.out.println("이벤트 게시글 작성 페이지로 이동");
		return "eventboard/EventBoardWrite";
	}
	
	
	//수정 페이지 이동.
	@GetMapping("/evModi")
	public String evModi(int bno,Model model) {
		model.addAttribute("article",service.getContent(bno));
		System.out.println("이벤트 게시글 수정 페이지로 이동");
		return "eventboard/EventBoardModi";
	}
	
	//글 등록 처리
	@PostMapping("/write")
	public String write(BoardVO vo,MultipartHttpServletRequest file) {
		System.out.println("작성요청이 들어옴");
		System.out.println("받은값 : " + vo +"파일"+ file);
		
		List<MultipartFile> files =  file.getFiles("files");
		
		

		System.out.println("list files :" + files.get(0).getName().equals(""));
		
		
		
		//파일을 업로드 하지 않으면 
		if(files.get(0).getOriginalFilename().equals("")) {
			
			vo.setKey(0);
			
			service.regist(vo);
			System.out.println("사진없는 글 작성완료~");
			
		} else {
			
			imgservice.upload(files);
			System.out.println("file: " + files);
			vo.setKey(imgservice.getLastUploaded());
			
			System.out.println("key값"+vo.getKey());
			System.out.println("작성내용"+vo);
			service.regist(vo);
			
			System.out.println("글 작성 완료 LIST로 이동");
		}
		
		
	
		 
		
		 
		
		
		return "redirect:/evBoard/evList";
	}
	
	//수정 처리
	@PostMapping("/modify")
	public String modify(BoardVO vo) {
		
		service.update(vo);
		
		
		return "redirect:/evBoard/evDetail?bno=" + vo.getBno();
	}
	
	
	//삭제 처리
	@PostMapping("/delete")
	public String freeDelete(BoardVO vo) {
		service.delete(vo.getBno());
		System.out.println("삭제완료");
		return "redirect:/evBoard/evList";
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
//		return "evList";
//	}
//	
	
	
}
