package kr.co.codemaker.common.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.codemaker.common.service.AdminService;

@Controller
public class adminLoginController { 
	private static final Logger logger = LoggerFactory.getLogger(adminLoginController.class);
	@Resource(name="adminService")
	private AdminService adminService;
	   
	@RequestMapping(path="/login", method = RequestMethod.GET)
	public String getView() {
		logger.debug("AdminController.getView()");
	
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

