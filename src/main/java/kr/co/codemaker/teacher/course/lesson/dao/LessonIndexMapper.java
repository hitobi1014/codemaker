package kr.co.codemaker.teacher.course.lesson.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.teacher.course.lesson.vo.LessonIndexVO;

@Mapper("lessonIndexMapper")
public interface LessonIndexMapper {
	
	List<LessonIndexVO> selectLessonIndex(String lesId) throws Exception;
	
	int insertLessonIndex(LessonIndexVO lesIdxVO) throws Exception;
	

}
