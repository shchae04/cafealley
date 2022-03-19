package com.spring.cafealley.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.user.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService service;

	// 회원가입 버튼을 누르면 회원유형 선택 페이지로 이동
	@GetMapping("/joinSelect")
	public void joinSelect() {
	}

	// 아이디 중복 체크(비동기)
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {

		int result = service.idCheck(userId);

		if (result == 0) {
			return "available";
		} else {
			return "duplicated";
		}
	}

	// 일반 회원 가입버튼 클릭 시
	@GetMapping("/formJoinGen")
	public String formJoinGen() {
		return "user/formJoin";
	}

	// 사업자 회원 가입버튼 클릭 시(model객체에 사업자 회원 여부를 담음)
	@GetMapping("/formJoinBsns")
	public String formJoinBsns(Model model) {
		model.addAttribute("userType", "business");
		return "user/formJoin";
	}

	// 회원가입 처리
	@PostMapping("/joinFinish")
	public void joinFinish(@ModelAttribute("info") UserVO vo) {
		System.out.println("컨트롤러의 joinFinish 메서드 발동");
		System.out.println("param: " + vo);
		service.userJoin(vo);
	}

	// 로그인 요청 처리
	@ResponseBody
	@PostMapping("/loginCheck")
	public String loginCheck(@RequestBody UserVO vo, HttpSession session, HttpServletResponse response) {

		System.out.println("컨트롤러의 loginCheck 메서드 발동");
		System.out.println("param: " + vo);

		String userid = vo.getUserid();
		String userpw = vo.getUserpw();

		UserVO userInfo = service.getInfo(vo.getUserid());
		
		if(userInfo.getUserpw().equals(userpw)) {// 비밀번호가 db에 존재한다면
			if(userInfo.getUserid().equals(userid)) {// id가 db에 존재한다면
				System.out.println("loginSuccess");
				
				// 로그인 한 회원만 세션 생성
				session.setAttribute("login", userInfo);
				
				// 자동로그인 유지 시간
				// 자동로그인 유지시간을 long타입으로 지정
				// -> 만료시간을 계산해서 DB와 연동해서 관리해야 하기 때문에(currentTimeMillis은 밀리초로 계산됨)
				long limitTime = 60 * 60 * 24 * 90;//90일
				
				// 자동 로그인 체크 시 처리해야 할 내용
				if(vo.isAutoLogin()) {
					
					// 자동 로그인을 희망하는 경우
					// 쿠키를 이용하여 자동 로그인 정보를 저장.
					System.out.println("자동 로그인 쿠키 생성 중...");
					
					//세션아이디를 가져와 쿠키에 저장(고유한 값이 필요해서)
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("http://localhost/cafealley/");//쿠키가 동작할 수 있는 유효한 url 설정
					loginCookie.setMaxAge((int) limitTime);//쿠키 만료시간 설정
					
					response.addCookie(loginCookie);//응답객체에 쿠키를 태워 보냄
					
					//자동 로그인 유지 시간을 날짜 객체로 변환(DB에 삽입하기 위해, 밀리초)
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					//Date 객체의 생성자에 매개값으로 밀리초의 정수를 전달하면 날자 형태로 변경해 줌
					Date limitDate = new Date(expiredDate);
					
					System.out.println("자동 로그인 만료 시간: " + limitDate);
					
					service.keepLogin(session.getId(), limitDate, vo.getUserid());
					
				}
				return "loginSuccess";
			}
			return "idFail";
		}
		return "pwFail";

		/*
		 //암호화 한 비밀번호를 응답받은 비밀번호와 equal로 바로 비교하지 않고
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserVO dbData =  service.selectOne(vo.getAccount());
		
		if(dbData != null) {
			//원본비밀번호와 dbData의 비밀번호를 비교하는 메서드matches 사용
			//암호화 되지 않은 계정은 이제 로그인하지 못함
			if(encoder.matches(vo.getPassword(), dbData.getPassword())) {
				//로그인 성공 회원을 대상으로 세션 정보를 생성
				session.setAttribute("login", dbData);
				
				//자동로그인 유지 시간
				//자동로그인 유지시간을 long타입으로 지정
				// -> 만료시간을 계산해서 DB와 연동해서 관리해야 하기 때문에(currentTimeMillis은 밀리초로 계산됨)
				long limitTime = 60 * 60 * 24 * 90;//90일
				
				//자동 로그인 체크 시 처리해야 할 내용
				if(vo.isAutoLogin()) {
					
					//자동 로그인을 희망하는 경우
					//쿠키를 이용하여 자동 로그인 정보를 저장.
					System.out.println("자동 로그인 쿠키 생성 중...");
					
					//세션아이디를 가져와 쿠키에 저장(고유한 값이 필요해서)
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/");//쿠키가 동작할 수 있는 유효한 url 설정
					loginCookie.setMaxAge((int) limitTime);//쿠키 만료시간 설정
					
					response.addCookie(loginCookie);//응답객체에 쿠키를 태워 보냄
					
					//자동 로그인 유지 시간을 날짜 객체로 변환(DB에 삽입하기 위해, 밀리초)
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					//Date 객체의 생성자에 매개값으로 밀리초의 정수를 전달하면 날자 형태로 변경해 줌
					Date limitDate = new Date(expiredDate);
					
					System.out.println("자동 로그인 만료 시간: " + limitDate);
					
					service.keepLogin(session.getId(), limitDate, vo.getAccount());
					
				}
				
				return "loginSuccess";
			} else {
				return "pwFail";
			}
		} else {
			return "idFail";
		}
		 */

	}// end loginCheck()

	// 마이페이지로 이동
	@GetMapping("/businessUserInfo")
	public void businessUserInfo(HttpSession session, Model model) {
		System.out.println("컨트롤러의 businessUserInfo 메서드 발동");

		String userid = ((UserVO) session.getAttribute("login")).getUserid();

		UserVO userInfo = service.getInfo(userid);
		model.addAttribute("userInfo", userInfo);

	}

	// 마이페이지 수정 요청
	@PostMapping("/userUpdate")
	public String userUpdate(UserVO vo) {
		System.out.println("컨트롤러의 userUpdate 메서드 발동");
		System.out.println("param: " + vo);
		
		service.updateUser(vo);

		return "redirect:/";
	}

	// 탈퇴페이지로 이동
	@GetMapping("/memDelete")
	public void memDelete() {
		
	}
	
	
	// 탈퇴 처리
	@ResponseBody
	@PostMapping("/memDelete")
	public String memDelete(@RequestBody UserVO vo, HttpSession session) {
		System.out.println("컨트롤러의 memDelete 메서드 발동");
		
		String userid = vo.getUserid();
		String userpw = vo.getUserpw();
		
		int result = service.checkPw(userpw);
		if (result == 1) {
			session.removeAttribute("login");
			service.deleteUser(userid);
			return "match";
		} else {
			return "none";
		}

	}

}
