package kr.co.codemaker.common.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.codemaker.admin.vo.AdminVO;
import kr.co.codemaker.common.service.LoginService;
import kr.co.codemaker.common.vo.TeacherVO;

@Controller
public class adminLoginController { 
	private static final Logger logger = LoggerFactory.getLogger(adminLoginController.class);
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	//로그인 화면
	@RequestMapping(path="/login", method = RequestMethod.GET)
	public String getView() {
		logger.debug("adminLoginController.getView()");
		return "admin/login/adminLogin";
	}
	
	// 관리자 로그인
	@RequestMapping(path="/admin/main", method=RequestMethod.POST)
	public String getAdmin(AdminVO dbAdminVO, HttpServletRequest request,
								HttpSession session) throws Exception{
		AdminVO adminVO = null;
		try {
			adminVO = loginService.getAdmin(dbAdminVO.getAdminId());
			logger.debug("관리자 아이디=========== : {}", dbAdminVO.getAdminId());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		if(adminVO != null && dbAdminVO.getAdminPass().equals(adminVO.getAdminPass())) {
			session.setAttribute("S_ADMIN", adminVO);
			
			return "adminPage/admin/main/adminMain";
		}
		return "redirect:/login?=";
	}
	
	// 로그아웃
	@RequestMapping(path="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		logger.debug("로그아웃했땅!!!!!!!!!!======", session);
		return "redirect:/login";
	}
	
	
	@RequestMapping(path="/teacher/main", method=RequestMethod.POST)
	public String getTeacher(TeacherVO dbTeacherVO, HttpServletResponse response,
								HttpSession session) throws Exception{
		TeacherVO teacherVO = null;
		try {
			teacherVO = loginService.getTeacher(dbTeacherVO.getTchId());
			logger.debug("선생님 아이디=============== : {}", dbTeacherVO.getTchId());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		if(teacherVO != null && dbTeacherVO.getTchPass().equals(teacherVO.getTchPass())) {
			session.setAttribute("S_TEACHER", teacherVO);
			
			return "teacherPage/teacher/main/teacherMain";
		}
		return "redirect:/login?=";
	}
	
	@RequestMapping(path="/admin/main")
	public String adminMain() {
		return "adminPage/admin/main/adminMain";
	}
	@RequestMapping(path="/teacher/main")
	public String teacherMain() {
		
		return "teacherPage/teacher/main/teacherMain";
	}
	
	@RequestMapping(path="/admin/test")
	public String test() {
		
		return "adminPage/admin/main/test";
	}
	@RequestMapping(path="/teacher/test")
	public String test2() {
		
		return "teacherPage/teacher/main/test";
	}
	
}

