package kr.co.codemaker.teacher.course.exam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.exam.dao.ExamDaoI;
import kr.co.codemaker.teacher.course.exam.model.AnswersheetVO;
import kr.co.codemaker.teacher.course.exam.model.ExamRequestVO;
import kr.co.codemaker.teacher.course.exam.model.ExamVO;
import kr.co.codemaker.teacher.course.exam.model.QuestionVO;

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
public class ExamService implements ExamServiceI {
	
	@Resource(name = "examDao")
	private ExamDaoI examDao;

	@Override
	public String insertExam(ExamVO examVo) {
		return examDao.insertExam(examVo);
	}
	
	@Override
	public String insertQuestion(QuestionVO questionVo) {
		return examDao.insertQuestion(questionVo);
	}

	@Override
	public int insertAnswersheet(AnswersheetVO answersheetVo) {
		return examDao.insertAnswersheet(answersheetVo);
	}

	@Override
	public int updateExam(ExamVO examVo) {
		return examDao.updateExam(examVo);
	}
	
	@Override
	public int updateQuestion(QuestionVO questionVo) {
		return examDao.updateQuestion(questionVo);
	}

	@Override
	public int updateAnswersheet(AnswersheetVO answersheetVo) {
		return examDao.updateAnswersheet(answersheetVo);
	}

	@Override
	public Map<String, Object> selectAllExam(ExamRequestVO examRequestVo) {
		Map<String, Object> examMap = new HashMap<String, Object>();
		
		List<ExamVO> examList = examDao.selectAllExam(examRequestVo);
		examMap.put("examList", examList);
		
		int totalCnt = examDao.selectTotalCntExam(examRequestVo);
		examMap.put("totalCnt", totalCnt);
		
		return examMap;
	}
	
	@Override
	public ExamVO selectExam(ExamVO examVo) {
		return examDao.selectExam(examVo);
	}
	
	@Override
	public List<QuestionVO> selectQuestion(ExamVO examVo) {
		return examDao.selectQuestion(examVo);
	}
	
	@Override
	public List<AnswersheetVO> selectAnswersheet(QuestionVO questionVo) {
		return examDao.selectAnswersheet(questionVo);
	}

	@Override
	public int deleteExam(ExamVO examVo) {
		
		List<QuestionVO> questionList = examDao.selectQuestion(examVo);
		
		// 시험문제 보기 삭제
		for(QuestionVO questionVo : questionList) {
			for(int i = 0; i < 4 ; i++) {
				examDao.deleteAnswersheet(questionVo);
			}
		}
		
		// 시험 문제 삭제
		examDao.deleteQuestion(examVo);
		
		return examDao.deleteExam(examVo); // 시험 삭제
	}

}
