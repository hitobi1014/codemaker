package kr.co.codemaker.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminLoginController { 
	
	@RequestMapping(path="/admin/login")
	public String adminLogin() {
		return "admin/login/adminLogin";
	}
	
	@RequestMapping(path="/admin/adminMain")
	public String adminMain() {
		return "adminPage/admin/main/adminMain";
	}
	
	@RequestMapping(path="/admin/teacherMain")
	public String teacherMain() {
		return "teacherPage/teacher/main/teacherMain";
	}
	
}

