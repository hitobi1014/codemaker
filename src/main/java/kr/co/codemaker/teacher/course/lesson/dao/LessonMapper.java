package kr.co.codemaker.teacher.course.lesson.dao;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.teacher.course.lesson.vo.LessonVO;

@Mapper("lessonMapper")
public interface LessonMapper {
	LessonVO selectLesson() throws Exception;

}
