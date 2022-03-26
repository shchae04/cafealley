package com.spring.cafealley.shopboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cafealley.command.ShopboardVO;
import com.spring.cafealley.shopboard.mapper.IShopboardMapper;
import com.spring.cafealley.util.PageVO;

@Service
public class ShopboardService implements IShopboardService {

	
	@Autowired
	IShopboardMapper mapper;
	
	@Override
	public void regist(ShopboardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<ShopboardVO> getList(PageVO vo) {
		return mapper.getList(vo);
	}

	@Override
	public ShopboardVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void modify(ShopboardVO vo) {
		mapper.modify(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}
	
	@Override
	public void hit(int bno) {
		mapper.hit(bno);
	}
	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

}
