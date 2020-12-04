package kr.co.codemaker.user.lessoninfo.controller;

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
import kr.co.codemaker.user.lessoninfo.service.SubjectService;
import kr.co.codemaker.user.lessoninfo.vo.LessonIndexVO;
import kr.co.codemaker.user.lessoninfo.vo.LessonVO;
import kr.co.codemaker.user.lessoninfo.vo.SubjectVO;


@Controller
public class UserLessonController {

	private static final Logger logger = LoggerFactory.getLogger(UserLessonController.class);

	@Resource(name="userLessonService")
	private LessonService lessonService;
	
	@Resource(name="userSubjectService")
	private SubjectService subjectService;
	
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
		
		List<LessonIndexVO> lesIdxList = lessonIndexService.selectLessonIndex(lesId);
		logger.debug("강의번호:{}",lesId);
		logger.debug("강의목차:{}",lesIdxList);
		
		model.addAttribute("lesIdxList", lesIdxList);
		model.addAttribute("lesId",lesId);
		
		return "mainT/user/lesson/lessonSelect";
	}
//	
//	@RequestMapping(path="selectAll")
//	public String selectAllLesson(Model model) {
//		List<LessonVO> lessonList = lessonService.selectAllLesson();
//		logger.debug("강의 리스트:{}",lessonList);
//		
//		model.addAttribute("lessonList", lessonList);
//		
//		return "mainT/user/lesson/lessonSelectAll";
//	}
//	
//	@RequestMapping(path="/insert",method= {RequestMethod.GET})
//	public String insertLessonView() {
//		return "teacher/lesson/lessonInsert";
//	}
//	
//	@RequestMapping(path="/insert",method= {RequestMethod.POST})
//	public String insertLesson(LessonVO lessonVO) {
//		
//		logger.debug("강의추가내용:{}", lessonVO);
//		int insertCnt = lessonService.insertLesson(lessonVO);
//		logger.debug("cnt:{}", insertCnt);
//		
//		
//		if(insertCnt==1) {
//			return "teacher/lesson/test";
//		}else {
//			return "teacher/lesson/lessonInsert";
//			
//		}
//		
//		
//	}

}
