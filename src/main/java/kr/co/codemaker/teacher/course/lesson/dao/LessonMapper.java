package kr.co.codemaker.teacher.course.lesson.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.teacher.course.lesson.vo.LessonIndexVO;
import kr.co.codemaker.teacher.course.lesson.vo.LessonVO;

@Mapper("lessonMapper")
public interface LessonMapper {
	List<LessonVO> selectLesson(String subId) throws Exception;		// 과목에 대한 강의 조회
	
	List<LessonVO> selectNoLesson() throws Exception;		// 해당강의에 대한 강의목차 조회
	
	int deleteLesson(String lesId) throws Exception;		// 강의 삭제

}
