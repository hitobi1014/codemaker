package kr.co.codemaker.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.admin.vo.AdminVO;
import kr.co.codemaker.common.service.LoginService;
import kr.co.codemaker.common.vo.TeacherVO;

@Controller
public class adminLoginController { 
	private static final Logger logger = LoggerFactory.getLogger(adminLoginController.class);

	@Resource(name="loginService")
	private LoginService loginService;

	//로그인 화면
	@RequestMapping(path="/loginView")
	public String getView() {
		logger.debug("adminLoginController.getView()");
		return "admin/login/adminLogin";
	}

	// 관리자 로그인
	@RequestMapping(path="/admin/login")
	
	public String getAdmin(AdminVO dbAdminVO, HttpServletRequest request,
						HttpSession session) throws Exception{
		AdminVO adminVO = new AdminVO();
		try {
			
			adminVO = loginService.getAdmin(dbAdminVO.getAdminId());

			logger.debug("관리자 아이디=========== : {}", dbAdminVO.getAdminId());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		String result = null;
		if(adminVO != null && dbAdminVO.getAdminPass().equals(adminVO.getAdminPass())) {
			session.setAttribute("S_ADMIN", adminVO);
			result = "adminPage/admin/main/adminMain";
		} 
		else {
			return "fail";
		}
		return result;
//		"redirect:/loginView";
	}


	@RequestMapping(path="/teacher/login")
	public String getTeacher(TeacherVO dbTeacherVO, HttpServletResponse response,
					HttpSession session) throws Exception{
		TeacherVO teacherVO = new TeacherVO();
		
		try {
			teacherVO = loginService.getTeacher(dbTeacherVO.getTchId());
			logger.debug("선생님 아이디=============== : {}", dbTeacherVO.getTchId());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		String result = null;
		if(teacherVO != null && dbTeacherVO.getTchPass().equals(teacherVO.getTchPass())) {
			session.setAttribute("S_TEACHER", teacherVO);
			result = "teacherPage/teacher/main/teacherMain";
		}
		else {
			return "fail";
		}
		return result;
	}
	
	// 로그아웃
		@RequestMapping(path="/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			logger.debug("로그아웃했땅!!!!!!!!!!======", session);
			return "redirect:/loginView";
		}
   
	@RequestMapping(path="/admin/main")
	public String adminMain() {
		return "adminPage/admin/main/adminMain";
	}
	
	@RequestMapping(path="/teacher/main")
	public String teacherMain() {

		return "teacherPage/teacher/main/teacherMain";
	}
   
}
