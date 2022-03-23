package com.spring.cafealley.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 
 
 
 */

@Getter
@Setter
@ToString
public class PromoBoardVO {
	private int bno;
	private String writer;
	private int key;
	private String content;
	private String area;
	private String place;
	private Timestamp regdate;
	private String limitation1;
	private String limitation2;
	private String limitation3;
	private String ismod;
	
	//파일 개수가 몇 개인지를 알려주는 컬럼 추가.
	private int filecnt;
	
	//좋아요 개수가 몇 개인지를 알려주는 컬럼 추가.
	private int likeCnt;
}












