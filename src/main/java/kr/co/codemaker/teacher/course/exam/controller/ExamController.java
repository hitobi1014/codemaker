package kr.co.codemaker.teacher.course.exam.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codemaker.teacher.course.exam.service.AnswersheetService;
import kr.co.codemaker.teacher.course.exam.service.ExamService;
import kr.co.codemaker.teacher.course.exam.service.QuestionService;
import kr.co.codemaker.teacher.course.exam.vo.AnswersheetVO;
import kr.co.codemaker.teacher.course.exam.vo.ExamVO;
import kr.co.codemaker.teacher.course.exam.vo.LessonVO;
import kr.co.codemaker.teacher.course.exam.vo.QuestionVO;
import kr.co.codemaker.teacher.course.exam.vo.SubjectVO;
import kr.co.codemaker.teacher.course.lesson.service.LessonIndexService;
import kr.co.codemaker.teacher.course.lesson.vo.LessonIndexVO;

/**
 * 
* ExamController.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 24.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
@Controller
public class ExamController {

	@Resource(name = "examService")
	private ExamService examService;

	@Resource(name = "questionService")
	private QuestionService questionService;

	@Resource(name = "answersheetService")
	private AnswersheetService answersheetService;

	@Resource(name = "lessonIndexService")
	private LessonIndexService lessonIndexService;
	
	/**
	 * 시험 리스트 조회 - 과목 조회, 강의 조회, 시험 조회
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping(path = "/exam/selectAllExam")
	public String selectAllExam(Model model, HttpSession session, ExamVO examVO) {
//		String tchId = (String)session.getAttribute("");
//		subjectVO.setTchId(tchId);
		examVO.setTchId("200ser@maker.com");
		
		List<SubjectVO> subjectList = null;
		List<LessonVO> lessonList = null;
		List<ExamVO> examList = null;
		try {
			// 과목 아이디가 있으면
//			if(examVO.getSubId() != null) {
//			}
			lessonList = examService.selectAllLesson(examVO);
			subjectList = examService.selectAllSubject(examVO);
			examList = examService.selectAllExam(examVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("lessonList", lessonList);
		model.addAttribute("examList", examList);
		
		return "teacherPage/teacher/exam/examAllSelect";
	}
	
	/**
	 * 시험 리스트 조회 - 강의 조회
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping(path = "/exam/selectAllLesson")
	public String selectAllLesson(Model model, LessonVO lessonVO, HttpSession session) {
//		String tchId = (String)session.getAttribute("");
//		subjectVO.setTchId(tchId);
		
		lessonVO.setTchId("200ser@maker.com");
		
		List<LessonVO> lessonList = null;
		try {
			lessonList = examService.selectAllLesson(lessonVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("lessonList", lessonList);
		return "jsonView";
	}
//	
//	/**
//	 * 등록한 시험문제를 전체 조회하는 메서드
//	 * 
//	 * @author 김미연
//	 * @return
//	 */
//	@RequestMapping(path = "")
//	public String selectAllResExam(LessonVO lessonVO, Model model) {
//		try {
////			lessonVO.setExamList(examService.selectAllExam(lessonVO));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "teacher/exam/examAllSelectAjaxHTML";
//	}
//	
//	/**
//	 * 등록한 시험문제를 상세 조회하는 메서드
//	 * 
//	 * @author 김미연
//	 * @return
//	 */
//	@RequestMapping(path = "/exam/selectExam")
//	public String selectExam(ExamVO examVO, Model model) {
//		examVO = examService.selectExam(examVO);
//		
//		model.addAttribute("examVO", examVO);
//
//		List<QuestionVO> questionList = questionService.selectQuestion(examVO);
//		model.addAttribute("questionList", questionList);
//
//		List<AnswersheetVO> answersheetLists = new ArrayList<>();
//
//		for (QuestionVO questionVO : questionList) {
//			List<AnswersheetVO> answersheetList = answersheetService.selectAnswersheet(questionVO);
//
//			for (AnswersheetVO answersheetVO : answersheetList) {
//				answersheetLists.add(answersheetVO);
//			}
//		}
//		model.addAttribute("answersheetLists", answersheetLists);
//
//		return "teacherPage/teacher/exam/examSelect";
//	}
//	
//
//	/**
//	 * 시험 등록화면을 요청하는 메서드
//	 * 
//	 * @author 김미연
//	 * @return
//	 */
//	@RequestMapping(path = "/exam/insertExamView")
//	public String insertViewExam(ExamVO examVO, Model model) {
//
//		// 강의목차를 조회
//		// List<LessonIndexVO> lessonIndexList =
//		// lessonIndexService.selectLessonIndex(examVO);
//		List<LessonIndexVO> lessonIndexList = null;
//		try {
//			lessonIndexList = lessonIndexService.selectLessonIndex("LIDX0002");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		model.addAttribute("lessonIndexList", lessonIndexList);
//		// model.addAttribute("lidxId", lidxId);
//		// model.addAttribute("lidxId", "LIDX0002");
//
//		// return "";
//		return "teacher/exam/examInsert";
//	}
//
//	/**
//	 * 시험을 등록하는 메서드
//	 * 
//	 * @author 김미연
//	 * @return
//	 */
//	@RequestMapping(path = "/exam/insertExam")
//	public String insertExam(ExamVO examVO, List<QuestionVO> questionList, List<AnswersheetVO> answerList) {
//
//		// cur_id 와 exam_nm 분리하여 다시 셋팅
//		String[] examInfo = examVO.getLidxId().trim().split("\"");
//		examVO.setLidxId(examInfo[0]);
//		examVO.setExamNm(examInfo[1]);
//
//		String exam_id = examService.insertExam(examVO); // 시험 아이디를 가져온다.
//
//		int index = 0;
//		for (QuestionVO questionVO : questionList) {
//			// 시험 아이디를 셋팅
//			questionVO.setExamId(exam_id);
//
//			String que_id = questionService.insertQuestion(questionVO);
//
//			for (int i = index; i < index + 4; i++) { // 보기가 4개씩 존재
//				// 시험 문제 아이디를 셋팅
//				answerList.get(i).setQueId(que_id);
//			}
//			index = +4;
//		}
//
//		// 등록된 시험 화면으로 이동
//		return "redirect:/exam/selectExam?exam_id=" + exam_id;
//	}
//
//	/**
//	 * 시험 수정화면을 요청하는 메서드
//	 * 
//	 * @author 김미연
//	 * @return
//	 */
//	@RequestMapping(path = "/exam/updateExam", method = { RequestMethod.GET })
//	public String updateViewExam(ExamVO examVO, List<QuestionVO> questionList, List<AnswersheetVO> answerList,
//			Model model) {
//
//		// 강의목차를 조회
//		// List<LessonIndexVO> lessonIndexList =
//		// lessonIndexService.selectLessonIndex(examVO);
//		List<LessonIndexVO> lessonIndexList = null;
//		try {
//			lessonIndexList = lessonIndexService.selectLessonIndex("");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		model.addAttribute("lessonIndexList", lessonIndexList);
//		model.addAttribute("lidxId", examVO.getLidxId());
//		// model.addAttribute("lidxId", "LIDX0002");
//
//		if (examVO.getExamNm() == null || examVO.getExamNm().equals("")) { // 수정화면에서 요청이 왔을 경우
//
//			ExamVO ev = examService.selectExam(examVO);
//			model.addAttribute("examVO", ev);
//
//			questionList = questionService.selectQuestion(examVO);
//			model.addAttribute("questionList", questionList);
//
//			List<AnswersheetVO> answersheetLists = new ArrayList<>();
//
//			for (QuestionVO questionVO : questionList) {
//				List<AnswersheetVO> answersheetList = answersheetService.selectAnswersheet(questionVO);
//
//				for (AnswersheetVO answersheetVO : answersheetList) {
//					answersheetLists.add(answersheetVO);
//				}
//			}
//			model.addAttribute("answersheetLists", answersheetLists);
//
//		} else { // 시험 상세보기에서 요청이 왔을 경우
//			model.addAttribute("examVO", examVO);
//			model.addAttribute("questionList", questionList);
//			model.addAttribute("answersheetLists", answerList);
//		}
//
//		return "teacher/exam/examUpdate";
//	}
//
//	/**
//	 * 시험을 수정하는 메서드
//	 * 
//	 * @author 김미연
//	 * @return
//	 */
//	@RequestMapping(path = "/exam/updateExam", method = { RequestMethod.POST })
//	public String updateExam(ExamVO examVO, List<QuestionVO> questionList, List<AnswersheetVO> answerList) {
//
//		examService.updateExam(examVO);
//
//		for (QuestionVO questionVO : questionList) {
//			questionService.updateQuestion(questionVO);
//		}
//
//		for (AnswersheetVO answersheetVO : answerList) { // 보기가 4개씩 존재
//			answersheetService.updateAnswersheet(answersheetVO);
//		}
//
//		// 수정된 시험 화면으로 이동
//		return "redirect:/exam/selectExam?exam_id=" + examVO.getExamId();
//	}
//

//
//	/**
//	 * 등록한 시험문제를 전체 조회하는 메서드
//	 * 
//	 * @return
//	 */
//	@RequestMapping(path = "/exam/selectAllExam")
//	public String selectAllExam(ExamVO examVO, Model model, HttpSession session) {
//
//		return "teacherPage/teacher/exam/examAllSelect";
//	}
//

//
//	/**
//	 * 등록한 시험문제를 삭제하는 메서드
//	 * 
//	 * @author 김미연
//	 * @return
//	 */
//	@RequestMapping(path = "/exam/deleteExam")
//	public String deleteExam(ExamVO examVO) {
//
//		examService.deleteExam(examVO);
//
//		return "redirect:/exam/selectAllExam";
//	}

}
