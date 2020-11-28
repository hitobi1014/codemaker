package kr.co.codemaker.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path="/admin")
public class adminLoginController { 
		
		@RequestMapping(path="/login")
		public String adminLogin() {
			return "admin/login/adminLogin";
		}
		
		@RequestMapping(path="/signup")
		public String adminSignup() {
			return "admin/signup/signup";
		}
		
		@RequestMapping(path="/adminMain")
		public String adminMain() {
//			return "adminPage/admin/main/adminMain";
			return "admin/main/adminMain";
		}
		
		@RequestMapping(path="/teacherMain")
		public String teacherMain() {
			return "teacherPage/teacher/main/teacherMain";
		}
		
}

