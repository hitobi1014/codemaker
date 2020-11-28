package kr.co.codemaker.teacher.course.exam.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.admin.vo.AdminVO;
import kr.co.codemaker.model.AnswersheetVO;
import kr.co.codemaker.model.ExamVO;
import kr.co.codemaker.model.QuestionVO;
import kr.co.codemaker.teacher.course.exam.vo.ExamRequestVO;

/**
 * 
* AnswersheetMapper.java
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
@Mapper("answersheetMapper")
public interface AnswersheetMapper {
	
	/**
	 * 시험문제 보기를 등록하는 메서드
	 * 
	 * @author 김미연
	 * @param answersheetVo
	 * @return 
	 */
	public int insertAnswersheet(AnswersheetVO answersheetVo) throws Exception;

	/**
	 * 시험보기를 수정하는 메서드
	 * 
	 * @author 김미연
	 * @param answersheetVo
	 * @return 
	 */
	public int updateAnswersheet(AnswersheetVO answersheetVo) throws Exception;

	/**
	 * 해당 시험보기를 조회하는 메서드
	 * @param questionVo
	 * @return 
	 */
	public List<AnswersheetVO> selectAnswersheet(QuestionVO questionVo) throws Exception;

	/**
	 * 시험보기를 삭제하는 메서드
	 * 
	 * @author 김미연
	 * @param questionVo
	 * @return 
	 */
	public int deleteAnswersheet(QuestionVO questionVo) throws Exception;

}
