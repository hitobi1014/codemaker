package kr.co.codemaker.user.classroom.exam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.user.classroom.exam.dao.QuestionUserMapper;
import kr.co.codemaker.user.classroom.exam.vo.ExamResultVO;
import kr.co.codemaker.user.classroom.exam.vo.ExamVO;
import kr.co.codemaker.user.classroom.exam.vo.QuestionVO;

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
	
	public int intsertExamResult(ExamResultVO examResultVo) {
		try {
//			return questionUserMapper.intsertExamResult(examResultVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
