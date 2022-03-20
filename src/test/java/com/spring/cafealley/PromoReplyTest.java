package com.spring.cafealley;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.command.PromoReplyVO;
import com.spring.cafealley.promoreply.mapper.IPromoReplyMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")

public class PromoReplyTest {
	@Autowired
	private IPromoReplyMapper mapper;
	
	@Test
	public void regist() {
		for(int i=1; i<=30; i++) {
			PromoReplyVO vo = new PromoReplyVO();
			vo.setBno(3);
			vo.setWriter("김아무개"+i);
			vo.setContent("댓글 수정 테스트 " + i);
			mapper.replyRegist(vo);
		}
	}
	
	@Test
	public void update() {
		PromoReplyVO vo = new PromoReplyVO();
		vo.setRno(1);
		vo.setContent("수정완료");
		vo.setIsmod("1");
		mapper.replyUpdate(1);
		System.out.println();
	}
	
	@Test
	public void getListTest() {
		List<PromoReplyVO> list = mapper.getList(3);
		for(PromoReplyVO vo : list) {
			System.out.println(vo);
		}
	}
	
	
	@Test
	public void delete() {
		mapper.replyDelete(3);
	}
		
	
}

	    
