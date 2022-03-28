package com.spring.cafealley.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.cafealley.board.service.ICmBoardService;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.img.service.IImgService;
import com.spring.cafealley.util.PageCreator;
import com.spring.cafealley.util.PageVO;

@Controller
@RequestMapping("/cmBoard")
public class CmBoardController {

	@Autowired
	private IImgService imgservice;
	
	@Autowired
	private ICmBoardService service;
	
	//상세보기 이동처리
	@GetMapping("/cmDetail")
	public String getContent(int bno, @ModelAttribute("p") PageVO vo, Model model) {
		System.out.println("커뮤니티 게시글 상세보기 페이지로 이동");
	
		BoardVO bo = service.getContent(bno);
		
		model.addAttribute("article",service.getContent(bno));
		System.out.println("key값."+service.getContent(bno).getKey());;
		return "communityboard/comBoardDetail";
		
		
	}
	
	//목록 이동처리
	@GetMapping("/cmList")
	public String cmlist(PageVO vo, Model model) {
		System.out.println("커뮤니티 게시글 리스트 페이지로 이동");
		
		//목록 불러와라
		service.getList(vo);
		
		model.addAttribute("cmList",service.getList(vo));
		
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		System.out.println(pc);
//		페이징처리
		model.addAttribute("pc",pc); 
		
		return "communityboard/comBoardList";
	}
	
	//작성 이동처리
	@GetMapping("/cmWrite")
	public String noWrite() {
		System.out.println("커뮤니티 게시글 작성 페이지로 이동");
		return "communityboard/comBoardWrite";
	}
	
	
	//수정 페이지 이동.
	@GetMapping("/cmModi")
	public String noModi(int bno,Model model) {
		model.addAttribute("article",service.getContent(bno));
		System.out.println("공지 게시글 수정 페이지로 이동");
		return "communityboard/comBoardModi";
	}
	
	//글 등록 처리
	@PostMapping("/write")
	public String write(BoardVO vo,MultipartHttpServletRequest file) {
		System.out.println("작성요청이 들어옴");
		System.out.println("받은값 : " + vo +"파일"+ file);
		
		List<MultipartFile> files =  file.getFiles("files");
		
		System.out.println("파일 사이즈:" + files.size());

		System.out.println("list files :" + files);
		
		//key를 가장최근 업로드된 번호로 가져온다
		if(files.size() == 1) {
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
		
		
		 
		
		
		return "redirect:/cmBoard/cmList";
	}
	
	//수정 처리
	@PostMapping("/modify")
	public String modify(BoardVO vo) {
		
		service.update(vo);
		
		
		return "redirect:/cmBoard/cmDetail?bno=" + vo.getBno();
	}
	
	
	//삭제 처리
	@PostMapping("/delete")
	public String freeDelete(BoardVO vo) {
		service.delete(vo.getBno());
		System.out.println("삭제완료");
		return "redirect:/cmBoard/cmList";
		}
	
	
	
}
