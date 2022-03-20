package com.spring.cafealley.shopboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cafealley.command.ShopboardVO;
import com.spring.cafealley.shopboard.mapper.IShopboardMapper;

@Service
public class ShopboardService implements IShopboardService {

	
	@Autowired
	IShopboardMapper mapper;
	
	@Override
	public void regist(ShopboardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<ShopboardVO> getList() {
		return mapper.getList();
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

}
