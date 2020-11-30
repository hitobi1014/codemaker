package kr.co.codemaker.user.classroom.exam.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.teacher.course.exam.vo.ExamVO;
import kr.co.codemaker.teacher.course.exam.vo.QuestionVO;
import kr.co.codemaker.user.classroom.exam.vo.ExamResultVO;

/**
 * 
* QuestionUserMapper.java
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
@Mapper("questionUserMapper")
public interface QuestionUserMapper {
	
	/**
	 * 해당 시험문제를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param examVo
	 * @return 
	 */
	public List<QuestionVO> selectQuestion(ExamVO examVo) throws Exception;
	
	/**
	 * 시험 결과를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param questionVO
	 * @return
	 * @throws Exception
	 */
	public ExamResultVO selectExamResult(QuestionVO questionVO) throws Exception;
	
	
}
