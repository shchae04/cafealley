package com.spring.cafealley.promoreply.mapper;

import java.util.List;

import com.spring.cafealley.command.PromoReplyVO;

public interface IPromoReplyMapper {

	//등록
	void replyRegist(PromoReplyVO vo);
	
	//목록요청
	List<PromoReplyVO> getList(int bno);
	
	//댓글 수정
	void replyUpdate(int rno);
	
	//댓글 삭제 
	void replyDelete(int rno);

	


	

}
