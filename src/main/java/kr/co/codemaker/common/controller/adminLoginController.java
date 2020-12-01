package kr.co.codemaker.common.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.codemaker.admin.vo.AdminVO;
import kr.co.codemaker.common.service.AdminService;

@Controller
public class adminLoginController { 
	private static final Logger logger = LoggerFactory.getLogger(adminLoginController.class);
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	//로그인 화면
	@RequestMapping(path="/admin/login", method = RequestMethod.GET)
	public String login(@RequestParam(required=false) String msg, Model model) {
		logger.debug("adminLoginController.getAdmin()");
		if(msg != null) {
			model.addAttribute("msg", msg);
		}
		return "admin/login/adminLogin";
	}
	
	@RequestMapping(path="/admin/login", params= {"adminId"}, method=RequestMethod.POST)
	public String getAdmin(String adminId, String adminPass, AdminVO adminVO, HttpSession session, Model model,
							@RequestBody String body){
		logger.debug("adminLoginController.getAdmin() {} / {} / {}", adminId, adminPass, adminVO);
		logger.debug("adminId : {}", adminId);
		
		logger.debug("body : {}", body);
		
		
//		if(dbAdmin != null && adminVO.getAdminPass().equals(dbAdmin.getAdminPass())) {
//			session.setAttribute("S_ADMIN", dbAdmin);
			
//		}
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
	
	@RequestMapping(path="/admin/test")
	public String test() {
		return "adminPage/admin/main/test";
	}
	
}

