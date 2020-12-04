package kr.co.codemaker.teacher.course.lesson.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.bean.conf.loader.annotation.Validatable;

import kr.co.codemaker.teacher.course.lesson.service.LessonIndexService;
import kr.co.codemaker.teacher.course.lesson.service.LessonService;
import kr.co.codemaker.teacher.course.lesson.service.TeacherSubjectService;
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
	
	@Resource(name="TeacherSubjectService")
	private TeacherSubjectService subjectService;
	
	@Resource(name="lessonIndexService")
	private LessonIndexService lessonIndexService;
	
	/**
	 * 선생님 - 강의조회
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
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	/**
	 * 선생님 - 과목명-> 강의 조회(select box)
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
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 선생님 - 강의선택 -> 강의목차조회
	 */
	@ResponseBody
	@RequestMapping(path="/teacherL/selectAllLessonIndex", method=RequestMethod.GET)
	public List<LessonIndexVO> selectLessonPage(Model model,String lesId) {
		LessonIndexVO lesIdxVO = new LessonIndexVO();
		lesIdxVO.setLesId(lesId);
		
		logger.debug("강의번호:{}",lesId);
		List<LessonIndexVO> lesIdxList;
		try {
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
			logger.debug("강의목차:{}",lesIdxList);
			model.addAttribute("lesIdxList", lesIdxList);
			return lesIdxList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 선생님 - 강의 삭제
	 */
	@RequestMapping(path="/teacherL/deleteLesson",method=RequestMethod.GET)
	public String deleteLesson(Model model,String lesId) {
		
		logger.debug("lesId값!!!:{}",lesId);
		
		int lesIdxCnt;
		try {
			lesIdxCnt = lessonService.deleteLesson(lesId);
			if(lesIdxCnt ==1) {
				// 1일때 정상 => 강의가 삭제되면서 강의목차 부분만 내용이 바뀜
				List<LessonVO> noLessonList = lessonService.selectNoLesson();
				model.addAttribute("noLessonList",noLessonList);
				return "teacher/lesson/lessonDeleteHTML";
			}
			else {
				// 1이 아닐때 비정상 => 조회페이지 redirect
				return "redirect;/teacherL/selectSubject";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 선생님 - 임시저장된 강의 조회(삭제했을때 다시불러오기용)
	 */
	@RequestMapping(path="/teacherL/selectloadSubject",method= RequestMethod.GET)
	public String selecLoadSubject(Model model) {
		List<LessonVO> noLessonList;
		try {
			noLessonList = lessonService.selectNoLesson();
			model.addAttribute("noLessonList",noLessonList);
			
			logger.debug("개설안된강의!!:{}",noLessonList);
			return"teacher/lesson/lessonDeleteHTML";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 선생님 - 강의 등록(페이지만 띄우기)
	 */
	@RequestMapping(path="/teacherL/insertViewLesson")
	public String insertViewLesson() {
		return "teacherPage/teacher/lesson/lessonInsert";
	}
	
	/**
	 * 선생님 - 강의등록(값 받고 넘겨서 데이터 입력)
	 */
	@RequestMapping(path="/teacherL/insertLesson" ,method = {RequestMethod.POST})
	public String insertLesson(LessonIndexVO lessonIndexVO,LessonVO lessonVO	,String tchId, String subId,HttpServletRequest request) {
		
		lessonVO.setTchId("200ser");
		lessonVO.setSubId("SUB0003");
		
		int lesCnt = 0;
		int lesIdxCnt=0;
		
		try {
			lesCnt = lessonService.insertLesson(lessonVO);
			logger.debug("강의 추가됐니?:{}",lessonVO);
//			logger.debug("강의목차는?:{}", lesIdxVO);
			
			String lesId = lessonVO.getLesId();
			List<LessonIndexVO> lesIdxList = lessonIndexVO.getLesIdxList();
			for(LessonIndexVO lesIdxVO : lesIdxList) {
				lesIdxVO.setLesId(lesId);
				lesIdxCnt = lessonIndexService.insertLessonIndex(lesIdxVO);
				logger.debug("강의목차!!!!:{}",lesIdxVO);
				
			}
			
//			lesIdxCnt = lessonIndexService.insertLessonIndex(lesIdxVO);
//			logger.debug("리스트 사이즈!!:{}",lesIdxVO.getLesIdxLsit().size());
//			int[] results = new int[lesIdxVO.getLesIdxLsit().size()];
			
			
//			for(int i=0; i<lesIdxVO.getLesIdxList().size(); i++) {
//				lesIdxVO.setLidxNum(lesIdxVO.getLesIdxList().get(i).getLidxNum());
//				lesIdxVO.setLidxCont(lesIdxVO.getLesIdxList().get(i).getLidxCont());
//				lesIdxVO.setLesId(lesId);
//				
//				logger.debug("강의목차 아이디들어갔니????:{}", lesIdxVO);
//				lesIdxCnt = lessonIndexService.insertLessonIndex(lesIdxVO);
//				lesIdxCnt +=results[i];
//			}
//			String[] lidxNum = request.getParameterValues("lidxNum");
//			int[] lidxNumArray = new int[lidxNum.length];
//			for(int i=0; i<lidxNum.length; i++) {
//				lidxNumArray[i] = Integer.parseInt(lidxNum[i]);
//			}
			
//			String[] lidxContArray = request.getParameterValues("lidxCont");
			
			
//			logger.debug("숫자!!:{}", lidxNum);
//			
//			logger.debug("내용!?:{}", lidxContArray);
//			
//			lesIdxVO.setLesId(lesId);
//			lesIdxCnt = lessonIndexService.insertLessonIndex(lesIdxVO);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(lesCnt ==1 && lesIdxCnt == 1) {
			return "redirect:/teacherL/selectSubject";
		}
		else {
			return "teacherPage/teacher/lesson/lessonInsert";
		}
	}
	
	/**
	 * 선생님 - 강의수정 
	 */
	@RequestMapping(path="/teacherL/updateLesson")
	public String updateViewLesson(LessonVO lessonVO, Model model,String lesId,String subId) {
		//1. 강의, 강의목차 조회하기
		//2. 강의목차 옆에 삭제버튼달기 - 삭제시 화면이 load되어야함
		//3. 강의목차 추가하기 버튼달기
		//4. 등록버튼
		
		logger.debug("강의아디랑 과목아디!!!:{},{}", lesId,subId);
		LessonIndexVO lesIdxVO = new LessonIndexVO();
		List<LessonIndexVO> lesIdxList = null;
		
		lessonVO.setLesId(lesId);
//		lesIdxVO.setLesId(lesId);
		
		try {
			lessonVO= lessonService.selectDetailLesson(lessonVO);
			lesIdxList=lessonIndexService.selectLessonIndex(lesId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.debug("강의객체!!:{}", lessonVO);
		logger.debug("강의목차는???:{C}",lesIdxList);
		model.addAttribute("lessonVO",lessonVO);
		model.addAttribute("lesIdxList", lesIdxList);
		return "teacherPage/teacher/lesson/lessonUpdate";
	}
	
	/**
	 * 선생님 - 강의목차 수정(삭제&추가)
	 */
	@RequestMapping(path="/teacherL/updateLessonIndex")
	public String updateViewLessonIndex(String lidxId, Model model) {
		//1. 강의목차 삭제
		//2. 강의목차 추가
		LessonIndexVO lesIdxVO = new LessonIndexVO();
		List<LessonIndexVO> lesIdxList;
		lesIdxVO.setLidxId(lidxId);
		String lesId = lesIdxVO.getLesId();
		int cnt = 0;
		try {
			cnt = lessonIndexService.deleteLessonIndex(lesIdxVO);
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
			if(cnt == 1) {
				model.addAttribute("lesIdxList",lesIdxList);
				return "teacher/lesson/lessonIndexDeleteHTML";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
//	@RequestMapping(path="/teacherL/deleteLoadLesIdx")
//	public String deleteLessonIndex() {
//		
//	}
//	
}
