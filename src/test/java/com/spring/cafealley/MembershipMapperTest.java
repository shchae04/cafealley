package com.spring.cafealley;

import java.sql.Timestamp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.command.MembershipVO;
import com.spring.cafealley.membership.mapper.IMembershipMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/config/db-config.xml" })
public class MembershipMapperTest {

	@Autowired
	private IMembershipMapper mapper;

	// 멤버십 가입
	@Test
	public void membershipJoin() {
		MembershipVO vo = new MembershipVO();
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		vo.setOrdernum(1);
		vo.setUserid("abc1234");
		vo.setSbscrdate(ts);
		vo.setOrderstatus("구독중");
		vo.setBankusername("조민지");
		vo.setBankname("농협");
		vo.setPeriod(1);
		mapper.membershipJoin(vo);
	}

	// 멤버십 정보 찾기
	// MembershipVO getMembershipInfo(String userid);
	@Test
	public void getMembershipInfoTest() {
		System.out.println(mapper.getMembershipInfo("abc1234"));
	}

	// 멤버십 정보 수정
	@Test
	public void updateTest() {
		MembershipVO vo = new MembershipVO();
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		vo.setUserid("abc1234");
		vo.setOrderdate(ts);
		vo.setOrderstatus("입금대기");
		vo.setBankusername("지민조");
		vo.setBankname("국민");
		vo.setPeriod(2);
		mapper.updateMembership(vo);
	}

	// 멤버십 탈퇴
	// void deleteMembership(String userid);
	@Test
	public void deleteTest() {
		mapper.deleteMembership("abc1234");
	}

}









