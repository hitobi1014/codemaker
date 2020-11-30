package kr.co.codemaker.teacher.course.exam.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.exam.dao.AnswersheetMapper;
import kr.co.codemaker.teacher.course.exam.dao.ExamMapper;
import kr.co.codemaker.teacher.course.exam.dao.QuestionMapper;
import kr.co.codemaker.teacher.course.exam.vo.ExamRequestVO;
import kr.co.codemaker.teacher.course.exam.vo.ExamVO;
import kr.co.codemaker.teacher.course.exam.vo.QuestionVO;

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
	
	@Resource(name = "questionMapper")
	private QuestionMapper questionMapper;
	
	@Resource(name = "answersheetMapper")
	private AnswersheetMapper answersheetMapper;

	public String insertExam(ExamVO examVo) {
		try {
			return examMapper.insertExam(examVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int updateExam(ExamVO examVo) {
		try {
			return examMapper.updateExam(examVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public Map<String, Object> selectAllExam(ExamRequestVO examRequestVo) {
		Map<String, Object> examMap = new HashMap<String, Object>();
		
		List<ExamVO> examList = new ArrayList<ExamVO>();
		try {
			examList = examMapper.selectAllExam(examRequestVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		examMap.put("examList", examList);
		
		int totalCnt = 0;
		try {
			totalCnt = examMapper.selectTotalCntExam(examRequestVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		examMap.put("totalCnt", totalCnt);
		
		return examMap;
	}
	
	public ExamVO selectExam(ExamVO examVo) {
		try {
			return examMapper.selectExam(examVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int deleteExam(ExamVO examVo) {
		
		List<QuestionVO> questionList = new ArrayList<>();
		try {
			questionList = questionMapper.selectQuestion(examVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 시험문제 보기 삭제
		for(QuestionVO questionVo : questionList) {
			for(int i = 0; i < 4 ; i++) {
				try {
					answersheetMapper.deleteAnswersheet(questionVo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		// 시험 문제 삭제
		try {
			questionMapper.deleteQuestion(examVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			// 시험 삭제
			return examMapper.deleteExam(examVo);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return 0;
	}

}
