package kr.co.codemaker.user.lessoninfo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.codemaker.user.lessoninfo.service.LessonIndexService;
import kr.co.codemaker.user.lessoninfo.service.LessonService;
import kr.co.codemaker.user.lessoninfo.service.UesrSubjectService;
import kr.co.codemaker.user.lessoninfo.vo.LessonIndexVO;
import kr.co.codemaker.user.lessoninfo.vo.LessonVO;
import kr.co.codemaker.user.lessoninfo.vo.SubjectVO;


@Controller
public class UserLessonController {

	private static final Logger logger = LoggerFactory.getLogger(UserLessonController.class);

	@Resource(name="userLessonService")
	private LessonService lessonService;
	
	@Resource(name="userSubjectService")
	private UesrSubjectService subjectService;
	
	@Resource(name="userLessonIndexService")
	private LessonIndexService lessonIndexService;
	
	
	@RequestMapping(path="/user/selectSubject")
	public String selectLesson(Model model) {
		List<SubjectVO> subjectList = subjectService.selectSubject();
		List<LessonVO> lessonList= lessonService.selectLesson();
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("lessonList", lessonList);
		
		return "mainT/user/lesson/subjectSelect";
	}
	
	
	@RequestMapping(path="/user/selectLessonPage")
	public String selectLessonPage(Model model,String lesId) {
		
		List<LessonIndexVO> lesIdxList;
		try {
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
			logger.debug("강의번호:{}",lesId);
			logger.debug("강의목차:{}",lesIdxList);
			model.addAttribute("lesIdxList", lesIdxList);
			model.addAttribute("lesId", lesId);
			
			
			return "mainT/user/lesson/lessonSelect";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	// 강의 동영상
	@RequestMapping(path="/user/selectYou")
	public String selectYou(String lidxPath, Model model) {
		model.addAttribute("lidxPath",lidxPath);
		return "user/lesson/you";
	}

	// 강의 동영상 테스트
	@RequestMapping(path="/user/testYou")
	public String testYou() {
		return "user/lesson/youtubeTest";
	}
}
