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
	 * 선생님 - 강의조회
	 * @return
	 */
	@RequestMapping(path="/teacherL/selectSubject",method= RequestMethod.GET)
	public String selecSubject(Model model) {
		
		List<LessonVO> noLessonList;
		try {
			noLessonList = lessonService.selectNoLesson();
			model.addAttribute("noLessonList",noLessonList);
			
			logger.debug("개설안된강의!!:{}",noLessonList);
			return"teacherPage/teacher/lesson/lessonAllSelect";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 선생님 - 임시저장된 강의 조회(삭제했을때 다시불러오기용)
	 * @return
	 */
	@RequestMapping(path="/teacherL/selectloadSubject",method= RequestMethod.GET)
	public String selecLoadSubject(Model model) {
		
		List<LessonVO> noLessonList;
		try {
			noLessonList = lessonService.selectNoLesson();
			model.addAttribute("noLessonList",noLessonList);
			
			logger.debug("개설안된강의!!:{}",noLessonList);
			return"teacher/lesson/deleteLessonHTML";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 선생님 - 과목명에 따른 강의명 select box에 조회
	 * @return
	 */
	@RequestMapping(path="/teacherL/selectSubject",method= RequestMethod.POST)
	@ResponseBody
	public List<LessonVO> selectLesson(Model model,String subId) {
		logger.debug("과제아디!!:{}",subId);
		
		List<LessonVO> lessonList;
		try {
			lessonList = lessonService.selectLesson(subId);
			model.addAttribute("lessonList", lessonList);
			return lessonList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 선생님 - 강의아이디에 따라 강의목차 조회
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
	
	/**
	 * 선생님 - 강의 삭제
	 * @return
	 */
	@ResponseBody
	@RequestMapping(path="/teacherL/deleteLesson",method=RequestMethod.GET)
	public String deleteLesson(Model model,String lesId) throws Exception {
		
		logger.debug("lesId값!!!:{}",lesId);
		
		int lesIdxList = lessonService.deleteLesson(lesId);
		
		if(lesIdxList ==1) {
			List<LessonVO> noLessonList = lessonService.selectNoLesson();
			model.addAttribute("noLessonList",noLessonList);
			return "/teacher/lesson/deleteLessonHTML";
		}
		else {
			return "redirect;/teacherL/selectSubject";
		}
	}
	
	
	@RequestMapping(path="/teacherL/insertLesson")
	public String insertLesson() {
		return "teacherPage/teacher/lesson/lessonInsert";
	}
	
}
