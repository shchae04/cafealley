package com.spring.cafealley.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.cafealley.board.mapper.ICmBoardMapper;
import com.spring.cafealley.board.mapper.IEvBoardMapper;
import com.spring.cafealley.board.mapper.INoBoardMapper;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.reply.mapper.ICmReplyMapper;
import com.spring.cafealley.reply.mapper.IEvReplyMapper;
import com.spring.cafealley.reply.mapper.INoReplyMapper;

public class BoardHandler implements HandlerInterceptor {
	
	@Autowired
	ICmBoardMapper cmBoardMapper;

	@Autowired
	IEvBoardMapper evBoardMapper;
	
	@Autowired
	INoBoardMapper noBoardMapper;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println(request.getRequestURI()); 
		
		
		
			// 글 상세보기시 
			if(request.getRequestURI().contains("Detail")) {
				
				//글이 존재하면 retrun true
				if(request.getRequestURI().contains("cmBoard")) {
					BoardVO vo = cmBoardMapper.getContent(Integer.parseInt( request.getParameter("bno") ));
					if(vo != null) {
						return true;
					}
				}else if(request.getRequestURI().contains("evBoard")) {
					BoardVO vo = evBoardMapper.getContent(Integer.parseInt( request.getParameter("bno") ));
					if(vo != null) {
						return true;
					}
				}else if(request.getRequestURI().contains("noBoard")) {
					BoardVO vo = noBoardMapper.getContent(Integer.parseInt( request.getParameter("bno") ));
					if(vo != null) {
						return true;
					}
				}
				
				// 글이 존재하지 않는다면 (vo가 null이라서 return true되지 않았다면)
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				String html = "<script>alert('글이 존재하지 않습니다.');history.back();</script>";
				out.print(html);
				out.flush();
				return false;
			
			// 글 수정, 삭제시
			}else {
				if(request.getSession().getAttribute("login")==null) {
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					String html = "<script>alert('로그인이 필요합니다.');history.back();</script>";
					out.print(html);
					out.flush();
					return false;
				}
				String userid = ( (UserVO) (request.getSession().getAttribute("login")) ).getUserid();
				String writer = cmBoardMapper.getContent(Integer.parseInt(request.getParameter("bno"))).getWriter();
				if(writer.equals(userid)) {
					return true;
				}
				
			}
		
		// reply에대한 작성자 검사는 많이 복잡해서 그냥 각자의 Controller에서 update랑 delete 요청때마다 검사박아넣음.
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String html = "<script>alert('권한이 없습니다.');history.back();</script>";
		out.print(html);
		out.flush();
		return false;
	}
}
