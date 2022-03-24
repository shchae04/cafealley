package com.spring.cafealley.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PromoReplyVO {
	
	private int rno;
	private int bno;
	private String writer;
	private String content;
	private Timestamp regdate;
	private String ismod;
	
	private int filenum;
}
