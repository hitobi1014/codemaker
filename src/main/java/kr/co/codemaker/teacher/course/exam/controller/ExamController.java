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

import kr.co.codemaker.teacher.course.exam.dao.AnswersheetMapper;
import kr.co.codemaker.teacher.course.exam.dao.ExamMapper;
import kr.co.codemaker.teacher.course.exam.dao.QuestionMapper;
import kr.co.codemaker.teacher.course.exam.service.AnswersheetService;
import kr.co.codemaker.teacher.course.exam.service.ExamService;
import kr.co.codemaker.teacher.course.exam.service.QuestionService;
import kr.co.codemaker.teacher.course.exam.vo.AnswersheetVO;
import kr.co.codemaker.teacher.course.exam.vo.ExamRequestVO;
import kr.co.codemaker.teacher.course.exam.vo.ExamVO;
import kr.co.codemaker.teacher.course.exam.vo.QuestionVO;

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
	
//	@Resource(name = "curriculumService")
//	private CurriculumServiceI curriculumService;
	
	/**
	 * 시험 등록화면을 요청하는 메서드
	 * @return
	 */
	@RequestMapping(path = "/exam/insertExam" , method = {RequestMethod.GET})
	public String insertViewExam(String lesId, String curId, Model model) {
		
		// 커리큘럼을 조회
//		List<CurriculumVO> curriculumList = curriculumService.selectAllCurriculum(les_id);
		
		
//		List<CurriculumVO> curriculumList = new ArrayList<>();
//		
//		CurriculumVO cur1 = new CurriculumVO("cur1", 1, "cutest1", "1", "0", "les1");
//		CurriculumVO cur2 = new CurriculumVO("cur2", 1, "cutest2", "1", "0", "les1");
//		CurriculumVO cur3 = new CurriculumVO("cur3", 1, "cutest3", "1", "0", "les1");
//		
//		curriculumList.add(cur1);
//		curriculumList.add(cur2);
//		curriculumList.add(cur3);
//		
//		model.addAttribute("curriculumList", curriculumList);
//		model.addAttribute("curId", curId);

		return "teacher/exam/examInsert";
	}
	
	/**
	 * 시험을 등록하는 메서드 
	 * @return
	 */
	@RequestMapping(path = "/exam/insertExam" , method = {RequestMethod.POST})
	public String insertExam(ExamVO examVo, List<QuestionVO> questionList, 
							List<AnswersheetVO> answerList) {
		
		// cur_id 와 exam_nm 분리하여 다시 셋팅
		String[] examInfo = examVo.getCur_id().trim().split("\"");
		examVo.setCur_id(examInfo[0]);
		examVo.setExam_nm(examInfo[1]);
		
		String exam_id = examService.insertExam(examVo); // 시험 아이디를 가져온다.
		
		int index = 0;
		for(QuestionVO questionVo : questionList) {
			// 시험 아이디를 셋팅
			questionVo.setExam_id(exam_id);
			
			String que_id = questionService.insertQuestion(questionVo);
			
			for(int i=index; i < index+4 ; i++) { // 보기가 4개씩 존재
				// 시험 문제 아이디를 셋팅
				answerList.get(i).setQue_id(que_id);
			}
			index=+4;
		}
		
		// 등록된 시험 화면으로 이동
		return "redirect:/exam/selectExam?exam_id=" + exam_id;
	}
	
	/**
	 * 시험 수정화면을 요청하는 메서드
	 * @return
	 */
	@RequestMapping(path = "/exam/updateExam" , method = {RequestMethod.GET})
	public String updateViewExam(ExamVO examVo, List<QuestionVO> questionList, 
							List<AnswersheetVO> answerList, Model model) {
		
		// 커리큘럼을 조회
//		List<CurriculumVO> curriculumList = curriculumService.selectAllCurriculum(examVo.getLes_id());
		
//		model.addAttribute("curriculumList", curriculumList);
		
//		List<CurriculumVO> curriculumList = new ArrayList<>();
//		
//		CurriculumVO cur1 = new CurriculumVO("cur1", 1, "cutest", "1", "0", "les1");
//		CurriculumVO cur2 = new CurriculumVO("cur2", 1, "cutest", "1", "0", "les1");
//		CurriculumVO cur3 = new CurriculumVO("cur3", 1, "cutest", "1", "0", "les1");
//		
//		curriculumList.add(cur1);
//		curriculumList.add(cur2);
//		curriculumList.add(cur3);
//		
//		model.addAttribute("curriculumList", curriculumList);
		
		if(examVo.getExam_nm() == null || examVo.getExam_nm().equals("")) { // 수정화면에서 요청이 왔을 경우
			
			ExamVO ev = examService.selectExam(examVo);
			model.addAttribute("examVo", ev);
			
			questionList = questionService.selectQuestion(examVo);
			model.addAttribute("questionList", questionList);
			
			List<AnswersheetVO> answersheetLists = new ArrayList<>(); 
			
			for(QuestionVO questionVo : questionList) {
				List<AnswersheetVO> answersheetList = answersheetService.selectAnswersheet(questionVo);
				
				for(AnswersheetVO answersheetVo : answersheetList) {
					answersheetLists.add(answersheetVo);
				}
			}
			model.addAttribute("answersheetLists", answersheetLists);
			
		}else { // 시험 상세보기에서 요청이 왔을 경우
			model.addAttribute("examVo", examVo);
			model.addAttribute("questionList", questionList);
			model.addAttribute("answersheetLists", answerList);
		}
		
		
		return "teacher/exam/examUpdate";
	}
	
	/**
	 * 시험을 수정하는 메서드 
	 * @return
	 */
	@RequestMapping(path = "/exam/updateExam" , method = {RequestMethod.POST})
	public String updateExam(ExamVO examVo, List<QuestionVO> questionList, 
						List<AnswersheetVO> answerList) {
		
		examService.updateExam(examVo);
		
		for(QuestionVO questionVo : questionList) {
			questionService.updateQuestion(questionVo);
		}
		
		for(AnswersheetVO answersheetVo : answerList) { // 보기가 4개씩 존재
			answersheetService.updateAnswersheet(answersheetVo);
		}
		
		// 수정된 시험 화면으로 이동
		return "redirect:/exam/selectExam?exam_id=" + examVo.getExam_id();
	}
	
	/**
	 * 등록한 시험문제를 전체 조회하는 메서드
	 * @return
	 */
	@RequestMapping(path = "/exam/selectAllResExam")
	public String selectAllExam(ExamRequestVO examRequestVo, Model model, HttpSession session) {
		
		Map<String, Object> examMap = examService.selectAllExam(examRequestVo);
		
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
	@RequestMapping(path = "/exam/selectAllExam")
	public String selectAllTestExam(ExamRequestVO examRequestVo, Model model, HttpSession session) {
		
		return "teacher/exam/examAllSelect";
	}
	
	/**
	 * 등록한 시험문제를 상세 조회하는 메서드
	 * @return
	 */
	@RequestMapping(path = "/exam/selectExam")
	public String selectExam(ExamVO examVo, Model model) {
		ExamVO ev = examService.selectExam(examVo);
		model.addAttribute("examVo", ev);
		
		List<QuestionVO> questionList = questionService.selectQuestion(examVo);
		model.addAttribute("questionList", questionList);
		
		List<AnswersheetVO> answersheetLists = new ArrayList<>(); 
		
		for(QuestionVO questionVo : questionList) {
			List<AnswersheetVO> answersheetList = answersheetService.selectAnswersheet(questionVo);
			
			for(AnswersheetVO answersheetVo : answersheetList) {
				answersheetLists.add(answersheetVo);
			}
		}
		model.addAttribute("answersheetLists", answersheetLists);
		
		return "teacher/exam/examSelect";
	}
	
	/**
	 * 등록한 시험문제를 삭제하는 메서드
	 * @return
	 */
	@RequestMapping(path = "/exam/deleteExam")
	public String deleteExam(ExamVO examVo) {
		
		examService.deleteExam(examVo);
		
		return "redirect:/exam/selectAllExam";
	}

}
