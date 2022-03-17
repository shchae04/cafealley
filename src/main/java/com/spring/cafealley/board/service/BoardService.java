package com.spring.cafealley.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.cafealley.board.mapper.IBoardMapper;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.util.PageVO;

@Service
public class BoardService implements IBoardService {

	private IBoardMapper mapper;
	
	@Override
	public void regist(BoardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<BoardVO> getList(PageVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(PageVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVO getContent(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub

	}

}
