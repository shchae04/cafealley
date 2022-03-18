package com.spring.cafealley.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.cafealley.board.mapper.INoBoardMapper;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.util.PageVO;

@Service
public class BoardService implements IBoardService {

	private INoBoardMapper mapper;
	
	@Override
	public void regist(BoardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<BoardVO> getList(PageVO vo) {
		List<BoardVO> list = mapper.getList(vo);
		
		return list;
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public BoardVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update(BoardVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}

}
