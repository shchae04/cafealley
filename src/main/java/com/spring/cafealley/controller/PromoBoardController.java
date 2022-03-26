package com.spring.cafealley.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cafealley.command.ImgVO;
import com.spring.cafealley.command.PromoBoardVO;
import com.spring.cafealley.command.PromoLikeVO;
import com.spring.cafealley.img.service.IImgService;
import com.spring.cafealley.promoboard.service.IPromoBoardService;
import com.spring.cafealley.util.PageVO;

@Controller
@RequestMapping("/promo")
public class PromoBoardController {
	
	@Autowired
	private IImgService imgService;
	@Autowired
	private IPromoBoardService boardService;

	@GetMapping("/list")
	public String list() {
		System.out.println("카페 게시판 페이지로 이동.");
		return "cafepromboard/cafepromboard";
	}
	
	@ResponseBody
	@PostMapping("/upload")
	public String upload(List<MultipartFile> file, PromoBoardVO vo) {
		
		System.out.println("file: " + file);
		System.out.println("vo: " + vo);
		System.out.println(vo.getWriter());
		System.out.println(vo.getContent());
		
		imgService.upload(file);
		vo.setKey(imgService.getLastUploaded());
		
		vo.setFilecnt(file.size());
		boardService.regist(vo);
		
		return "success";
	}
	
	
	//비동기 통신 후 가져올 목록
	@GetMapping("/getList")
	@ResponseBody
	public List<PromoBoardVO> getList(PageVO paging, PromoBoardVO vo) {
		System.out.println("글 목록 요청 들어옴.");
		System.out.println("요청 페이지 번호: " + paging.getPageNum());
		paging.setCountPerPage(5);
		
		System.out.println("제한사항이 포함된 vo :" + vo);
		
		//제한사항을 command 객체로 받는다.
		
		List<PromoBoardVO> list = boardService.getList(paging,vo);
//		for(PromoBoardVO vo : list) {
//			ImgVO ivo = imgService.select(vo.getKey());
//			if(ivo.getFilename3() == null) {
//				vo.setFilecnt(2);
//			} else if(ivo.getFilename2() == null) {
//				vo.setFilecnt(1);
//			} else {
//				vo.setFilecnt(3);
//			}
//		}
		
		
		for(PromoBoardVO pvo : list) {
			
			pvo.setLikeCnt(boardService.likeCnt(pvo.getBno()));
		}
		
		System.out.println(list);
		
		return list;
	}
	
	//상세보기 처리
	@GetMapping("/getContent/{bno}")
	@ResponseBody
	public PromoBoardVO getContent(@PathVariable int bno) {
		PromoBoardVO vo = boardService.getContent(bno);
		vo.setLikeCnt(boardService.likeCnt(vo.getBno()));
		return vo;
	}
	
	//수정 처리
	@PostMapping("/update")
	@ResponseBody
	public String update(@RequestBody PromoBoardVO vo) {
		System.out.println(vo);
		boardService.update(vo);
		return "modSuccess";
	}
	
	//삭제 처리
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody int bno) {
		boardService.delete(bno);
		return "delSuccess";
	}
	
	//좋아요 버튼 클릭 처리
	@PostMapping("/like")
	@ResponseBody
	public String likeConfirm(@RequestBody PromoLikeVO vo) {
		System.out.println(vo.getBno());
		System.out.println(vo.getUserid());
		
		PromoLikeVO dbData = boardService.searchLike(vo);
		if(dbData == null) {
			boardService.createLike(vo);
			return "like";
		} else {
			boardService.deleteLike(vo);
			return "delete";
		}
	}
	
	//회원이 글목록 진입시 좋아요 수 체크
	@PostMapping("/listLike")
	@ResponseBody
	public List<Integer> listLike(@RequestBody String id) {
		System.out.println("listLike id: " + id);
		List<Integer> list = boardService.listLike(id);
		return list;
	}
	
	
	
	
//	@GetMapping("/display/{fileNum}/{filecnt}")
//	public ResponseEntity<byte[]> getFile(@PathVariable int fileNum, @PathVariable int filecnt) {
//		System.out.println("파일 번호: " + fileNum);
//		System.out.println("몇 번째 파일?: " + filecnt);
//		
//		ImgVO vo = imgService.select(fileNum);
//		String fileName = "";
//		if(filecnt == 1) {
//			fileName += vo.getFilename();
//		} else fi
//		
//		
//	}
	
	
	
	
	
	
}













