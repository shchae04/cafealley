package com.spring.cafealley.img.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cafealley.command.ImgVO;
import com.spring.cafealley.img.mapper.IImgMapper;


public class ImgService implements IImgService {

	@Autowired
	private IImgMapper mapper;

	@Override
	public void upload(MultipartFile file, String filename, HttpSession session) {
		
		
try {
			
	//파일업로드에는 filenum,filename,filename2,fillname3,filepath,foldername
//			String writer = ((UserVO)session.getAttribute("login")).getUserId();
			
			//날짜별로 폴더를 생성해서 파일을 관리
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			String fileLoca = sdf.format(date);
			
			//저장할 폴더 경로
			String uploadPath = "C:\\Users\\shcha\\Desktop\\upload\\" + fileLoca;
			
			File folder = new File(uploadPath);
			if(!folder.exists()) {
				folder.mkdir(); //폴더가 존재하지 않는다면 생성해라.
			}
			
			String fileRealName = file.getOriginalFilename();
			
			//파일명을 고유한 랜덤 문자로 생성.
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
			
			//확장자를 추출합니다.
			String fileExtension = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());
			
			System.out.println("저장할 폴더 경로: " + uploadPath);
			System.out.println("실제 파일명: " + fileRealName);
			System.out.println("폴더명: " + fileLoca);
			System.out.println("확장자: " + fileExtension);
			System.out.println("고유랜덤문자: " + uuids);
			
			String fileName = uuids + fileExtension;
			System.out.println("변경해서 저장할 파일명: " + fileName);
			
			//업로드한 파일을 서버 컴퓨터의 지정한 경로 내에 실제로 저장.
			File saveFile = new File(uploadPath + "\\" + fileName);
			file.transferTo(saveFile);
			
			//DB에 insert 작업을 진행.
			ImgVO imgfile = new ImgVO();
			imgfile.setFilename(fileRealName);	
			imgfile.setFilepath(uploadPath);
			imgfile.setFoldername(fileLoca);
			mapper.upload(imgfile);
					
			
		} catch (Exception e) {
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			//에러가 났을 시에는 실패
		}
		
		
	}
	
	
	@Override
	public void delete(int filenum) {
		mapper.delete(filenum);
		
	}

	@Override
	public ImgVO select(int filenum) {
		
		return mapper.select(filenum);
	}
	

}
