package kr.co.codemaker.teacher.resume.controller;


import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.codemaker.teacher.resume.service.ResumeService;
import kr.co.codemaker.teacher.signup.vo.ResumeVO;

@Controller
public class ResumeController {
	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);
	
	@Resource(name="resumeService")
	private ResumeService resumeService;
	
	@RequestMapping(path="/resume/view", method = RequestMethod.GET)
	public String resumeView() {
		
		return "mainT/teacher/resume/test";
	}
	
	@RequestMapping(path="/resume/insert", method = RequestMethod.POST)
	public String insertResume(ResumeVO resumeVO, @RequestParam(name="resProfile")MultipartFile file) throws Exception {
		
		String fileName = UUID.randomUUID().toString();
		logger.debug("fileName 안에 들은게 뭐냐~~~~~~~~~~~ : {}", fileName);
		
		File fileUpload = new File("d:\\file\\" + file.getOriginalFilename());
		if(file.getSize() > 0) {
			try {
				file.transferTo(fileUpload);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		resumeVO.setResProfile_path("d:\\file\\" + file.getOriginalFilename());
		
		int insertCnt = 0;
		
		try {
			insertCnt = resumeService.insertResume(resumeVO);
			
			logger.debug("insertCnt 뭐가 들었냐~!~!~! : {}", insertCnt );
			
			if(insertCnt == 1) {
				return "mainT/teacher/resume/success";
			}
		} catch (Exception e) {
			
		}
		return "mainT/teacher/resume/test";
	}
	
	

	@RequestMapping(path="success")
	public String success() {
		return "mainT/teacher/resume/success";
	}
	
}
