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

/**
 * 
* ExamController.java
*
* @author 박다미
* @version 1.0
* @since 2020. 12. 1.
*
* 수정자 수정내용
* ------ ------------------------
* 박다미 최초 생성
*
 */
@Controller
public class TeacherLessonController {

	private static final Logger logger = LoggerFactory.getLogger(TeacherLessonController.class);

	@Resource(name="lessonService")
	private LessonService lessonService;
	
	@Resource(name="subjectService")
	private SubjectService subjectService;
	
	@Resource(name="lessonIndexService")
	private LessonIndexService lessonIndexService;
	
	/**
	 * 선생님 - 강의조회 및 개설 페이지 불러오는 메서드
	 * @return
	 */
	@RequestMapping(path="/teacherL/selectSubject",method= RequestMethod.GET)
	public String selecSubject(Model model) {
		
		List<LessonVO> noLessonList = lessonService.selectNoLesson();
		model.addAttribute("noLessonList",noLessonList);
		
		logger.debug("개설안된강의!!:{}",noLessonList);
		return"teacherPage/teacher/lesson/lessonAllSelect";
	}
	
	/**
	 * 선생님 - 강의조회 및 개설 페이지에서 과목명에 따른 강의명 select box에 조회해주는 메서드
	 * @return
	 */
	@RequestMapping(path="/teacherL/selectSubject",method= RequestMethod.POST)
	@ResponseBody
	public List<LessonVO> selectLesson(Model model,String subId) {
		logger.debug("과제아디!!:{}",subId);
		
		List<LessonVO> lessonList= lessonService.selectLesson(subId);
		model.addAttribute("lessonList", lessonList);
		
		return lessonList;
	}
	
	/**
	 * 선생님 - 강의아이디에 따라 강의목차 조회해주는 메서드 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(path="/teacherL/selectAllLessonIndex", method=RequestMethod.GET)
	public List<LessonIndexVO> selectLessonPage(Model model,String lesId) {
		
		logger.debug("강의번호:{}",lesId);
		List<LessonIndexVO> lesIdxList = lessonIndexService.selectLessonIndex(lesId);
		logger.debug("강의목차:{}",lesIdxList);
		
		model.addAttribute("lesIdxList", lesIdxList);
		
		
		return lesIdxList;
	}
	
//	@ResponseBody
//	@RequestMapping(path="/teacherL/deleteLesson",method=RequestMethod.GET)
//	public int deleteLesson(Model model,String lesId) throws Exception {
//		
//		logger.debug("lesId값!!!:{}",lesId);
//		
//		int lesIdxList = lessonService.deleteLesson(lesId);
//		
//		if(lesIdxList ==1) {
//			model.addAttribute("lesIdxList", lesIdxList);
//			return 
//		}
//		else {
//			return lesIdxList;
//		}
//		
//		
//	}
	
}
