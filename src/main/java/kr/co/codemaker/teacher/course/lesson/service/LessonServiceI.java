package kr.co.codemaker.teacher.course.lesson.service;

import java.util.List;

import kr.co.codemaker.model.LessonVO;

public interface LessonServiceI {
	
	LessonVO selectLesson(String les_id);	// 강의VO 조회
	
	List<LessonVO> selectAllLesson();		// 강의 List 조회
	
	int insertLesson(LessonVO lessonVO);	// 강의 추가

}
