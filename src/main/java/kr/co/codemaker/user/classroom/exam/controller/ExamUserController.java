package kr.co.codemaker.user.classroom.exam.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.user.classroom.exam.service.AnswersheetUserService;
import kr.co.codemaker.user.classroom.exam.service.ExamUserService;
import kr.co.codemaker.user.classroom.exam.service.QuestionUserService;
import kr.co.codemaker.user.classroom.exam.vo.AnswersheetVO;
import kr.co.codemaker.user.classroom.exam.vo.ExamRequestVO;
import kr.co.codemaker.user.classroom.exam.vo.ExamVO;
import kr.co.codemaker.user.classroom.exam.vo.QuestionVO;

/**
 * 
* ExamController.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 30.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
@Controller
public class ExamUserController {
	
	@Resource(name = "examUserService")
	private ExamUserService examUserService;
	
	@Resource(name = "questionUserService")
	private QuestionUserService questionUserService;
	
	@Resource(name = "answersheetUserService")
	private AnswersheetUserService answersheetUserService;
	
//	@Resource(name = "curriculumService")
//	private CurriculumServiceI curriculumService;
	
	/**
	 * 시험문제를 전체 조회하는 메서드
	 * @return
	 */
	@RequestMapping(path = "/examUser/selectAllResExam")
	public String selectAllExam(ExamRequestVO examRequestVo, Model model, HttpSession session) {
		
		Map<String, Object> examMap = examUserService.selectAllExam(examRequestVo);
		
		model.addAttribute("examList", (List<ExamVO>)examMap.get("examList"));      
		
		int totalCnt = (int)examMap.get("totalCnt");
		
//		int pages = (int) Math.ceil((double) totalCnt / examRequestVo.getPageSize());
		int pages = (int) Math.ceil((double) totalCnt / 5);

		model.addAttribute("pages", pages);
		model.addAttribute("startPage", 1);
		model.addAttribute("endPage", pages);
		model.addAttribute("page", examRequestVo.getPage());
		
		session.setAttribute("exam_state", examRequestVo.getExamState()); // 검색 조건
		
		return "teacher/exam/examAllSelectAjaxHTML";
	}
	
	/**
	 * 등록한 시험문제를 전체 조회하는 메서드
	 * @return
	 */
	@RequestMapping(path = "/examUser/selectAllExam")
	public String selectAllTestExam(ExamRequestVO examRequestVo, Model model, HttpSession session) {
		
		return "teacher/exam/examAllSelect";
	}
	
	/**
	 * 시험문제를 상세 조회하는 메서드
	 * @return
	 */
	@RequestMapping(path = "/examUser/selectExam")
	public String selectExam(ExamVO examVo, Model model) {
		ExamVO ev = examUserService.selectExam(examVo);
		model.addAttribute("examVo", ev);
		
		List<QuestionVO> questionList = questionUserService.selectQuestion(examVo);
		model.addAttribute("questionList", questionList);
		
		List<AnswersheetVO> answersheetLists = new ArrayList<>(); 
		
		for(QuestionVO questionVo : questionList) {
			List<AnswersheetVO> answersheetList = answersheetUserService.selectAnswersheet(questionVo);
			
			for(AnswersheetVO answersheetVo : answersheetList) {
				answersheetLists.add(answersheetVo);
			}
		}
		model.addAttribute("answersheetLists", answersheetLists);
		
		return "teacher/exam/examSelect";
	}
	

}
