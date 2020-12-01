package kr.co.codemaker.teacher.course.lesson.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codemaker.teacher.course.lesson.service.LessonIndexService;
import kr.co.codemaker.teacher.course.lesson.service.LessonService;
import kr.co.codemaker.teacher.course.lesson.service.SubjectService;
import kr.co.codemaker.teacher.course.lesson.vo.LessonIndexVO;
import kr.co.codemaker.teacher.course.lesson.vo.LessonVO;
import kr.co.codemaker.teacher.course.lesson.vo.SubjectVO;

@Controller
public class TeacherLessonController {

	private static final Logger logger = LoggerFactory.getLogger(TeacherLessonController.class);

	@Resource(name="lessonService")
	private LessonService lessonService;
	
	@Resource(name="subjectService")
	private SubjectService subjectService;
	
	@Resource(name="lessonIndexService")
	private LessonIndexService lessonIndexService;
	
	@RequestMapping(path="/teacherL/selectSubject",method= RequestMethod.GET)
	public String selecSubject(Model model) {
		
		return"/teacher/lesson/lessonAllSelect";
	}
	
	@RequestMapping(path="/teacherL/selectSubject",method= RequestMethod.POST)
	@ResponseBody
	public List<LessonVO> selectLesson(Model model,String subId) {
		logger.debug("과제아디!!:{}",subId);
		
		List<LessonVO> lessonList= lessonService.selectLesson(subId);
		model.addAttribute("lessonList", lessonList);
		
//		return "";
		return lessonList;
	}
	
	
	@RequestMapping(path="/teacherL/selectAllLesson")
	public String selectLessonPage(Model model,String lesId) {
		
		List<LessonIndexVO> lesIdxList = lessonIndexService.selectLessonIndex(lesId);
		logger.debug("강의번호:{}",lesId);
		logger.debug("강의목차:{}",lesIdxList);
		
		model.addAttribute("lesIdxList", lesIdxList);
		
		
		return "mainT/teacher/lesson/lessonAllSelect";
	}
	
//	@RequestMapping(path="/teacherL/test")
//	public String testLesson(Model model) {
//		List<SubjectVO> subjectList = subjectService.selectSubject();
//		List<LessonVO> lessonList= lessonService.selectLesson();
//		model.addAttribute("subjectList", subjectList);
//		model.addAttribute("lessonList", lessonList);
//		
//		return "teacherPage/teacher/lesson/test";
//	}

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
