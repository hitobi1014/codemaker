package kr.co.codemaker.teacher.course.exam.service;

import java.util.List;
import java.util.Map;

import kr.co.codemaker.teacher.course.exam.model.AnswersheetVO;
import kr.co.codemaker.teacher.course.exam.model.ExamRequestVO;
import kr.co.codemaker.teacher.course.exam.model.ExamVO;
import kr.co.codemaker.teacher.course.exam.model.QuestionVO;

/**
 * 
* ExamServiceI.java
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
public interface ExamServiceI {

	/**
	 * 시험을 등록하는 메서드
	 * 
	 * @author 김미연
	 * @param examVo
	 * @return
	 */
	public String insertExam(ExamVO examVo);
	
	/**
	 * 시험문제를 등록하는 메서드
	 * 
	 * @author 김미연
	 * @param questionVo
	 * @return 
	 */
	public String insertQuestion(QuestionVO questionVo);
	
	/**
	 * 시험문제 보기를 등록하는 메서드
	 * 
	 * @author 김미연
	 * @param answersheetVo
	 * @return 
	 */
	public int insertAnswersheet(AnswersheetVO answersheetVo);

	/**
	 * 시험을 수정하는 메서드
	 * 
	 * @author 김미연
	 * @param examVo
	 * @return
	 */
	public int updateExam(ExamVO examVo);

	/**
	 * 시험문제를 수정하는 메서드
	 * 
	 * @author 김미연
	 * @param questionVo
	 * @return 
	 */
	public int updateQuestion(QuestionVO questionVo);
	
	/**
	 * 시험보기를 수정하는 메서드
	 * 
	 * @author 김미연
	 * @param answersheetVo
	 * @return 
	 */
	public int updateAnswersheet(AnswersheetVO answersheetVo);

	/**
	 * 자신이 출제한 시험 문제를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param examRequestVo
	 * @return
	 */
	public Map<String, Object> selectAllExam(ExamRequestVO examRequestVo);
	
	/**
	 * 해당 시험을 조회하는 메서드
	 * @param examVo
	 * @return 
	 */
	public ExamVO selectExam(ExamVO examVo);
	
	/**
	 * 해당 시험문제를 조회하는 메서드
	 * @param examVo
	 * @return 
	 */
	public List<QuestionVO> selectQuestion(ExamVO examVo);
	
	/**
	 * 해당 시험보기를 조회하는 메서드
	 * @param questionVo
	 * @return 
	 */
	public List<AnswersheetVO> selectAnswersheet(QuestionVO questionVo);

	/**
	 * 시험을 삭제하는 메서드
	 * 
	 * @author 김미연
	 * @param examVo
	 * @return
	 */
	public int deleteExam(ExamVO examVo);
	
}
