package com.spring.cafealley.product.service;

import java.util.List;

import com.spring.cafealley.command.ProductVO;

public interface IProductService {

	//상품 전체목록 가져오기
	List<ProductVO> getList(String procategory, String keyword);
	
	//상품 등록하기
	void insertProduct(ProductVO vo);
	
	//수정하기
	void updateProduct(ProductVO vo);

	//상품 삭제하기
	void deleteProduct(int prono);
	
	//상품 하나 가져오기
	ProductVO getProduct(int prono);
	
}
