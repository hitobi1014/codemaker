package kr.co.codemaker.user.classroom.exam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.exam.vo.ExamVO;
import kr.co.codemaker.teacher.course.exam.vo.QuestionVO;
import kr.co.codemaker.user.classroom.exam.dao.QuestionUserMapper;
import kr.co.codemaker.user.classroom.exam.vo.ExamResultVO;

/**
 * 
* QuestionUserService.java
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
@Service("questionUserService")
public class QuestionUserService {
	
	@Resource(name = "questionUserMapper")
	private QuestionUserMapper questionUserMapper;
	
	public List<QuestionVO> selectQuestion(ExamVO examVo) {
		try {
			return questionUserMapper.selectQuestion(examVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ExamResultVO selectExamResult(QuestionVO questionVO) {
		
		try {
			return questionUserMapper.selectExamResult(questionVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
