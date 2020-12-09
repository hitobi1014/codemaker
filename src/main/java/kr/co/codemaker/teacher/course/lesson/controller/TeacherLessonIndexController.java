package kr.co.codemaker.teacher.course.lesson.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.teacher.course.lesson.service.LessonIndexService;
import kr.co.codemaker.teacher.course.lesson.service.LessonService;
import kr.co.codemaker.teacher.course.lesson.service.TeacherSubjectService;
import kr.co.codemaker.teacher.course.lesson.vo.LessonIndexVO;

public class TeacherLessonIndexController {

	private static final Logger logger = LoggerFactory.getLogger(TeacherLessonController.class);

	@Resource(name="lessonService")
	private LessonService lessonService;
	
	@Resource(name="TeacherSubjectService")
	private TeacherSubjectService subjectService;
	
	@Resource(name="lessonIndexService")
	private LessonIndexService lessonIndexService;
	
	/**
	 * 선생님 - 강의목차 삭제
	 */
	@RequestMapping(path="/teacherLIdx/deleteLessonIndex")
	public String deleteViewLessonIndex(String lidxId, Model model,String lesId) {
		//1. 강의목차 삭제
		//2. 강의목차 추가
		//3. 강의목차 수정
		LessonIndexVO lesIdxVO = new LessonIndexVO();
		List<LessonIndexVO> lesIdxList = new ArrayList<>();
		int delCnt = 0;
		int upCnt = 0;
		
		logger.debug("넘어온 값:{},{}", lidxId, lesId);
		logger.debug("lesIdxVO!!!:{}",lesIdxVO);
		
		try {
			// 강의목차 삭제
			delCnt = lessonIndexService.deleteLessonIndex(lidxId);
			// 삭제한거 제외한 강의목차 조회
			logger.debug("delCnt값,delCnt값:{},{}",delCnt,upCnt);
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
			if(delCnt == 1 || upCnt ==1) {
				model.addAttribute("lesIdxList",lesIdxList);
				return "teacher/lesson/lessonIndexDeleteHTML";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 선생님 - 강의목차 삭제하고 난뒤 load
	 * @param lesId 강의아이디
	 * @param model 강의목차 리스트
	 * @return
	 */
	@RequestMapping(path="/teacherLIdx/deleteLoadLesIdx")
	public String deleteLessonIndex(String lesId, Model model) {
		List<LessonIndexVO> lesIdxList = new ArrayList<>();
		
		try {
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
			
			logger.debug("두번째 컨트롤러어어어:{}",lesIdxList);
			
			model.addAttribute("lesIdxList",lesIdxList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "teacher/lesson/lessonIndexDeleteHTML";
	}
	
	
	/**
	 * 선생님 - 강의목차 수정
	 */
	@RequestMapping(path="/teacherLIdx/updateLessonIndex")
	public String updateViewLessonIndex(String lidxId, Model model,String lesId,LessonIndexVO lesIdxVO) {
		//1. 강의목차 삭제
		//2. 강의목차 추가
		//3. 강의목차 수정
		List<LessonIndexVO> lesIdxList = new ArrayList<>();
		int delCnt = 0;
		int upCnt = 0;
		
		logger.debug("넘어온 값:{},{}", lidxId, lesId);
		logger.debug("lesIdxVO!!!:{}",lesIdxVO);
		
		try {
			// 강의목차 수정
			upCnt = lessonIndexService.updateLessonIndex(lesIdxVO);
			// 삭제한거 제외한 강의목차 조회
			logger.debug("delCnt값,delCnt값:{},{}",delCnt,upCnt);
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
			if(delCnt == 1 || upCnt ==1) {
				model.addAttribute("lesIdxList",lesIdxList);
				return "teacher/lesson/lessonIndexDeleteHTML";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
