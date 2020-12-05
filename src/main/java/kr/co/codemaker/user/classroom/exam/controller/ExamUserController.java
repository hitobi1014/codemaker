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
import kr.co.codemaker.user.classroom.exam.vo.ExamResultVO;
import kr.co.codemaker.user.classroom.exam.vo.ExamScoreVO;
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
	
	/**
	 * 시험점수를 가져오는 메서드
	 * @return
	 */
	@RequestMapping(path = "/examUser/selectExamScore")
	public String selectExamScore(ExamScoreVO examScoreVo, Model model) {
		ExamScoreVO esv = examUserService.selectExamScore(examScoreVo);
		
		model.addAttribute("examScoreVo", esv);
		
		return "user/exam/examScroeSelect";
		
	}
	
	/**
	 * 시험결과를 가져오는 메서드
	 * @return
	 */
	@RequestMapping(path = "/examUser/selectExamResult")
	public String selectExamResult(ExamVO examVo, Model model) {
		
		List<ExamResultVO> examResultList = examUserService.selectExamResult(examVo); 
		
		model.addAttribute("examResultList", examResultList);
		
		return "";
		
	}
	
	/**
	 * 시험점수와 시험결과를 등록하는 메서드
	 * @return
	 */
	@RequestMapping(path = "/examUser/insertExamResult")
	public String insertExamResult(ExamScoreVO examScoreVo, List<ExamResultVO> examResultList, HttpSession session) {
		
//		String userId = (String)session.getAttribute("");
		String userId = "";
		
		ExamVO examVo = new ExamVO(examScoreVo.getExamId());
		examScoreVo.setUserId(userId);
		
		List<QuestionVO> questionList = questionUserService.selectQuestion(examVo);
		
		ExamScoreVO esv = examUserService.selectExamScore(examScoreVo);
		
		int score = 0;
		
		for(int i=0; i < questionList.size(); i++) {
			// 정답일 경우
			if(questionList.get(i).getQueAnswer().equals(examResultList.get(i).getErAnswer())) {
				examResultList.get(i).setErCheck("Y");
				score += questionList.get(i).getQueScore();
			}else {	// 오답일 경우
				examResultList.get(i).setErCheck("N");
			}
			examResultList.get(i).setUserId(userId);
			examResultList.get(i).setExamId(examScoreVo.getExamId());
		}
		
		// 문제 수 만큼 등록
		for(ExamResultVO examResultVo : examResultList) {
			questionUserService.intsertExamResult(examResultVo);
		}
		
		// 처음 풀 경우
		if(esv.getEsFscore() == 0) {
			examScoreVo.setEsFscore(score);
			examUserService.insertExamScore(examScoreVo);
			
		}else { // 다시 풀 경우
			examScoreVo.setEsLscore(score);
			examUserService.updateExamScore(examScoreVo);
		}
		
		return "";
		
	}

}
