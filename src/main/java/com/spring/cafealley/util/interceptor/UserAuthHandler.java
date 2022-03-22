package com.spring.cafealley.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.cafealley.command.UserVO;

public class UserAuthHandler implements HandlerInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("로그인 권한 인터셉터 발동");
		
		
		String writer = request.getParameter("writer");
		UserVO vo = (UserVO) request.getSession().getAttribute("login");
		
		if(vo != null) {
			if(writer.equals(vo.getUserid())) {
				return true;
			}
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String html = "<script>alert('권한이 없습니다.');</script>";
		out.print(html);
		out.flush();
		response.sendRedirect("/");
		return false;
		
	}
	
	
	
}





















