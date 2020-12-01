package kr.co.codemaker.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping(path="/userT/main")
	public String userMain() {
		return "mainT/user/main/main_content";
	}
	

	@RequestMapping(path="/userT/maintest")
	public String maincontentTest() {
		return "mainT/user/main/main_test";
	}
	
	@RequestMapping(path="/userT/mainbck")
	public String userMainBckView() {
		return "user/main/main_bck";
	}
	
	@RequestMapping(path="/userT/mainlogin")
	public String userMainLoginView() {
		return "user/main/main_login";
	}
	
	@RequestMapping(path="/userT/mypage")
	public String userMypageView() {
		return "mypageT/user/mypage/mypage_content";
	}
	
	@RequestMapping(path="/userT/mypagebck")
	public String userMypageBckView() {
		return "user/mypage/layout/mypage_bck";
	}
	
	@RequestMapping(path="/userT/mypagetest")
	public String userMypageNewView() {
		return "mainT/user/mypage/test";
	}
}
