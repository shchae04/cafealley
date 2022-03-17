package com.spring.cafealley;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.board.mapper.IBoardMapper;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.command.ReplyVO;
import com.spring.cafealley.reply.mapper.IReplyMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class ReplyTest {
	
	@Autowired
	private IReplyMapper mapper;
	
	@Test
	public void registTest() {
		for(int i=1; i<=30; i++) {
			ReplyVO vo = new ReplyVO();
			vo.setBno(3);
			vo.setWriter("chae Test"+i);
			vo.setContent(" 댓글글쓰기 테스트입니다 test . " + i);
			mapper.replyRegist(vo);
		}
	}
	
	@Test
	public void update() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(1);
		vo.setContent("수정했습니다 댓글 1번");
		vo.setIsmod("1");
		mapper.replyUpdate(vo);
		System.out.println();
	}
	
	@Test
	public void getListTest() {
		List<ReplyVO> list = mapper.getList(3);
		for(ReplyVO vo : list) {
			System.out.println(vo);
		}
	}
	
	
	@Test
	public void delete() {
		mapper.replyDelete(3);
		
	
	}

}
