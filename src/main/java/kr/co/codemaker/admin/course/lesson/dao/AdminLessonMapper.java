package kr.co.codemaker.admin.course.lesson.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.admin.course.lesson.vo.LessonIndexVO;
import kr.co.codemaker.admin.course.lesson.vo.LessonVO;
import kr.co.codemaker.admin.course.lesson.vo.SubjectVO;

/**
 * 
* AdminLessonMapper.java
*
* @author 김미연
* @version 1.0
* @since 2020. 12. 4.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
@Mapper("adminLessonMapper")
public interface AdminLessonMapper {
	
	/**
	 * 등록된 전체 과목을 조회하는 메서드
	 * 
	 * @author 김미연
	 * @return
	 */
	public List<SubjectVO> selectAllSubject() throws Exception;
	
	/**
	 * 선택한 과목에 해당하는 강의를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param subjectVO
	 * @return
	 */
	public List<LessonVO> selectLesson(SubjectVO subjectVO) throws Exception;
	
	/**
	 * 전체 강의를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	public List<LessonVO> selectAllLesson(LessonVO lessonVO) throws Exception;
	
	/**
	 * 선택한 강의에 해당하는 강의 수를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	public int selectTotalCntLesson(LessonVO lessonVO) throws Exception;
	
	/**
	 * 선택한 강의에 해당하는 강의목차를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	public List<LessonIndexVO> selectLessonIndex(LessonVO lessonVO) throws Exception;
	
	/**
	 * 선택한 강의에 해당하는 강의목차의 수를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	public int selectTotalCntLesIdx(LessonVO lessonVO) throws Exception;
	
	/**
	 * 해당 강의의 상태를 변경하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	public int updateLesson(LessonVO lessonVO) throws Exception;
	
	

}
