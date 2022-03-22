package com.spring.cafealley.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cafealley.command.ReplyVO;
import com.spring.cafealley.reply.mapper.ICmReplyMapper;

@Service
public class CmReplyService implements ICmReplyService {

	@Autowired
	private ICmReplyMapper cmmapper;
	
	@Override
	public void replyRegist(ReplyVO vo) {
		cmmapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(int bno) {
		return cmmapper.getList(bno);
	}

	@Override
	public void replyUpdate(ReplyVO vo) {
		cmmapper.replyUpdate(vo);
	}

	@Override
	public void replyDelete(int rno) {
		cmmapper.replyDelete(rno);
	}



}
