package com.spring.cafealley;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.command.PromoBoardVO;
import com.spring.cafealley.promoboard.mapper.IPromoBoardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")

public class PromoBoardTest {
	@Autowired
	private IPromoBoardMapper mapper;
	
	        //등록하기
			@Test
			public void registTest() {
				for(int i=1; i<=30; i++) {
					PromoBoardVO vo = new PromoBoardVO();
					vo.setArea("서울");
					vo.setWriter("김철수");
					vo.setContent("글내용" + i);
					mapper.regist(vo);
				}
			}
			
			//불러오기
			@Test
			public void getcontent() {
				PromoBoardVO vo = mapper.getContent(2);
				System.out.println(vo);
			}
			
			//수정
			@Test
			public void update() {
				PromoBoardVO vo = new PromoBoardVO();
				vo.setBno(4);
				vo.setContent("수정내용");
		        vo.setPlace("지역");
				mapper.update(vo);
				System.out.println(mapper.getContent(4));
			}
			
			//삭제
			@Test
			public void delete() {
				mapper.delete(1);
				if(mapper.getContent(1) == null) {
					System.out.println("삭제 성공");
				} else {
					System.out.println("삭제 실패");
				}
			}
	
}

	    
