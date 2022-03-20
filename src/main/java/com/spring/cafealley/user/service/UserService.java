package com.spring.cafealley.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.user.mapper.IUserMapper;

@Service
public class UserService implements IUserService {

	@Autowired
	private IUserMapper mapper;

	@Override
	public int idCheck(String userId) {
		return mapper.idCheck(userId);
	}

	@Override
	public void userJoin(UserVO vo) {
		/*
		 * // 회원 비밀번호를 암호화 인코딩 // Spring Security Web 모듈을 사용해서 암호화 진행 // 쓰고있는 스프링 버전에 맞춰
		 * 메이븐코드 복사해 pom.xml에 추가 System.out.println("암호화 하기 전 비번: " + vo.getUserpw());
		 * 
		 * // 비밀번호를 암호화 해서 user객체에 다시 저장하기 BCryptPasswordEncoder encoder = new
		 * BCryptPasswordEncoder(); String securePw = encoder.encode(vo.getUserpw());
		 * 
		 * System.out.println("암호화 후 비번: " + vo.getUserpw()); vo.setUserpw(securePw);
		 */
		mapper.userJoin(vo);

	}

	@Override
	public UserVO login(String userId, String userPw) {
		return mapper.login(userId, userPw);
	}

	@Override
	public UserVO getInfo(String userId) {
		return mapper.getInfo(userId);
	}

	@Override
	public void updateUser(UserVO vo) {
		mapper.updateUser(vo);

	}

	@Override
	public int checkPw(String userpw) {
		return mapper.checkPw(userpw);
	}

	@Override
	public void deleteUser(String userId) {
		mapper.deleteUser(userId);

	}

	@Override
	public void keepLogin(String sessionid, Date limittime, String userid) {
		
		// 컨트롤러에게 받은 매개값으로 받은 값을 Map으로 포장해야 함
		Map<String, Object> data = new HashMap<>();
		data.put("sessionid", sessionid);
		data.put("limittime", limittime);
		data.put("userid", userid);
		mapper.keepLogin(data);

	}

}
