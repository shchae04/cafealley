package com.spring.cafealley;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.command.ProductVO;
import com.spring.cafealley.product.mapper.IProductMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class ProductTest {
	
	@Autowired
	private IProductMapper mapper;
	
	//상품 등록 테스트
	@Test
	public void proregist() {
		for(int i=1; i<=20; i++) {
			
		ProductVO vo = new ProductVO();
		vo.setProprice(12000+(i * 1000));
		vo.setProsellprice(11000 + (i * 1000));
		vo.setProcategory("원두");
		vo.setProname("콜롬비아 원두" + i);
		vo.setProdetail("이원두는 ~~~" + i);
		vo.setFilenum(i);
		vo.setProstock(100);
		mapper.insertProduct(vo);
		}
		
	}
	
	@Test
	public void getList() {
		//getList에 category 값을 주고 동적 sql문 작성 카테고리별로 불러오기.
		List<ProductVO> list = mapper.getList("시럽"); //카테고리명 작성
		for(ProductVO vo :list) {
			System.out.println(vo);
		}
	}
	
	@Test
	public void updateTest() {
		ProductVO vo = new ProductVO();
		vo.setProno(3); //3번 수정
		vo.setProname("수정된 제품명");
		vo.setProcategory("시럽");
		vo.setProdetail("시럽입니다");
		vo.setProprice(13000);
		vo.setProsellprice(12330);
		vo.setProstock(10);
		mapper.updateProduct(vo);
	}
	
	@Test
	public void deleteTest() {
		mapper.deleteProduct(2);
		if(mapper.getProduct(2) == null) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제 실패");
		}
		
	}
	
	@Test
	public void getProductTest() {
		//3번 가져와봐
		mapper.getProduct(3);
		System.out.println(mapper.getProduct(3));
	}
	
	

}
