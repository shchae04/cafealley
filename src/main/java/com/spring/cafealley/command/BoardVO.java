package com.spring.cafealley.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private int bno;
	private String writer;
	private int key;
	private String title;
	private String content;
	private Timestamp regdate;
	private int cnt;
	private String ismod;
}
