package com.spring.cafealley.promoboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<PromoBoardVO> getList(PageVO paging,PromoBoardVO vo) {
		System.out.println("서비스"+mapper.getList(paging, vo));
		System.out.println("서비스"+vo);
		return mapper.getList(paging,vo);
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

	@Override
	public List<PromoLikeVO> bestCafe() {
		return mapper.bestCafe();
	}
	
	@Override
	public PromoBoardVO getRanked(int bno) {
		return mapper.getRanked(bno);
	}
}
