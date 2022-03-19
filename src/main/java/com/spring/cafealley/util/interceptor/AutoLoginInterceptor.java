package com.spring.cafealley.util.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.user.mapper.IUserMapper;

public class AutoLoginInterceptor implements HandlerInterceptor {

	@Autowired
	private IUserMapper mapper;

	// 컨트롤러에 들어가기 전에 인터셉터 발동(preHandle)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("자동 로그인 인터셉터 발동");

		// 쿠키가 없다면 null을 리턴
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

		// 자동 로그인을 신청한 사람이라면 로그인 유지를 위해 세션데이터를 만들어줘야 한다.
		HttpSession session = request.getSession();

		if (loginCookie != null) {// 자동 로그인을 신청했다면

			// DB에서 쿠키 값(세션ID)과 일치하는 세션ID를 가진 회원의 정보를 조회
			UserVO vo = mapper.getUserWithSessionId(loginCookie.getValue());

			System.out.println("쿠키의 값: " + loginCookie.getValue());
			System.out.println("DB에서 가지고 온 값: " + vo);
			if (vo != null) {
				session.setAttribute("login", vo);
				System.out.println("세선 제작 완료");
			}

		}

		// 자동 로그인신청 여부와 상관 없이 무조건 return을 true로 준다.
		// -> 자동 로그인을 신청하지 않은 사람은 로그인 데이터를 만들지 않지만 홈 화면에 가야하기 때문에
		// (return true면 컨트롤러로 요청이 들어가고, false면 요청을 막는다.)
		return true;
	}

}
