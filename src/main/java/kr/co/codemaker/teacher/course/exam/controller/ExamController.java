package kr.co.codemaker.teacher.course.exam.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.teacher.course.exam.service.AnswersheetService;
import kr.co.codemaker.teacher.course.exam.service.ExamService;
import kr.co.codemaker.teacher.course.exam.service.QuestionService;
import kr.co.codemaker.teacher.course.exam.vo.AnswersheetVO;
import kr.co.codemaker.teacher.course.exam.vo.ExamVO;
import kr.co.codemaker.teacher.course.exam.vo.LessonVO;
import kr.co.codemaker.teacher.course.exam.vo.QuestionVO;
import kr.co.codemaker.teacher.course.exam.vo.SubjectVO;
import kr.co.codemaker.teacher.course.lesson.service.LessonIndexService;

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
		
		List<SubjectVO> subjectList = new ArrayList<>();
		List<LessonVO> lessonList = new ArrayList<>();
		List<ExamVO> examList = new ArrayList<>();
		int totalCnt = 0;
		
		try {
			lessonList = examService.selectAllLesson(examVO);
			subjectList = examService.selectAllSubject(examVO);
			examList = examService.selectAllExam(examVO);
			totalCnt = examService.selectTotalCntExam(examVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int pages = (int) Math.ceil((double) totalCnt / 1);
		
		model.addAttribute("pages", pages);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("lessonList", lessonList);
		model.addAttribute("examList", examList);
		
		return "teacherPage/teacher/exam/examAllSelect";
	}
	
	/**
	 * 강의 조회를 위한 메서드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping(path = "/exam/selectAllLesson")
	public String selectAllLesson(Model model, LessonVO lessonVO, HttpSession session) {
//		String tchId = (String)session.getAttribute("");
//		subjectVO.setTchId(tchId);
		
		lessonVO.setTchId("200ser@maker.com");
		
		List<LessonVO> lessonList = new ArrayList<>();
		try {
			lessonList = examService.selectAllLesson(lessonVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("lessonList", lessonList);
		return "jsonView";
	}
	
	/**
	 * 등록한 시험문제를 상세 조회하는 메서드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping(path = "/exam/selectExam")
	public String selectExam(ExamVO examVO, Model model) {
		ExamVO ev = new ExamVO();
		List<QuestionVO> questionList = new ArrayList<>();
		List<AnswersheetVO> answersheetLists = new ArrayList<AnswersheetVO>();
		
		try {
			ev = examService.selectExam(examVO);
			questionList = questionService.selectQuestion(examVO);
			for (QuestionVO questionVO : questionList) {
				List<AnswersheetVO> answersheetList = answersheetService.selectAnswersheet(questionVO);
				
				for (AnswersheetVO answersheetVO : answersheetList) {
					answersheetLists.add(answersheetVO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("ev", ev);
		model.addAttribute("questionList", questionList);
		model.addAttribute("answersheetLists", answersheetLists);

		return "teacherPage/teacher/exam/examSelect";
	}
	
	/**
	 * 시험 수정화면을 요청하는 메서드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping(path = "/exam/updateViewExam")
	public String updateViewExam(ExamVO examVO, ArrayList<QuestionVO> questionList, ArrayList<AnswersheetVO> answerList, Model model) {
//		ExamVO ev = new ExamVO();
//		List<QuestionVO> questionList = new ArrayList<>();
//		List<AnswersheetVO> answersheetLists = new ArrayList<>();
//		
//		try {
//			ev = examService.selectExam(examVO);
//			questionList = questionService.selectQuestion(examVO);
//			for (QuestionVO questionVO : questionList) {
//				List<AnswersheetVO> answersheetList = answersheetService.selectAnswersheet(questionVO);
//				
//				for (AnswersheetVO answersheetVO : answersheetList) {
//					answersheetLists.add(answersheetVO);
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		model.addAttribute("ev", ev);
//		model.addAttribute("questionList", questionList);
//		model.addAttribute("answersheetLists", answersheetLists);

		return "teacherPage/teacher/exam/examUpdate";
	}

	/**
	 * 시험을 수정하는 메서드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping(path = "/exam/updateExam")
	public String updateExam(ExamVO examVO, ArrayList<QuestionVO> questionVO, ArrayList<AnswersheetVO> answerList) {
//		try {
//			examService.updateExam(examVO);
//			for (QuestionVO questionVO : questionVO) {
//				questionService.updateQuestion(questionVO);
//			}
//			
//			for (AnswersheetVO answersheetVO : answerList) { // 보기가 4개씩 존재
//				answersheetService.updateAnswersheet(answersheetVO);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		// 수정된 시험 화면으로 이동
		return "redirect:/exam/selectExam?exam_id=" + examVO.getExamId();
	}
	
//
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
