package com.spring.cafealley.user.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.cafealley.command.UserVO;

public interface IUserMapper {
	
	//아이디 중복 확인
	int idCheck(String userId);
	
	// 회원 가입
	void userjoin(UserVO vo);
	
	//로그인
	UserVO login(@Param("userid") String userId, @Param("userpw") String userPw);

	// 회원 정보 조회
	UserVO getInfo(String userId);

	// 회원 정보 수정
	void updateUser(UserVO vo);

	// 회원 탈퇴 
	void deleteUser(@Param("userid") String userId, @Param("userpw") String userPw);

}
