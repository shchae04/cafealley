package com.spring.cafealley.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE product (
	prono NUMBER(5,0) PRIMARY KEY,
	proname VARCHAR2(30) NULL,
	proprice NUMBER(10,0)	NOT NULL,
	prosellprice	NUMBER(10,0) NOT NULL,
	procate VARCHAR2(50) NOT NULL,
	prodetail	VARCHAR2(1000) NULL,
	prostock NUMBER(5,0) NOT NULL,
	filenum NUMBER(5,0) NOT NULL
);

CREATE SEQUENCE  pro_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
*/

@Getter
@Setter
@ToString
public class ProductVO {
	
	private int prono;
	private String proname;
	private int proprice;
	private int prosellprice;
	private String procate;
	private String prodetail;
	private int prostock;
	private int filenum;
	
	

}
