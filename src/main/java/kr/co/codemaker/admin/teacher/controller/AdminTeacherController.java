package kr.co.codemaker.admin.teacher.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.codemaker.admin.teacher.service.AdminTeacherService;
import kr.co.codemaker.admin.teacher.vo.ResumeVO;
import kr.co.codemaker.admin.teacher.vo.TeacherVO;

@Controller
public class AdminTeacherController {
	private static final Logger logger = LoggerFactory.getLogger(AdminTeacherController.class);
	
	@Resource(name="adminTeacherService")
	private AdminTeacherService adminTeacherService;
	
	@RequestMapping(path="/admin/selectAllTeacher")
	public String selectAllTeacherView(Model model,@RequestParam(name="gubun", required = false) String gubun) {
		List<TeacherVO> teacherList = null;
		TeacherVO teacherVo = new TeacherVO();
		if(gubun != null && gubun != "") {
			if(gubun.equals("1")) {
				teacherVo.setTchGn("N");
			}else if(gubun.equals("2")) {
				teacherVo.setTchGn("Y");
			}
			try {teacherList = adminTeacherService.selectAllTeacher(teacherVo);} catch (Exception e) {e.printStackTrace();}
			model.addAttribute("teacherList", teacherList);
			return "/admin/teacher/searchTeacher";
		}
		try {teacherList = adminTeacherService.selectAllTeacher(teacherVo);} catch (Exception e) {e.printStackTrace();}
		model.addAttribute("teacherList", teacherList);
		return "adminPage/admin/teacher/selectTeacherInfo";
	}
	
	@RequestMapping(path="/admin/selectTeacher")
	public String selectTeacherView(String tchId, Model model) {
		logger.debug("선생님 아이디 :{}",tchId);
		TeacherVO tvo = new TeacherVO(tchId);
		TeacherVO teacherVo = null;
		ResumeVO rvo = new ResumeVO();
		ResumeVO resumeVo = null;
		try {
			teacherVo = adminTeacherService.selectTeacher(tvo);
			logger.debug("가져온 정보 : {}", teacherVo);
			logger.debug("tch코드 : {}",teacherVo.getTchCode());
			rvo.setResCode(teacherVo.getTchCode());
			logger.debug("rvo 정보 :{}",rvo);
			resumeVo = adminTeacherService.selectResume(rvo);
			logger.debug("이력서 정보 : {}", resumeVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("teacherVo", teacherVo);
		model.addAttribute("resumeVo", resumeVo);
		return "adminPage/admin/teacher/detailSelectTeacher";
	}
}
