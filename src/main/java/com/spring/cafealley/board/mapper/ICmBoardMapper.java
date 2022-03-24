package com.spring.cafealley.board.mapper;

import java.util.List;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.command.ImgVO;
import com.spring.cafealley.util.PageVO;

public interface ICmBoardMapper {

	
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
	
	//메인에 top5 목록 불러오기
    List<BoardVO> getMainCmBaord();
}
