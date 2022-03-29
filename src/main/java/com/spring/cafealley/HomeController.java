package com.spring.cafealley;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.cafealley.board.service.BoardService;
import com.spring.cafealley.board.service.IBoardService;
import com.spring.cafealley.board.service.ICmBoardService;
import com.spring.cafealley.command.BoardVO;
import com.spring.cafealley.command.PromoBoardVO;
import com.spring.cafealley.command.PromoLikeVO;
import com.spring.cafealley.promoboard.service.IPromoBoardService;
import com.spring.cafealley.user.service.IUserService;
import com.spring.cafealley.util.PageCreator;
import com.spring.cafealley.util.PageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ICmBoardService cmBoardService;
	@Autowired
	private IBoardService noBaordService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IPromoBoardService promoBoardService;
	
	
	@GetMapping("/")
	public String home(Locale locale, Model model, PageVO paging) {
		
		//커뮤, 공지 보드 최신글 top5 불러오기
		model.addAttribute("cmboard", cmBoardService.getMainCmBaord());
		model.addAttribute("noboard", noBaordService.getMainNoBaord());
		
		
		//map api
		model.addAttribute("bsnsUserAddr", userService.getBsnsUserAddr());
		System.out.println(userService.getBsnsUserAddr());
		
		//베스트 카페
		System.out.println(promoBoardService.cntCafe());
		model.addAttribute("cntCafe",promoBoardService.cntCafe());
		
		
		return "home";
	}
	
}
