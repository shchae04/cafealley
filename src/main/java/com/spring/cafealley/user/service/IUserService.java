package com.spring.cafealley.user.service;

import java.util.Date;

import com.spring.cafealley.command.UserVO;

public interface IUserService {

	// 아이디 중복 확인
	int idCheck(String userId);

	// 회원 가입
	void userJoin(UserVO vo);

	// 로그인
	UserVO login(String userId, String userPw);

	// 회원 정보 얻어오기
	UserVO getInfo(String userId);

	// 회원정보 수정
	void updateUser(UserVO vo);

	// 비밀번호 확인
	int checkPw(String userpw);

	// 회원 정보 삭제
	void deleteUser(String userId);

	// 자동 로그인 쿠키 값 DB저장 처리
	// SQL -> INSERT(x) UPDATE(o)
	// 기존에 존재하는 회원의 특정 컬럼값을 수정하는 것이기 때문에.(session id의 기본값이 'none')
	// 컨트롤러에게 받은 매개값으로 받은 값을 Map으로 포장해야 함
	// MyBatis로 DB연동을 진행할 때 파라미터 값이 2개 이상이라면 어노테이션을 사용하거나 맵 혹은 객체로 포장해 보내야 한다.
	void keepLogin(String session, Date limittime, String userid);

}















