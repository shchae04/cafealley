package com.spring.cafealley.img.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cafealley.command.ImgVO;
import com.spring.cafealley.img.mapper.IImgMapper;

@Service
public class ImgService implements IImgService {

	@Autowired
	private IImgMapper mapper;

	@Override
	public void upload(List<MultipartFile> fileList) {
		System.out.println("ImgService 이미지 파일 업로드메서드 들어옴");
		try {
			
			//날짜별로 폴더를 생성해서 파일을 관리
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			String foldername = sdf.format(date);
			
			//저장할 폴더 경로 ex) C:\\test\\upload\\20220318
			String filepath = "C:\\test\\upload\\" + foldername;
			
			File folder = new File(filepath);
			if(!folder.exists()) {
				folder.mkdir(); //폴더가 존재하지 않는다면 생성해라.
			}
			System.out.println("ImgService 이미지 파일 업로드메서드에서 폴더까지 만듦.");
			// 파일이 몇개 업로드 됐느냐도 알 수 있으며 해당 파일들의 이름도 저장.
			List<String> filesStrings = new ArrayList<>();
			
			for(MultipartFile file : fileList) {
				//확장자를 추출합니다.
				String fileRealName = file.getOriginalFilename();
				String fileExtension = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());
				
				//파일명을 고유한 랜덤 문자로 생성.
				UUID uuid = UUID.randomUUID();
				String uuids = uuid.toString().replaceAll("-", "");
				
				System.out.println("저장할 폴더 경로: " + filepath);
				System.out.println("실제 파일명: " + fileRealName);
				System.out.println("폴더명: " + foldername);
				System.out.println("확장자: " + fileExtension);
				String filename = uuids + fileExtension;
				System.out.println("변경해서 저장할 파일명: " + filename);
				
				//업로드한 파일을 서버 컴퓨터의 지정한 경로 내에 실제로 저장.
				File saveFile = new File(filepath + "\\" + filename);
				file.transferTo(saveFile);
				
				filesStrings.add(filename);
			}
			// DB에 insert 작업을 진행.
			// 파일 개수에따라 다른 생성자로 VO 생성 
			
			System.out.println("파일 개수 : " + filesStrings.size());
			ImgVO imgfile = null;
			if(filesStrings.size()==1) 
				imgfile = new ImgVO(0, filesStrings.get(0) , filepath, foldername);
			else if(filesStrings.size()==2)
				imgfile = new ImgVO(0, filesStrings.get(0), filesStrings.get(1), filepath, foldername);
			else
				imgfile = new ImgVO(0, filesStrings.get(0), filesStrings.get(1), filesStrings.get(2), filepath, foldername);
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
	
	@Override
	public int getLastUploaded() {
		return mapper.getLastUploaded();
	}
	

}
