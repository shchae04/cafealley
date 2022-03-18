package com.spring.cafealley.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.cafealley.command.ImgVO;
import com.spring.cafealley.img.service.IImgService;

@Controller
@RequestMapping("/loadimg")
public class ImgController {
	
	@Autowired
	IImgService service;
	
	@GetMapping("/display/{fileNum}/{order}")
	// ResponseEntity : 응답으로 변활될 정보를 모두 담은 요소들을 객체로 만들어서 반환해줍니다.
	public ResponseEntity<byte[]> getFile(@PathVariable int fileNum,
										  @PathVariable int order){
		ImgVO img = service.select(fileNum);
		String fileName = "";
		if(order == 1)
			fileName += img.getFilename();
		else if (order ==2)
			fileName += img.getFilename2();
		else
			fileName += img.getFilename3();
			
		String filePath = img.getFilepath();
		System.out.println("fileName : " + fileName);
		System.out.println("filePath : " + filePath);
		
		File file = new File(filePath + "\\" + fileName);
		System.out.println(file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
		
			HttpHeaders headers = new HttpHeaders();
			
			// probeContentType : 파라미터로 전달받은 파일의 타입을 문자열로 변환해 주는 메서드.
			// 사용자에게 보여주고자 하는 데이터가 어떤 파일인지를 검사해서 응답 상태코드를 다르게 리턴할 수 있습니다.
			// -> 즉. 우리가 위에서 작성한 파일의 경로를 던져주면 해당경로의 파일을 검사해서 어떤 contentType인지 판단해서 알아서 리턴해줌.
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			
			// 응답과 함께 어떤 정보를 전달해야할때 쓰이는 것이 헤더 객체이기 때문에 헤더에는 사실 
			// 꼭 써야만하는 형식이 존재하는게 아니라 우리가 마음대로 작성할 수 있다.
			
			// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지);
			// FileCopyUtils : 파일 및 스트림 데이터 복사를위한 간단한 유틸리티 메서드의 집합체.
			// copyToByteArray라는 메서드를 통해 file객체 안에 있는 내용을 복사해서 byte 배열로 변환해서 바디에 담아 화면에 전달.
			// ★ 파일 자체를 화면단으로 전달해주면 제대로 출력 될 수도 있지만 JS의 문법, 브라우저 종류 등 다양한 이유로 제대로 표현되지 않을 수 있기 때문에
			// 가장 작은 단위인 byte로 전달하는 방법이 정확하게 전달해줄 수 있는 방법이다.
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		return result;
	}
	

}
