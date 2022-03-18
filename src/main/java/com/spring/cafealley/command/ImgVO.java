package com.spring.cafealley.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 CREATE TABLE img (
	filenum	NUMBER(5,0)	NOT NULL,
	filename	VARCHAR2(50)NOT NULL,
	filename2	VARCHAR2(50) NULL,
	filename3	VARCHAR2(50) NULL,
	filepath	VARCHAR2(100)NULL,
	foldername	VARCHAR2(50)NULL
);

--파일 name2,3은 null이 가능하게 수정함.
ALTER TABLE img MODIFY filename2 VARCHAR2(50) NULL;
ALTER TABLE img MODIFY filename3 VARCHAR2(50) NULL;

CREATE SEQUENCE file_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
  */

@Getter
@Setter
@ToString
public class ImgVO {
	
	private int filenum;
	
	private String filename;
	private String filename2;
	private String filename3;
	private String filepath;
	private String foldername;
	

}
