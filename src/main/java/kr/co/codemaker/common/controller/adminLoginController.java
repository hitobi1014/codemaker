//package kr.co.codemaker.common.controller;
//
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import kr.co.codemaker.admin.vo.AdminVO;
//import kr.co.codemaker.common.service.LoginService;
//
//@Controller
//public class adminLoginController { 
//	private static final Logger logger = LoggerFactory.getLogger(adminLoginController.class);
//	
//	@Resource(name="loginService")
//	private LoginService loginService;
//	
//	//로그인 화면
//	@RequestMapping(path="/admin/login", method = RequestMethod.GET)
//	public String getView() {
//		logger.debug("adminLoginController.getView()");
//		return "admin/login/adminLogin";
//	}
//	
//	@RequestMapping(path="/admin/login", params= {"adminId"}, method=RequestMethod.POST)
//	public String getAdmin(String adminId, String adminPass, AdminVO dbAdminVO,
//								@RequestBody String body,
//								HttpSession session, Model model ) throws Exception{
//		logger.debug("adminLoginController.getAdmin() {} / {} / {}", adminId, adminPass, dbAdminVO);
//		logger.debug("adminId : {}", adminId);
//		
//		logger.debug("body : {}", body);
//		
//		AdminVO adminVO = loginService.getAdmin(adminId);
//		
//		logger.debug("dbAdmin : {}", adminVO);
//		logger.debug("adminVO : {}", adminVO);
//		
//		if(adminVO != null && dbAdminVO.getAdminPass().equals(adminVO.getAdminPass())) {
//			session.setAttribute("S_ADMIN", adminVO);
//			
//			return "adminPage/admin/main/adminMain";
//		}
//		return "admin/login/adminLogin";
//	}
//	
//	@RequestMapping(path="/admin/main")
//	public String adminMain() {
//		return "adminPage/admin/main/adminMain";
//	}
//	
//	@RequestMapping(path="/teacher/main")
//	public String teacherMain() {
//		
//		return "teacherPage/teacher/main/teacherMain";
//	}
//	
//	@RequestMapping(path="/admin/test")
//	public String test() {
//		
//		return "adminPage/admin/main/test";
//	}
//	
//}
//
