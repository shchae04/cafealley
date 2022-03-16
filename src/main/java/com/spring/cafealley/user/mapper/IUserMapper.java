package com.spring.cafealley.user.mapper;

import com.spring.cafealley.command.UserVO;

public interface IUserMapper {

	// 회원 가입 기능
	void join(UserVO vo);

	// 회원 정보 조회 기능
	UserVO getInfo(String userid);

	// 회원 정보 수정
	void updateUser(UserVO vo);

	// 회원 탈퇴 기능
	void deleteUser(String userid);

}
