package com.spring.cafealley.promoboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cafealley.command.PromoBoardVO;
import com.spring.cafealley.command.PromoLikeVO;
import com.spring.cafealley.util.PageVO;

public interface IPromoBoardMapper {

	//글 등록
	void regist(PromoBoardVO vo);

	//목록
	List<PromoBoardVO> getList(@Param("page") PageVO paging, @Param("vo") PromoBoardVO vo);

	//상세보기
	PromoBoardVO getContent(int bno);

	//수정
	void update(PromoBoardVO vo);

	//삭제
	void delete(int bno);
	
	////////////////////////////////////////////////////////////////////
	
	//좋아요 추가
	void createLike(PromoLikeVO vo);
	
	//좋아요 검색
	PromoLikeVO searchLike(PromoLikeVO vo);
	
	//좋아요 삭제
	void deleteLike(PromoLikeVO vo);
	
	//글목록 볼때 좋아요 여부 체크
	List<Integer> listLike(String id);
	
	//게시글마다 좋아요 개수 체크
	int likeCnt(int bno);
	
	//총 게시물 수
	int getTotal(PageVO vo);
	
	
	
	
	
	
	
	
	
	
}