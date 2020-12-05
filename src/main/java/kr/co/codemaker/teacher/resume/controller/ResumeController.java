package kr.co.codemaker.teacher.resume.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.teacher.resume.service.ResumeService;

@Controller
public class ResumeController {
	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);
	
	@Resource(name="resumeService")
	private ResumeService resumeService;
	
	@RequestMapping(path="testResume")
	public String test() {
		
		
//		return "mainT/teacher/resume/resumeInsert";
		return "mainT/teacher/resume/test";
	}
	
}
