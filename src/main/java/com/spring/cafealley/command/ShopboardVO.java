package com.spring.cafealley.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
/*
CREATE TABLE shopboard (
		bno	NUMBER(10,0) NOT NULL,
		title	VARCHAR2(300) NOT NULL,
		content	VARCHAR2(2000) NOT NULL,
		regdate	DATE DEFAULT sysdate NULL,
		hit	NUMBER(10,0) DEFAULT 0,
		prono NUMBER(5,0) NOT NULL,
		prono2	NUMBER(5,0),
		prono3	NUMBER(5,0),
		prono4	NUMBER(5,0),
	    filenum NUMBER(5,0)
	);


	CREATE SEQUENCE shopbno_seq
	    START WITH 1
	    INCREMENT BY 1
	    MAXVALUE 1000
	    NOCYCLE
	    NOCACHE;OCACHE;
*/
@Getter
@Setter
@ToString
public class ShopboardVO {
	private int bno;
	private String title;
	private String content;
	private Timestamp regdate;
	private int hit;
	private int prono;
	private int prono2;
	private int prono3;
	private int prono4;
	private int procount;
	private int filenum;
}
