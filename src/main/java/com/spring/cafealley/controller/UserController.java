package com.spring.cafealley.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cafealley.user.service.IUserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private IUserService service;
	
	@GetMapping("/joinSelect")
	public void joinSelect() {}
	
	
	//일반 회원 가입버튼 클릭 시
	@GetMapping("/formJoinGen")
	public String formJoinGen() {
		return "user/formJoin";
	}
	
	//사업자 회원 가입버튼 클릭 시 model객체에 사업자 회원 여부를 담음
	@GetMapping("/formJoinBsns")
	public String formJoinBsns(Model model) {
		model.addAttribute("type", "business");
		return "user/formJoin";
	}
	
	//아이디 중복 체크(비동기)
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		
		int result = service.idCheck(userId);
		
		if(result == 0) {
			return "available";
		} else {
			return "duplicated";
		}
	}
	

}






















