package com.spring.cafealley;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.command.ImgVO;
import com.spring.cafealley.img.mapper.IImgMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class uploadFileTest {

	@Autowired
	private IImgMapper mapper;
	
	//파일 등록 테스트
	@Test
	public void uploadTest() {
		for(int i=1; i<=30; i++) {
			ImgVO vo = new ImgVO();
			vo.setFilename("TestFile" + i);
			vo.setFilepath("C:\\test");
			vo.setFoldername("uploadTest");
			mapper.upload(vo);
		}
	}
	
	//파일 셀렉 조인으로 ..음..
	@Test
	public void select() {
		mapper.select(3);
		System.out.println(mapper.select(3));
	}
	
	//파일 삭제
	@Test
	public void delete() {
		mapper.delete(3);
		if(mapper.select(3) == null) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
	}
}
