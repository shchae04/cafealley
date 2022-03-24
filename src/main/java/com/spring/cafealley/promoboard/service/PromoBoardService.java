package com.spring.cafealley.promoboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cafealley.command.PromoBoardVO;
import com.spring.cafealley.command.PromoLikeVO;
import com.spring.cafealley.promoboard.mapper.IPromoBoardMapper;
import com.spring.cafealley.util.PageVO;

@Service
public class PromoBoardService implements IPromoBoardService {

	@Autowired
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

	@Override
	public void createLike(PromoLikeVO vo) {
		mapper.createLike(vo);
	}

	@Override
	public PromoLikeVO searchLike(PromoLikeVO vo) {
		return mapper.searchLike(vo);
	}

	@Override
	public void deleteLike(PromoLikeVO vo) {
		mapper.deleteLike(vo);
	}
	
	@Override
	public List<Integer> listLike(String id) {
		return mapper.listLike(id);
	}
	
	@Override
	public int likeCnt(int bno) {
		return mapper.likeCnt(bno);
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	
}
