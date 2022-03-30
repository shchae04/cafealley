package com.spring.cafealley.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.cafealley.command.UserVO;

public class AdminAuthHandler implements HandlerInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("어드민 권한 인터셉터 발동");
		UserVO user = (UserVO)request.getSession().getAttribute("login");
		
		if(user==null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			String html = "<script>alert('로그인이 필요합니다.');history.back();</script>";
			out.print(html);
			out.flush();
			return false;
		}
		if(user.getAdmin() !=null && user.getAdmin().equals("yes")) {
			return true;
		}	
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String html = "<script>alert('권한이 없습니다.');history.back();</script>";
		out.print(html);
		out.flush();
		return false;
		
	}
	
	
	
}





















