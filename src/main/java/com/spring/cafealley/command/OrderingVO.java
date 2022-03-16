package com.spring.cafealley.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE ordering(
	ordernum NUMBER(10,0) NOT NULL,
	userid VARCHAR2(50) NOT NULL,
	cartno NUMBER(10,0) NOT NULL,
	ordertotalprice NUMBER(10,0) NOT NULL,
	orderstatus VARCHAR2(30),
	orderdate DATE	DEFAULT sysdate	NOT NULL,
	deliverytracknum VARCHAR2(100),
	orderusername VARCHAR2(50) NOT NULL,
	orderuserphone1 VARCHAR2(50) NOT NULL,
	orderuserphone2 VARCHAR2(50) NOT NULL,
	orderuserphone3 VARCHAR2(50) NOT NULL,
	orderuseremail VARCHAR2(50) NOT NULL,
	deliveryname VARCHAR2(50) NOT NULL,
	deliverypostnum VARCHAR2(50) NOT NULL,
	deliverybasicaddr VARCHAR2(50) NOT NULL,
	deliverydetailaddr VARCHAR2(300),
	deliveryphone1 VARCHAR2(50) NOT NULL,
	deliveryphone2 VARCHAR2(50) NOT NULL,
	deliveryphone3 VARCHAR2(50) NOT NULL,
	deliverymemo VARCHAR2(300),
	paymethod VARCHAR2(50) NOT NULL,
	paybankname VARCHAR2(50),
	paybank VARCHAR2(50),
	refundreason VARCHAR2(50),
	refunddetailreason VARCHAR2(300),
	refundtracknum VARCHAR2(100),
	refundbankname VARCHAR2(50),
	refundbak VARCHAR2(50)
);


CREATE SEQUENCE ordernum_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000
    NOCYCLE
    NOCACHE;
*/
@Getter
@Setter
@ToString
public class OrderingVO {
	private int ordernum;
	private String userid;
	private int cartno;
	private int ordertotalprice;
	private String orderstatus;
	private Timestamp orderdate;
	private String orderusername;
	private String orderuserphone1;
	private String orderuserphone2;
	private String orderuserphone3;
	private String orderuseremail;
	private String deliverytracknum;
	private String deliveryname;
	private String deliverypostnum;
	private String deliverybasicaddr;
	private String deliverydetailaddr;	
	private String deliveryphone1;
	private String deliveryphone2;
	private String deliveryphone3;
	private String deliverymemo;
	private String paymethod;
	private String paybankname;
	private String paybank;
	private String refundreason;
	private String refunddetailreason;
	private String refundtracknum;
	private String refundbankname;
	private String refundbank;
	
	public OrderingVO(String userid, int cartno, int ordertotalprice, String orderstatus,
			String orderusername, String orderuserphone1, String orderuserphone2,
			String orderuserphone3, String orderuseremail, String deliveryname, String deliverypostnum,
			String deliverybasicaddr, String deliverydetailaddr, String deliveryphone1, String deliveryphone2,
			String deliveryphone3, String deliverymemo, String paymethod, String paybankname, String paybank) {

		this.userid = userid;
		this.cartno = cartno;
		this.ordertotalprice = ordertotalprice;
		this.orderstatus = orderstatus;
		this.orderusername = orderusername;
		this.orderuserphone1 = orderuserphone1;
		this.orderuserphone2 = orderuserphone2;
		this.orderuserphone3 = orderuserphone3;
		this.orderuseremail = orderuseremail;
		this.deliveryname = deliveryname;
		this.deliverypostnum = deliverypostnum;
		this.deliverybasicaddr = deliverybasicaddr;
		this.deliverydetailaddr = deliverydetailaddr;
		this.deliveryphone1 = deliveryphone1;
		this.deliveryphone2 = deliveryphone2;
		this.deliveryphone3 = deliveryphone3;
		this.deliverymemo = deliverymemo;
		this.paymethod = paymethod;
		this.paybankname = paybankname;
		this.paybank = paybank;
	}	
	
	
	
}
