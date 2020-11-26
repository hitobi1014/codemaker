package kr.co.codemaker.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path="/user")
public class userLoginController {
	
	@RequestMapping(path="/login")
	public String userLoginView() {
		return "user/login/view";
	}
	
	@RequestMapping(path="/signup")
	public String userSignupView() {
		return "user/signup/signup";
	}
	
	@RequestMapping(path="/main")
	public String userMainView() {
		return "user/main/main";
	}
	
	@RequestMapping(path="/mainlogin")
	public String userMainLoginView() {
		return "user/main/main_login";
	}
	
	@RequestMapping(path="/mypage")
	public String userMypageView() {
		return "user/mypage/mypage";
	}
	
	@RequestMapping(path="/mypagetest")
	public String userMypageNewView() {
		return "user/mypage/test";
	}
	
	@RequestMapping(path="/button")
	public String buttonTest() {
		return "user/mypage/button";
	}

}
