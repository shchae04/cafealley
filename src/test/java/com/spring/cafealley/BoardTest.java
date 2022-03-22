package com.spring.cafealley;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.board.mapper.INoBoardMapper;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.util.PageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class BoardTest {
	
	@Autowired
	private INoBoardMapper mapper;
	
	@Test
	public void registTest() {
		for(int i=1; i<=100; i++) {
			BoardVO vo = new BoardVO();
			vo.setTitle("게시판 테스트 " + i);
			vo.setWriter("chae"+i);
			vo.setContent(" 글쓰기 내용입니다 test . " + i);
			vo.setKey(i);
			System.out.println("작성된 vo" + vo);
			mapper.regist(vo);
		}
	}
	
	@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setBno(3);
		vo.setContent("수정했습니다 3번");
		vo.setTitle("수정된 제목입니다.");
		vo.setWriter("kim1234");
		vo.setIsmod("1");
		mapper.update(vo);
		System.out.println(mapper.getContent(vo.getBno()));
	}
	
	@Test
	public void getListTest() {
		PageVO page = new PageVO();
		List<BoardVO> list = mapper.getList(page);
		for(BoardVO vo : list) {
			System.out.println(vo);
		}
	}
	
	@Test
	public void getcontent() {
		BoardVO vo = mapper.getContent(3);
		System.out.println("3번 게시글" + vo);
	}
	
	@Test
	public void delete() {
		mapper.delete(3);
		if(mapper.getContent(3) == null) {
			System.out.println("삭제됨");
		} else {
			System.out.println("삭제실패");
		}
	}

}
