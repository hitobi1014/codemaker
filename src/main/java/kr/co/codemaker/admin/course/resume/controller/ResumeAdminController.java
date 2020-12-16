package kr.co.codemaker.admin.course.resume.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

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
		List<ResumeVO> resumeList = resumeAdminService.selectAllResume(resumeVO);
		model.addAttribute("resumeList", resumeList);
		model.addAttribute("resState", resumeVO.getResState());

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
	
	//상세조회에서 이미지 처리
		@RequestMapping(path="/resume/teacherImg")
		public void imgView(String resProfile, HttpServletResponse response) throws IOException {
			response.setContentType("image");
			FileInputStream fis = new FileInputStream(resProfile);
			ServletOutputStream sos = response.getOutputStream();
			byte[] buffer = new byte[512];
			while(fis.read(buffer) != -1) {
				sos.write(buffer);
			}
			fis.close();
			sos.flush();
			sos.close();
		}
	
	@RequestMapping(path="/admin/resume/state")
	public String updateState()throws Exception {
		
		return "adminPage/admin/resume/listResume";
	}

}