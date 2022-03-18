package com.spring.cafealley.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {
	
	private int rno;
	private int bno;
	
	//userid === writer join 조건
	private String writer;
	private String content;
	private Timestamp regdate;
	private String ismod;
}
