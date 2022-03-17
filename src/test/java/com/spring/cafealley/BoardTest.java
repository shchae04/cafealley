package com.spring.cafealley;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.board.mapper.INoBoardMapper;
import com.spring.cafealley.command.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class BoardTest {
	
	@Autowired
	private INoBoardMapper mapper;
	
	@Test
	public void registTest() {
		for(int i=1; i<=30; i++) {
			BoardVO vo = new BoardVO();
			vo.setTitle("게시판 테스트 " + i);
			vo.setWriter("chae"+i);
			vo.setContent(" 글쓰기 내용입니다 test . " + i);
			mapper.regist(vo);
		}
	}

}
