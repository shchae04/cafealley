package com.spring.cafealley.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cafealley.command.ProductVO;
import com.spring.cafealley.product.mapper.IProductMapper;

@Service
public class ProductService implements IProductService {

	@Autowired
	private IProductMapper mapper;
	
	@Override
	public List<ProductVO> getList(String procategory) {
		return mapper.getList(procategory);
	}

	@Override
	public void insertProduct(ProductVO vo) {
		mapper.insertProduct(vo);
	}
	
	@Override
	public void updateProduct(ProductVO vo) {
		
		mapper.updateProduct(vo);
	}

	@Override
	public void deleteProduct(int prono) {
		mapper.deleteProduct(prono);
	}

	@Override
	public ProductVO getProduct(int prono) {
		return mapper.getProduct(prono);
	}

}
