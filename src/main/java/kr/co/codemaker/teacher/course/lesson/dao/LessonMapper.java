package kr.co.codemaker.teacher.course.lesson.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.teacher.course.lesson.vo.LessonVO;

@Mapper("lessonMapper")
public interface LessonMapper {
	List<LessonVO> selectLesson(String subId) throws Exception;

}
