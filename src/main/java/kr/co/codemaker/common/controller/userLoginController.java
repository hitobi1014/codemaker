package kr.co.codemaker.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path="/user")
public class userLoginController {
	
	@RequestMapping(path="/login")
	public String userLoginView() {
		return "user/login/userLogin";
	}
	
	@RequestMapping(path="/signup")
	public String userSignupView() {
		return "user/signup/signup";
	}
	
	@RequestMapping(path="/main")
	public String contentTest() {
		return "mainT/user/main/main_content";
	}
	
	@RequestMapping(path="/mainbck")
	public String userMainBckView() {
		return "user/main/main_bck";
	}
	
	@RequestMapping(path="/mainlogin")
	public String userMainLoginView() {
		return "user/main/main_login";
	}
	
	@RequestMapping(path="/mypage")
	public String userMypageView() {
		return "mypageT/user/mypage/mypage_content";
	}
	
	@RequestMapping(path="/mypagebck")
	public String userMypageBckView() {
		return "user/mypage/layout/mypage_bck";
	}
	
	@RequestMapping(path="/mypagetest")
	public String userMypageNewView() {
		return "user/mypage/test";
	}

}
