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
	

	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@Override
	public int idCheck(String userId) {
		return mapper.idCheck(userId);
	}

	@Override
	public void userJoin(UserVO vo) {

		// 회원 비밀번호를 암호화 인코딩
		// Spring Security Web 모듈을 사용해서 암호화 진행
		System.out.println("암호화 하기 전 비밀번호: " + vo.getUserpw());

		// 비밀번호를 암호화 해서 user객체에 다시 저장하기
		// encoder 객체가 사용자가 입력한 비밀번호를 암호화 해서 securePw에 리턴.
		String securePw = encoder.encode(vo.getUserpw());
		System.out.println("암호화 후 비번: " + vo.getUserpw());

		// vo 객체에 다시 비밀번호 세팅
		vo.setUserpw(securePw);

		// 매퍼에게 securePw로 변경된 객체를 전달
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

		// 회원 비밀번호를 암호화 인코딩
		// Spring Security Web 모듈을 사용해서 암호화 진행
		System.out.println("암호화 하기 전 비밀번호: " + vo.getUserpw());

		// 비밀번호를 암호화 해서 user객체에 다시 저장하기
		// encoder 객체가 사용자가 입력한 비밀번호를 암호화 해서 securePw에 리턴.
		String securePw = encoder.encode(vo.getUserpw());
		System.out.println("암호화 후 비번: " + vo.getUserpw());

		// vo 객체에 다시 비밀번호 세팅
		vo.setUserpw(securePw);

		// 매퍼에게 securePw로 변경된 객체를 전달
		mapper.updateUser(vo);

	}

	@Override
	public String checkPw(String userid) {
		return mapper.checkPw(userid);
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
