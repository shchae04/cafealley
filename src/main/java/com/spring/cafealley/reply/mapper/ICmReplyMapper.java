package com.spring.cafealley.reply.mapper;

import java.util.List;

import com.spring.cafealley.command.ReplyVO;

public interface ICmReplyMapper {

	//등록
	void replyRegist(ReplyVO vo);
	
	//목록요청
	List<ReplyVO> getList(int bno);
	
	//댓글 수정
	void replyUpdate(ReplyVO vo);
	
	//댓글 삭제 rno,bno.조인.
	void replyDelete(ReplyVO vo);

}
