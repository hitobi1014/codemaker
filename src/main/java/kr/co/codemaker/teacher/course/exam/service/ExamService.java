package kr.co.codemaker.teacher.course.exam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.model.AnswersheetVO;
import kr.co.codemaker.model.ExamVO;
import kr.co.codemaker.model.QuestionVO;
import kr.co.codemaker.teacher.course.exam.dao.ExamMapper;
import kr.co.codemaker.teacher.course.exam.vo.ExamRequestVO;

/**
 * 
* ExamService.java
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
@Service("examService")
public class ExamService {
	
	@Resource(name = "examMapper")
	private ExamMapper examMapper;

	public String insertExam(ExamVO examVo) {
		return examMapper.insertExam(examVo);
	}
	
	public String insertQuestion(QuestionVO questionVo) {
		return examMapper.insertQuestion(questionVo);
	}

	public int insertAnswersheet(AnswersheetVO answersheetVo) {
		return examMapper.insertAnswersheet(answersheetVo);
	}

	public int updateExam(ExamVO examVo) {
		return examMapper.updateExam(examVo);
	}
	
	public int updateQuestion(QuestionVO questionVo) {
		return examMapper.updateQuestion(questionVo);
	}

	public int updateAnswersheet(AnswersheetVO answersheetVo) {
		return examMapper.updateAnswersheet(answersheetVo);
	}

	public Map<String, Object> selectAllExam(ExamRequestVO examRequestVo) {
		Map<String, Object> examMap = new HashMap<String, Object>();
		
		List<ExamVO> examList = examMapper.selectAllExam(examRequestVo);
		examMap.put("examList", examList);
		
		int totalCnt = examMapper.selectTotalCntExam(examRequestVo);
		examMap.put("totalCnt", totalCnt);
		
		return examMap;
	}
	
	public ExamVO selectExam(ExamVO examVo) {
		return examMapper.selectExam(examVo);
	}
	
	public List<QuestionVO> selectQuestion(ExamVO examVo) {
		return examMapper.selectQuestion(examVo);
	}
	
	public List<AnswersheetVO> selectAnswersheet(QuestionVO questionVo) {
		return examMapper.selectAnswersheet(questionVo);
	}

	public int deleteExam(ExamVO examVo) {
		
		List<QuestionVO> questionList = examMapper.selectQuestion(examVo);
		
		// 시험문제 보기 삭제
		for(QuestionVO questionVo : questionList) {
			for(int i = 0; i < 4 ; i++) {
				examMapper.deleteAnswersheet(questionVo);
			}
		}
		
		// 시험 문제 삭제
		examMapper.deleteQuestion(examVo);
		
		return examMapper.deleteExam(examVo); // 시험 삭제
	}

}
