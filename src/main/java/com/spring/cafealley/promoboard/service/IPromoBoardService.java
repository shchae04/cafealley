package com.spring.cafealley.promoboard.service;

import java.util.List;

import com.spring.cafealley.command.PromoBoardVO;
import com.spring.cafealley.util.PageVO;

public interface IPromoBoardService {

	//글 등록
	void regist(PromoBoardVO vo);

	//목록
	List<PromoBoardVO> getList(PageVO paging);

	//상세보기
	PromoBoardVO getContent(int bno);

	//수정
	void update(PromoBoardVO vo);

	//삭제
	void delete(int bno);
}