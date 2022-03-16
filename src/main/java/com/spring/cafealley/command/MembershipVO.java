package com.spring.cafealley.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MembershipVO {

	/*
	 CREATE TABLE membership (
	    ordernum NUMBER(10,0) PRIMARY KEY,
	    userid VARCHAR2(50) NOT NULL,
	    orderdate DATE DEFAULT sysdate NOT NULL,
	    sbscrdate DATE,
	    orderstatus VARCHAR2(50) NOT NULL,
	    bankusername VARCHAR2(50),
	    bankname VARCHAR2(50),
	    period NUMBER(10,0)
		);

	CREATE SEQUENCE membership_seq 
	    START WITH 1
	    INCREMENT BY 1
	    MAXVALUE 1000
	    NOCYCLE
	    NOCACHE;
	 */
	
	private int ordernum;
	private String userid;
	private Timestamp orderdate;
	private Timestamp sbscrdate;
	private String orderstatus;
	private String bankusername;
	private String bankname;
	private int period;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}










