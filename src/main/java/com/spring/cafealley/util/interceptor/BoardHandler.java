package com.spring.cafealley.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.cafealley.command.UserVO;

public class BoardHandler implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("board-preHandle 권한 검사");
		
		//작성자
		String writer = request.getParameter("writer");
		System.out.println("작성자: " + writer);
		//세션 userid
		HttpSession session = request.getSession();
		 UserVO vo = (UserVO) session.getAttribute("login");
		String userid = vo.getUserid();
		System.out.println("세션 작성자: " +userid);
		
		if(vo != null) {
			if(writer.equals(userid)) {
				System.out.println("세션 id,작성자가 동일합니다.");
				//진입허용
				return true;
				
			} 
			
		} 
		
		
		
		//그렇지 않다면
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script> \r\n");
		out.print("alert('권한이 없습니다.'); \r\n");
		out.print("history.back(); \r\n");
		out.print("</script>");
		
		out.flush();
		
				
		return false;
	}
}
