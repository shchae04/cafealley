package com.spring.cafealley.promoreply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.cafealley.command.PromoReplyVO;
import com.spring.cafealley.promoreply.mapper.IPromoReplyMapper;

public class PromoReplyService implements IPromoReplyService{

	@Autowired
	private IPromoReplyMapper mapper;
	
	public void replyRegist(PromoReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<PromoReplyVO> getList(int bno) {
		return mapper.getList(bno);
	}

	@Override
	public void replyUpdate(PromoReplyVO vo) {
		mapper.replyUpdate(0);
	}

	@Override
	public void replyDelete(int rno) {
		mapper.replyDelete(rno);
	}



}
