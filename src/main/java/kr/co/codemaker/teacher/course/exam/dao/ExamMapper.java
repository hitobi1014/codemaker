package kr.co.codemaker.teacher.course.exam.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.model.ExamVO;
import kr.co.codemaker.teacher.course.exam.vo.ExamRequestVO;

/**
 * 
* ExamMapper.java
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
@Mapper("examMapper")
public interface ExamMapper {
	
	/**
	 * 시험을 등록하는 메서드
	 * 
	 * @author 김미연
	 * @param examVo
	 * @return 
	 */
	public String insertExam(ExamVO examVo) throws Exception;
	
	/**
	 * 시험을 수정하는 메서드
	 * 
	 * @author 김미연
	 * @param examVo
	 * @return 
	 */
	public int updateExam(ExamVO examVo) throws Exception;
	
	/**
	 * 자신이 출제한 시험 문제를 전체 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param examRequestVo
	 * @return 
	 */
	public List<ExamVO> selectAllExam(ExamRequestVO examRequestVo) throws Exception;
	
	/**
	 * 페이징 처리를 위해 출제한 문제의 전체 수를 조회하는 메서드
	 * 
	 * @param examRequestVo
	 * @return
	 */
	public int selectTotalCntExam(ExamRequestVO examRequestVo) throws Exception;
	
	/**
	 * 해당 시험을 조회하는 메서드
	 * @param examVo
	 * @return 
	 */
	public ExamVO selectExam(ExamVO examVo) throws Exception;
	
	/**
	 * 시험을 삭제하는 메서드
	 * 
	 * @author 김미연
	 * @param examVo
	 * @return 
	 */
	public int deleteExam(ExamVO examVo) throws Exception;
	
}
