package kr.co.codemaker.user.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mypage")
@Controller
public class MypageController {

	
	@RequestMapping("/mypageView")
	public String mypageView() {
		
		return "user/mypage/mypage";
	}
	
}
