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
import kr.co.codemaker.user.classroom.exam.service.ExamResultUserService;
import kr.co.codemaker.user.classroom.exam.service.ExamScoreUserService;
import kr.co.codemaker.user.classroom.exam.service.ExamUserService;
import kr.co.codemaker.user.classroom.exam.service.QuestionUserService;
import kr.co.codemaker.user.classroom.exam.vo.AnswersheetVO;
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
	
	@Resource(name = "examScoreUserService")
	private ExamScoreUserService examScoreUserService;
	
	@Resource(name = "examResultUserService")
	private ExamResultUserService examResultUserService;
	
	/**
	 * 시험문제를 전체 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param examVO
	 * @param model
	 * @return
	 */
	@RequestMapping(path = "/examUser/selectAllExam")
	public String selectAllExam(ExamVO examVO, Model model, HttpSession session) {
//		String userId = (String)session.getAttribute("");
		
		String userId = "b001@naver.com";
		examVO.setUserId(userId);
		
		List<ExamVO> examList = new ArrayList<>();
		int totalCnt = 0;
		
		try {
			examList = examUserService.selectAllExam(examVO);
			totalCnt = examUserService.selectTotalCntExam(examVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int pages = (int) Math.ceil((double) totalCnt / 1);
		
		model.addAttribute("examList", examList);      
		model.addAttribute("pages", pages);
		
		return "mypageT/user/exam/examAllSelect";
	}
	
	/**
	 * 시험문제를 상세 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param examVO
	 * @param model
	 * @return
	 */
	@RequestMapping(path = "/examUser/selectExam")
	public String selectExam(ExamVO examVO, Model model) {
		ExamVO ev = new ExamVO();
		List<QuestionVO> questionList = new ArrayList<>();
		List<AnswersheetVO> answersheetLists = new ArrayList<AnswersheetVO>();
		
		try {
			ev = examUserService.selectExam(examVO);
			questionList = questionUserService.selectQuestion(examVO);
			for (QuestionVO questionVO : questionList) {
				List<AnswersheetVO> answersheetList = answersheetUserService.selectAnswersheet(questionVO);
				
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
		
		return "teacher/exam/examSelect";
	}
	
	/**
	 * 회원의 모든 성적을 조회하는 메서드 - 점수 조회
	 * 
	 * @author 김미연
	 * @param examScoreVO
	 * @return
	 * @throws Exception
	 */
	public String selectAllExamScore(ExamScoreVO examScoreVO, Model model, HttpSession session) {
//		String userId = (String)session.getAttribute("");
		
		String userId = "b001@naver.com";
		examScoreVO.setUserId(userId);
		
		List<ExamScoreVO> examScoreList = new ArrayList<>();
		
		try {
			examScoreList = examScoreUserService.selectAllExamScore(examScoreVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("examScoreList", examScoreList);
		
		return "";
	}
	
	/**
	 * 회원의 성적 1개를 조회하는 메서드 - 상세조회 : 점수조회 + 문제조회
	 * 
	 * @author 김미연
	 * @param examScoreVO
	 * @return
	 * @throws Exception
	 */
	public String selectExamScore(ExamScoreVO examScoreVO, Model model) {
		
		ExamScoreVO esv = new ExamScoreVO();
		ExamResultVO examResultVO = new ExamResultVO();
		List<ExamResultVO> examResultList = new ArrayList<>();
		
		try {
			esv = examScoreUserService.selectExamScore(examScoreVO);
			examResultList = examResultUserService.selectAllExamResult(examScoreVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("examScoreVO", esv);
		model.addAttribute("examResultList", examResultList);
		
		return "";
	}
	
	
	/**
	 * 시험점수와 시험결과를 등록하는 메서드 - 처음 시험을 풀때만
	 * 
	 * @author 김미연
	 * @param examScoreVO
	 * @param session
	 * @return
	 */
	@RequestMapping(path = "/examUser/insertExamResult")
	public String insertExamResult(ExamScoreVO examScoreVO, HttpSession session) {
		
//		String userId = (String)session.getAttribute("");
		String userId = "b001@naver.com";
		
		try {
			examScoreUserService.insertExamScore(examScoreVO);
			
			for(ExamResultVO examResultVO : examScoreVO.getExamResultList()) {
				examResultUserService.insertExamResult(examResultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
//		List<QuestionVO> questionList = questionUserService.selectQuestion(examVO);
//		
//		ExamScoreVO esv = examUserService.selectExamScore(examScoreVO);
//		
//		int score = 0;
//		
//		for(int i=0; i < questionList.size(); i++) {
//			// 정답일 경우
//			if(questionList.get(i).getQueAnswer().equals(examResultList.get(i).getErAnswer())) {
//				examResultList.get(i).setErCheck("Y");
//				score += questionList.get(i).getQueScore();
//			}else {	// 오답일 경우
//				examResultList.get(i).setErCheck("N");
//			}
//			examResultList.get(i).setUserId(userId);
//			examResultList.get(i).setExamId(examScoreVO.getExamId());
//		}
//		
//		// 문제 수 만큼 등록
//		for(ExamResultVO examResultVo : examResultList) {
//			questionUserService.intsertExamResult(examResultVo);
//		}
//		
//		// 처음 풀 경우
//		if(esv.getEsFscore() == 0) {
//			examScoreVO.setEsFscore(score);
//			examUserService.insertExamScore(examScoreVO);
//			
//		}else { // 다시 풀 경우
//			examScoreVO.setEsLscore(score);
//			examUserService.updateExamScore(examScoreVO);
//		}
		
		return "";
		
	}
	
	/**
	 * 회원의 성적을 수정하는 메서드
	 * 
	 * @author 김미연
	 * @param examScoreVO
	 * @return
	 * @throws Exception
	 */
	public String updateExamScore(ExamScoreVO examScoreVO) {
		try {
			examScoreUserService.updateExamScore(examScoreVO);
			
			for(ExamResultVO examResultVO : examScoreVO.getExamResultList()) {
				examResultUserService.updateExamResult(examResultVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}

}
