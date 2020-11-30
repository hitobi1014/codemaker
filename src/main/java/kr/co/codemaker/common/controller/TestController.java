package kr.co.codemaker.common.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class TestController {

	@RequestMapping(path="/user/mainTT")
	public String userMain() {
		return "mainT/user/main/main_content";
	}
	

	@RequestMapping(path="/user/maintest")
	public String maincontentTest() {
		return "mainT/user/main/main_test";
	}
	
	@RequestMapping(path="/user/mainbck")
	public String userMainBckView() {
		return "user/main/main_bck";
	}
	
	@RequestMapping(path="/user/mainlogin")
	public String userMainLoginView() {
		return "user/main/main_login";
	}
	
	@RequestMapping(path="/user/mypage")
	public String userMypageView() {
		return "mypageT/user/mypage/mypage_content";
	}
	
	@RequestMapping(path="/user/mypagebck")
	public String userMypageBckView() {
		return "user/mypage/layout/mypage_bck";
	}
	
	@RequestMapping(path="/user/mypagetest")
	public String userMypageNewView() {
		return "user/mypage/test";
	}
}
