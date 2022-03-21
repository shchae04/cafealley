package com.spring.cafealley.board.service;

import java.util.List;

import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.command.ImgVO;
import com.spring.cafealley.util.PageVO;


public interface IEvBoardService {

	//글 등록
	void regist(BoardVO vo);
	
	//글 목록
	List<BoardVO> getList(PageVO vo);
	
	//총 게시물 수
	int getTotal(PageVO vo);
	
	//상세보기
	BoardVO getContent(int bno);
	
	//수정
	void update(BoardVO vo);
	
	//삭제
	void delete(int bno);
	
	//파일 가져오기
	ImgVO getFile(int key);
}
