package kr.co.codemaker.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminLoginController { 
		
		@RequestMapping(path="/admin/login")
		public String adminLogin() {
			return "admin/login/adminLogin";
		}
		
		@RequestMapping(path="/admin/signup")
		public String adminSignup() {
			return "admin/signup/signup";
		}
		
		@RequestMapping(path="/admin/adminMain")
		public String adminMain() {
			return "adminPage/admin/main/adminMain";
		}
		
		@RequestMapping(path="/admin/teacherMain")
		public String teacherMain() {
			return "teacherPage/teacher/main/teacherMain";
		}
		
		@RequestMapping(path="/user/main")
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

