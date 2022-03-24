package com.spring.cafealley.command;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
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


CREATE SEQUENCE file_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
  */
@NoArgsConstructor
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
	


	public ImgVO(int filenum, String filename, String filepath, String foldername) {
		super();
		this.filenum = filenum;
		this.filename = filename;
		this.filepath = filepath;
		this.foldername = foldername;
	}

	public ImgVO(int filenum, String filename, String filename2, String filepath, String foldername) {
		super();
		this.filenum = filenum;
		this.filename = filename;
		this.filename2 = filename2;
		this.filepath = filepath;
		this.foldername = foldername;
	}
	
	public ImgVO(int filenum, String filename, String filename2, String filename3, String filepath, String foldername) {
		super();
		this.filenum = filenum;
		this.filename = filename;
		this.filename2 = filename2;
		this.filename3 = filename3;
		this.filepath = filepath;
		this.foldername = foldername;
	}
	

}
