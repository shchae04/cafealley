package com.spring.cafealley.reply.mapper;

import java.util.List;

import com.spring.cafealley.command.ReplyVO;
import com.spring.cafealley.util.PageVO;

public interface INoReplyMapper {

	//등록
	void replyRegist(ReplyVO vo);
	
	//목록요청
	List<ReplyVO> getList(int bno);
	
	//댓글 수정
	void replyUpdate(ReplyVO vo);
	
	//댓글 삭제 rno,bno.조인.
	void replyDelete(int rno);
	
	//총 게시물 수
	int getTotal(PageVO vo);
	
	//목록 요청(페이징)
	List<ReplyVO> getReplyList(PageVO vo);

}
