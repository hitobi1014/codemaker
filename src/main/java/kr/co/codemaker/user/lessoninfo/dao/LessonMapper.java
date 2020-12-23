package kr.co.codemaker.user.lessoninfo.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.user.lessoninfo.vo.LessonVO;

/**
 * UserLessonController.java
*
* @author 박다미
* @version 1.0
* @since 2020. 12. 19.
*
* 수정자 수정내용
* ------ ------------------------
* 박다미 최초 생성
*
 */
@Mapper("userLessonMapper")
public interface LessonMapper {
	/**
	 * 강의 리스트 조회
	 * @return
	 * @throws Exception
	 */
	List<LessonVO> selectLesson() throws Exception;
	
	/**
	 * 강의 VO 조회
	 * @param lessonVO 
	 * @return
	 * @throws Exception
	 */
	LessonVO selectDetailLesson(LessonVO lessonVO) throws Exception;	

}
