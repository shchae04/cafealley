package com.spring.cafealley.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.user.mapper.IUserMapper;

@Service
public class UserService implements IUserService {
	
	@Autowired
	private IUserMapper mapper;
	

	@Override
	public int idCheck(String userId) {
		return 0;
	}

	@Override
	public void userJoin(UserVO vo) {

	}

	@Override
	public UserVO login(String userId, String userPw) {
		return null;
	}

	@Override
	public UserVO getInfo(String userId) {
		return null;
	}

	@Override
	public void updateUser(UserVO vo) {

	}

	@Override
	public void deleteUser(String userId, String userPw) {

	}

}
