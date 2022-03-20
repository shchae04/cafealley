package com.spring.cafealley.command;


import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
	CREATE TABLE users (
	    userid VARCHAR2(50) PRIMARY KEY,
	    userpw VARCHAR2(100) NOT NULL,
	    username VARCHAR2(50) NOT NULL,
	    userphone1 VARCHAR2(50),
	    userphone2 VARCHAR2(50),
	    userphone3 VARCHAR2(50),
	    useremail VARCHAR2(100),
	    addrbasic VARCHAR2(300),
	    addrdetail VARCHAR2(300),
	    zipcode VARCHAR2(50),
	    businessnum VARCHAR2(50),
	    filenum NUMBER(10,0),
	    admin VARCHAR2(50) DEFAULT NULL
		);
		
	
	-- 자동 로그인 관련 컬럼 추가    
	ALTER TABLE users
		ADD sessionid VARCHAR2(80)
		DEFAULT 'none' NOT NULL;
		
	ALTER TABLE users
		ADD limittime DATE;
	 */
@Getter
@Setter
@ToString
public class UserVO {

	private String userid;
	private String userpw;
	private String username;
	private String userphone1;
	private String userphone2;
	private String userphone3;
	private String useremail;
	private String addrbasic;
	private String addrdetail;
	private String zipcode;
	private String businessnum;
	private long filenum;
	private String admin;
	
	private String sessionid;
	private Timestamp limittime;//자동로그인 유지 시간
	
	//자동로그인 체크 여부
	private boolean autoLogin;
	
}
