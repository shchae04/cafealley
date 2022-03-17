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
		return mapper.idCheck(userId);
	}
	

	@Override
	public void userJoin(UserVO vo) {
		mapper.userJoin(vo);
		
	}
	/*
	@Override
	public void genUserJoin(UserVO vo) {
		mapper.genUserJoin(vo);
		
	}

	@Override
	public void  bsnsUserJoin(UserVO vo) {
		mapper.bsnsUserJoin(vo);
		
	}
	*/
	@Override
	public UserVO login(String userId, String userPw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO getInfo(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(String userId, String userPw) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
	

}
