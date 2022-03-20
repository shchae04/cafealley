package com.spring.cafealley.util;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {

	@Autowired
	private JavaMailSender mailSender;
	private String authKey;//컨트롤러에 리턴할 인증키 값
	
	//인증 키 발생 메서드
	public void makeRandomKey() {
		String uuid = UUID.randomUUID().toString();
		System.out.println("생성된 인증 번호: " + uuid);
		
		authKey = uuid;
	}
	
	public String joinEmail(String email) {
		
		//joinEmail을 부를 때마다 랜덤 인증 키가 생성됨.
		makeRandomKey();
		
		String setFrom = "developsw1114@naver.com"; // email-config에 설정한 이메일 주소를 입력 
		String toMail = email; // 수신 받을 이메일(클라이언트 쪽에서 보낸 값)
		String title = "[CafeAlley] 이메일 인증을 완료해 주세요."; 
		String content = "안녕하세요 CafeAlley입니다.<br>"
				+ "아래의 인증 키를 이메일 인증란에 입력하시면 가입이 완료됩니다.<br>"
				+ "인증 키는 " + authKey + "입니다.<br>"
				+ "가입을 원하지 않거나 요청하지 않은 경우 이 메시지를 무시하고 삭제하십시오.<br>"
				+ "감사합니다.<br>";//html형식으로 이메일 내용 삽입
		
		mailSend(setFrom, toMail, title, content);
		
		return authKey;
		
	}
	
	
	// 이메일 전송 메서드
	public void mailSend(String setFrom, String toMail, String title, String content)  {
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			//두번째 매개값에 true전달 => html형식으로 전송, 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content, true);
			
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	
	
	
	
	
}























