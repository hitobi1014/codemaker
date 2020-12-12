package kr.co.codemaker.admin.course.resume.controller;


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.admin.course.resume.service.ResumeAdminService;
import kr.co.codemaker.teacher.signup.vo.ResumeVO;

@Controller
public class ResumeAdminController {
	private static final Logger logger = LoggerFactory.getLogger(ResumeAdminController.class);
	
	@Resource(name="resumeAdminService")
	private ResumeAdminService resumeAdminService;
	
	@RequestMapping(path="/admin/resumeList")
	public String selectAllResume(Model model, ResumeVO resumeVO) throws Exception {
		logger.debug("resumeVO에 모가 들어이쓰까리~~ : {}", resumeVO);
		List<ResumeVO> resumeList = resumeAdminService.selectAllResume();
		model.addAttribute("resumeList", resumeList);
		
		// ajax 이용해서 이력서 정보 불러오기
		return "adminPage/admin/resume/listResume";
	}
	
	@RequestMapping(path="/admin/resume")
	public String getAllResume(ResumeVO resumeVO, Model model) throws Exception {
		ResumeVO resume = resumeAdminService.getAllResume(resumeVO);
		model.addAttribute("resume", resume);
		
		logger.debug("resume!!!!!!!!!!!!!!!!!!!! : {}", resume);
		
		return "adminPage/admin/resume/selectResume";
	}
	
}