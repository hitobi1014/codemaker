package kr.co.codemaker.teacher.resume.controller;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.codemaker.teacher.resume.service.ResumeService;
import kr.co.codemaker.teacher.signup.vo.ResumeVO;

@Controller
public class ResumeController {
	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);
	
	@Resource(name="resumeService")
	private ResumeService resumeService;
	
	@RequestMapping(path="/resumeView")
	public String resumeView() {
		
		return "mainT/teacher/resume/test";
	}
	
	// 이력서 작성 화면
	@RequestMapping(path="/insertResume")
	public ModelAndView insertResume(ResumeVO resumeVO, MultipartFile file) throws Exception {
		ModelAndView mav = new ModelAndView("mainT/teacher/resume/test");
		logger.debug("mav에 뭐가 들어갔는지 보쟈~~~~~~~~~~~~~~~~~~~~~~~ : {}", mav);
		resumeService.insertResume(resumeVO);
		return mav;
	
	}

	@RequestMapping(path="success")
	public String success() {
		return "mainT/teacher/resume/success";
	}
	
}
