package kr.co.codemaker.teacher.course.exam.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.exam.dao.AnswersheetMapper;
import kr.co.codemaker.teacher.course.exam.vo.AnswersheetVO;
import kr.co.codemaker.teacher.course.exam.vo.QuestionVO;

/**
 * 
* AnswersheetService.java
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
@Service("answersheetService")
public class AnswersheetService {
	
	@Resource(name = "answersheetMapper")
	private AnswersheetMapper answersheetMapper;

	public int insertAnswersheet(AnswersheetVO answersheetVO) {
		try {
			return answersheetMapper.insertAnswersheet(answersheetVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int updateAnswersheet(AnswersheetVO answersheetVO) {
		try {
			return answersheetMapper.updateAnswersheet(answersheetVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<AnswersheetVO> selectAnswersheet(QuestionVO questionVO) {
		try {
			return answersheetMapper.selectAnswersheet(questionVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
