package kr.co.codemaker.user.classroom.exam.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.user.classroom.exam.vo.ExamRequestVO;
import kr.co.codemaker.user.classroom.exam.vo.ExamScoreVO;
import kr.co.codemaker.user.classroom.exam.vo.ExamVO;

/**
 * 
* ExamUserMapper.java
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
@Mapper("examUserMapper")
public interface ExamUserMapper {
	
	/**
	 * 시험 문제를 전체 조회하는 메서드
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
	 * 해당 시험 점수를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param examScoreVo
	 * @return
	 * @throws Exception
	 */
	public ExamScoreVO selectExamScore(ExamScoreVO examScoreVo) throws Exception;

	
}
