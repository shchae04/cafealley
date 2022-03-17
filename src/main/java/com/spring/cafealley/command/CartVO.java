package com.spring.cafealley.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
/*
 * 
CREATE TABLE cart (
	cartno	NUMBER(5,0) PRIMARY KEY,
    carttype NUMBER(10,0) NOT NULL,
	prono	NUMBER(5,0) NOT NULL,
	userid	VARCHAR2(50)	NOT NULL,
	cartamount NUMBER(5,0) NOT NULL,
	carttotalprice NUMBER(10,0)	NOT NULL
);

CREATE SEQUENCE cart_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
    
    CREATE SEQUENCE carttype_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
    
    */

@Getter
@Setter
@ToString
public class CartVO {
	
	private int cartno;
	private int carttype;
	private int prono;
	private String userid;
	private int cartamount;
	private int carttotalprice;

	
	

}
