package com.spring.cafealley;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.command.UserVO;
import com.spring.cafealley.user.mapper.IUserMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/config/db-config.xml"})
public class UserMapperTest {
	
	@Autowired
	private IUserMapper mapper;
	
	@Test
	public void joinTest() { //회원가입 테스트 완료
		UserVO vo = new UserVO();
		vo.setUserid("abc1234");
		vo.setUsername("홍길동");
		vo.setUserpw("aaaa1234");
		vo.setUserphone1("010");
		vo.setUserphone2("1111");
		vo.setUserphone3("2222");
		vo.setUseremail("abc1234@naver.com");
		vo.setAddrbasic("서울 마포구 신촌로 176");
		vo.setAddrdetail("중앙빌딩");
		vo.setZipcode("22730");
		vo.setBusinessnum("0323393339");
		mapper.userjoin(vo);
	}
	
	@Test
	public void getInfoTest() {// 회원정보 찾기 테스트 완료
		System.out.println(mapper.getInfo("abc1234"));
	}
	
	@Test
	public void updateUser() {// 회원정보 수정 테스트 완료
		UserVO vo = new UserVO();
		vo.setUserid("abc1234");
		vo.setUserpw("abcd1234");
		vo.setUserphone1("010");
		vo.setUserphone2("3333");
		vo.setUserphone3("4444");
		vo.setUseremail("abc1111@daum.net");
		vo.setAddrbasic("인천 서구 승학로 198");
		vo.setAddrdetail("극동아파트");
		vo.setZipcode("22730");
		vo.setBusinessnum("03244445555");
		vo.setFilenum(1);
		
		mapper.updateUser(vo);
	}
	
	@Test
	public void deleteUserTest() {// 회원 탈퇴 테스트 완료
		mapper.deleteUser("abc1234", "abcd1234");
	}
	

}


























