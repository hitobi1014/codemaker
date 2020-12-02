package kr.co.codemaker.teacher.signup.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.codemaker.teacher.signup.service.TeacherSignUpService;
import kr.co.codemaker.teacher.signup.vo.ResumeVO;
import kr.co.codemaker.teacher.signup.vo.TeacherVO;

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
	public String teacherSignUp(TeacherVO tVo, ResumeVO rVo, MultipartFile picture) {
		ResumeVO getInfo = null;
		try {
			getInfo = tService.selectResume(rVo);
		} catch (Exception e) {e.printStackTrace();}
		
		String filename = UUID.randomUUID().toString();
		String extension = StringUtils.getFilenameExtension(picture.getOriginalFilename());
		String filepath = "d:\\upload\\"+filename+"."+extension;
		File uploadFile = new File(filepath);
		if(picture.getSize() > 0) {
			try {
				picture.transferTo(uploadFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		tVo.setTchNm(getInfo.getResNm());
		tVo.setTchTel(getInfo.getResTel());
		tVo.setTchCode(getInfo.getResCode());
		tVo.setTchGn("N");
		tVo.setResId(getInfo.getResId());
		tVo.setTchProfile(filepath);
		
		try {
			tService.insertTeacher(tVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/login";
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
			return "jsonView";
		}else {
			model.addAttribute("chkMsg", "fail");
			return "jsonView";
		}
	}
	
}
