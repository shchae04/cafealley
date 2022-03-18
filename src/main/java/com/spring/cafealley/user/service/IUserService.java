package com.spring.cafealley.user.service;


import com.spring.cafealley.command.UserVO;

public interface IUserService {

	//아이디 중복 확인
	int idCheck(String userId);
	
	//회원 가입
	void userJoin(UserVO vo);
	
	//로그인
	UserVO login(String userId, String userPw);
	
	//회원 정보 얻어오기
	UserVO getInfo(String userId);
	
	//회원정보 수정
	void updateUser(UserVO vo);
	
	//비밀번호 확인
	int checkPw(String userpw);

	
	//회원 정보 삭제
	void deleteUser(String userPw);
	//void deleteUser(String userId, String userPw);
	
	
}
