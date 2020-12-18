package kr.co.codemaker.common.controller;


import java.io.FileInputStream;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
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
import kr.co.codemaker.teacher.signup.vo.TeacherVO;

@Controller
public class AdminLoginController { 
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	//로그인 화면
	@RequestMapping(path="/loginView", method = RequestMethod.GET)
	public String getView() {
		logger.debug("AdminLoginController.getView()");
		return "admin/login/adminLogin";
	}
	
	// 관리자 로그인
	@RequestMapping(path="/admin/login", method=RequestMethod.POST)
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
		return "redirect:loginView";
	}
	
	// 로그아웃
	@RequestMapping(path="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		logger.debug("로그아웃했땅!!!!!!!!!!======", session);
		return "redirect:loginView";
	}
	
	
	@RequestMapping(path="/teacher/login", method=RequestMethod.POST)
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
		
		logger.debug("선생님========== : {}", teacherVO);
		logger.debug("선생님 비밀=============== : {}", dbTeacherVO.getTchPass());
		logger.debug("선생님 번호=============== : {}", teacherVO.getTchPass());
		
		
		if(teacherVO != null && dbTeacherVO.getTchPass().equals(teacherVO.getTchPass())) {
			session.setAttribute("S_TEACHER", teacherVO);
			
			logger.debug("선생님 ========= : {}", session.getAttribute("S_TEACHER"));
			
			return "teacherPage/teacher/main/teacherMain";
		}
		return "redirect:loginView";
	}
	
	@RequestMapping(path="/admin/main")
	public String adminMain() {
		return "adminPage/admin/main/adminMain";
	}
	@RequestMapping(path="/teacher/main")
	public String teacherMain() {
		
		return "teacherPage/teacher/main/teacherMain";
	}
	
	// 메인 강사 이미지 처리
	@RequestMapping(path="/teacher/teacherImg")
	public void imgView(String tchProfile, HttpServletResponse response) throws IOException {
		logger.debug("tchProfile!!!!!!!!!!!!!!!!!!!!!!!!!!! : {}", tchProfile);
		response.setContentType("image");
		FileInputStream fis = new FileInputStream(tchProfile);
		ServletOutputStream sos = response.getOutputStream();
		byte[] buffer = new byte[512];
		while(fis.read(buffer) != -1) {
			sos.write(buffer);
		}
		fis.close();
		sos.flush();
		sos.close();
	}
	
}

