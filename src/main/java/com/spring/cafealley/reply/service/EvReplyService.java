package com.spring.cafealley.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cafealley.command.ReplyVO;
import com.spring.cafealley.reply.mapper.IEvReplyMapper;
import com.spring.cafealley.util.PageVO;

@Service
public class EvReplyService implements IEvReplyService {

	@Autowired
	private IEvReplyMapper evmapper;
	
	@Override
	public void replyRegist(ReplyVO vo) {
		evmapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(int bno) {
		return evmapper.getList(bno);
	}

	@Override
	public void replyUpdate(ReplyVO vo) {
		evmapper.replyUpdate(vo);
	}

	@Override
	public void replyDelete(int rno) {
		evmapper.replyDelete(rno);
	}

	@Override
	public int getTotal(PageVO vo) {
		return evmapper.getTotal(vo);
	}

	@Override
	public List<ReplyVO> getReplyList(PageVO vo) {
		return evmapper.getReplyList(vo);
	}



}
