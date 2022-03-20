package com.spring.cafealley.promoreply.service;

import java.util.List;

import com.spring.cafealley.command.PromoReplyVO;

public interface IPromoReplyService {

	//등록
	void replyRegist(PromoReplyVO vo);
	
	//목록요청
	List<PromoReplyVO> getList(int bno);
	
	//댓글 수정
	void replyUpdate(PromoReplyVO vo);
	
	//댓글 삭제 
	void replyDelete(int rno);

	



}
