package com.spring.cafealley.user.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.util.PageVO;

public interface IUserMapper {

	// 아이디 중복 확인
	int idCheck(String userId);

	// 회원 가입
	void userJoin(UserVO vo);

	// 로그인
	UserVO login(@Param("userid") String userId, @Param("userpw") String userPw);

	// 회원 정보 조회
	UserVO getInfo(String userId);
	
	// 총 게시물 수
	int getTotal(PageVO vo);

	// 회원 정보 수정
	void updateUser(UserVO vo);

	// 비밀번호 확인
	String checkPw(String userId);

	// 회원 탈퇴
	void deleteUser(String userid);

	// 자동 로그인 쿠키 값 DB저장 처리
	// SQL -> INSERT(x) UPDATE(o)
	// 기존에 존재하는 회원의 특정 컬럼값을 수정하는 것이기 때문에.(DB의 세션아이디 컬럼의 기본값이 'none')
	void keepLogin(Map<String, Object> data);

	// 세션 아이디를 통한 회원 정보조회 기능
	/* 자동 로그인 체크한 사람에게 쿠키(세션id가 들어있음)를 만들어줌.
	 * 그리고 나서 그 사람이 나중에 사이트에 다시 방문했다면(로그인 쿠키가 유효할 경우) 우리 서버에 요청과 함께 쿠키도 같이 전달이 된다.
	 * 
	 * 우리는 쿠키 안에 들어있는 session id로 회원 정보를 조회해서
	 * 마치 이 사람이 로그인 중인 것 처럼 세션 데이터를 만들어 주자는 것
	 * (login이라는 세션 데이터 -> 로그인 중이라는 징표)
	 */
	UserVO getUserWithSessionId(String sessionId);

}
