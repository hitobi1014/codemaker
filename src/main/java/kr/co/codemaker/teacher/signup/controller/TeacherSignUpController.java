package kr.co.codemaker.teacher.signup.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codemaker.teacher.signup.service.TeacherSignUpService;
import kr.co.codemaker.teacher.signup.vo.ResumeVO;

@Controller
public class TeacherSignUpController {
	private static final Logger logger = LoggerFactory.getLogger(TeacherSignUpController.class); 
	
	@Resource(name="teacherSignUpService")
	private TeacherSignUpService tService;
	
	@RequestMapping(path="teacher/signup", method=RequestMethod.GET)
	public String teacherSignUpView() {
		return "teacher/signup/tSignup";
	}
	
	@RequestMapping(path="teacher/signup", method=RequestMethod.POST)
	public String teacherSignUp() {
		
		return "";
	}
	
	@RequestMapping(path="teacher/chkResCode", method=RequestMethod.GET)
	public String chkResCode(@RequestParam(name="resCode") String chkResCode, Model model) {
		ResumeVO resumeVo = new ResumeVO(chkResCode); 
		ResumeVO getResumeVo = null;
		try {
			getResumeVo = tService.selectResume(resumeVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(getResumeVo.getResCode().equals(chkResCode)) {
			model.addAttribute("chkMsg", "success");
			logger.debug("성공");
			return "jsonView";
		}else {
			model.addAttribute("chkMsg", "fail");
			return "jsonView";
		}
	}
	
}
