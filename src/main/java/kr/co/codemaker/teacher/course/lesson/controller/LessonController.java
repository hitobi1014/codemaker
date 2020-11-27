package kr.co.codemaker.teacher.course.lesson.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.codemaker.model.LessonVO;
import kr.co.codemaker.teacher.course.lesson.service.LessonServiceI;

@Controller
@RequestMapping(path="/teacherL")
public class LessonController {

	private static final Logger logger = LoggerFactory.getLogger(LessonController.class);

	@Resource(name="lessonService")
	private LessonServiceI lessonService;
	
	
	@RequestMapping(path="select")
	public String selectLesson(Model model) {
		String les_id = "1";
		LessonVO lessonVO= lessonService.selectLesson(les_id);
		model.addAttribute("lessonVO", lessonVO);
		
		return "teacher/lesson/lessonSelect";
	}
	
	@RequestMapping(path="selectAll")
	public String selectAllLesson(Model model) {
		List<LessonVO> lessonList = lessonService.selectAllLesson();
		logger.debug("강의 리스트:{}",lessonList);
		
		model.addAttribute("lessonList", lessonList);
		
		return "teacher/lesson/lessonSelectAll";
	}
	
	@RequestMapping(path="/insert",method= {RequestMethod.GET})
	public String insertLessonView() {
		return "teacher/lesson/lessonInsert";
	}
	
	@RequestMapping(path="/insert",method= {RequestMethod.POST})
	public String insertLesson(LessonVO lessonVO) {
		
		logger.debug("강의추가내용:{}", lessonVO);
		int insertCnt = lessonService.insertLesson(lessonVO);
		logger.debug("cnt:{}", insertCnt);
		
		
		if(insertCnt==1) {
			return "teacher/lesson/test";
		}else {
			return "teacher/lesson/lessonInsert";
			
		}
		
		
	}

}
