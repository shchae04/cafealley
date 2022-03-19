package com.spring.cafealley.promoboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.cafealley.command.PromoBoardVO;
import com.spring.cafealley.promoboard.mapper.IPromoBoardMapper;
import com.spring.cafealley.util.PageVO;

@Service
public class PromoBoardService implements IPromoBoardService {

	private IPromoBoardMapper mapper;
	
	@Override
	public void regist(PromoBoardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<PromoBoardVO> getList(PageVO paging) {
		return mapper.getList(paging);
	}

	@Override
	public PromoBoardVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update(PromoBoardVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);

	}

}
