package kr.co.codemaker.user.classroom.exam.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.exam.vo.ExamRequestVO;
import kr.co.codemaker.teacher.course.exam.vo.ExamVO;
import kr.co.codemaker.user.classroom.exam.dao.AnswersheetUserMapper;
import kr.co.codemaker.user.classroom.exam.dao.ExamUserMapper;
import kr.co.codemaker.user.classroom.exam.dao.QuestionUserMapper;
import kr.co.codemaker.user.classroom.exam.vo.ExamScoreVO;


/**
 * 
* ExamUserService.java
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
@Service("examUserService")
public class ExamUserService {
	
	@Resource(name = "examUserMapper")
	private ExamUserMapper examUserMapper;
	
	@Resource(name = "questionUserMapper")
	private QuestionUserMapper questionUserMapper;
	
	@Resource(name = "answersheetUserMapper")
	private AnswersheetUserMapper answersheetUserMapper;

	
	public Map<String, Object> selectAllExam(ExamRequestVO examRequestVo) {
		Map<String, Object> examMap = new HashMap<String, Object>();
		
		List<ExamVO> examList = new ArrayList<ExamVO>();
		try {
			examList = examUserMapper.selectAllExam(examRequestVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		examMap.put("examList", examList);
		
		int totalCnt = 0;
		try {
			totalCnt = examUserMapper.selectTotalCntExam(examRequestVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		examMap.put("totalCnt", totalCnt);
		
		return examMap;
	}
	
	public ExamVO selectExam(ExamVO examVo) {
		try {
			return examUserMapper.selectExam(examVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ExamScoreVO selectExamScore(ExamScoreVO examScoreVo) {
		
		try {
			return examUserMapper.selectExamScore(examScoreVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
