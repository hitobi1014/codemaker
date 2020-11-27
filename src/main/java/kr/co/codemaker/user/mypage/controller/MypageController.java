package kr.co.codemaker.user.mypage.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.user.mypage.service.MypageServiceI;

@RequestMapping("/mypage")
@Controller
public class MypageController {
	
	@Resource(name="mypageService")
	private MypageServiceI mypageService;
	

	@RequestMapping("/mypageView")
	public String mypageView() {
		return "mypageT/user/mypage/mypage_myinfo";
	}
	
}
