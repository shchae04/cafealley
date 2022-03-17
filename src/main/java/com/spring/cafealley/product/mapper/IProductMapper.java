package com.spring.cafealley.product.mapper;

import java.util.List;

import com.spring.cafealley.command.ProductVO;

public interface IProductMapper {


	//상품 등록
	void regist(ProductVO vo);
	
	//상품 검색
	List<ProductVO> search(String proname);
	
	//상품 삭제
	void delete(int prono);

}
