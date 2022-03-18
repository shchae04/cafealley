package com.spring.cafealley.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.cafealley.command.ProductVO;

public interface IProductMapper {

	//상품 전체목록 가져오기 category 동적sql
	List<ProductVO> getList(@Param("procategory") String procategory);
	
	//상품 등록하기
	void insertProduct(ProductVO vo);
	
	//상품 삭제하기
	void deleteProduct(int prono);
	
	//수정하기
	void updateProduct(ProductVO vo);
	
	//상품 하나 가져오기
	ProductVO getProduct(int prono);
	
}
