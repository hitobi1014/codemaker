package kr.co.codemaker.teacher.course.lesson.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.teacher.course.lesson.vo.LessonIndexVO;

@Mapper("lessonIndexMapper")
public interface LessonIndexMapper {
	
	List<LessonIndexVO> selectLessonIndex(String lesId) throws Exception;	// 강의목차 조회
	
	int insertLessonIndex(LessonIndexVO lesIdxVO) throws Exception;	// 강의목차 등록
	
	int updateLessonIndex(LessonIndexVO lesIdxVO) throws Exception;		// 강의목차 수정
	
	int deleteLessonIndex(LessonIndexVO lesIdxVO) throws Exception;		// 강의목차 삭제
	

}
