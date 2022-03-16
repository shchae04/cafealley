package com.spring.cafealley.membership.mapper;

import com.spring.cafealley.command.MembershipVO;

public interface IMembershipMapper {
	
	//멤버십 가입
	void membershipJoin(MembershipVO vo);
	
	//멤버십 정보 찾기
	MembershipVO getMembershipInfo(String userid);
	
	//멤버십 정보 수정
	void updateMembership(MembershipVO vo);
	
	//멤버십 탈퇴
	void deleteMembership(String userid);

}
