package kr.co.codemaker.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.codemaker.common.service.AdminService;

@Controller
@RequestMapping(path="/admin")
public class AdminController { 
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@RequestMapping(path="/login", method = RequestMethod.GET)
	public String getView() {
		logger.debug("AdminController.getView()");
		return "admin/login/adminLogin";
	}
	/**
	 * 로그인 화면
	 * @since 2020. 11. 30
	 * @author 이은지
	 * @return
	 */
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(AdminVO adminVo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");
		
		HttpSession session = req.getSession();
		AdminVO login = adminService.getAdmin(adminVo);
		
		if(login == null) {
			session.setAttribute("admin", null);
			rttr.addFlashAttribute("msg", false);
		}
		else {
			session.setAttribute("admin", login);
		}
		logger.debug("login : {}", login);
		
		return "admin/login/adminLogin";
	}
	
	
	@RequestMapping(path="/adminMain")
	public String adminMain() {
		return "adminPage/admin/main/adminMain";
	}
	
	@RequestMapping(path="/teacherMain")
	public String teacherMain() {
		return "teacherPage/teacher/main/teacherMain";
	}
	
}