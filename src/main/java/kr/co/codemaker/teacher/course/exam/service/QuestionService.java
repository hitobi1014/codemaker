package kr.co.codemaker.teacher.course.exam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.exam.dao.QuestionMapper;
import kr.co.codemaker.teacher.course.exam.vo.ExamVO;
import kr.co.codemaker.teacher.course.exam.vo.QuestionVO;

/**
 * 
* QuestionService.java
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
@Service("questionService")
public class QuestionService {
	
	@Resource(name = "questionMapper")
	private QuestionMapper questionMapper;

	public String insertQuestion(QuestionVO questionVo) {
		try {
			return questionMapper.insertQuestion(questionVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int updateQuestion(QuestionVO questionVo) {
		try {
			return questionMapper.updateQuestion(questionVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<QuestionVO> selectQuestion(ExamVO examVo) {
		try {
			return questionMapper.selectQuestion(examVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
