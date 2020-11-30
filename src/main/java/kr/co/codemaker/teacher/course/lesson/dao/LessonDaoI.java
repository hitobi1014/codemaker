package kr.co.codemaker.teacher.course.lesson.dao;

import java.util.List;

import kr.co.codemaker.teacher.course.lesson.vo.LessonVO;


public interface LessonDaoI {
	LessonVO selectLesson(String les_id);	// 강의VO 조회
	
	List<LessonVO> selectAllLesson();		// 강의 List 조회
	
	int insertLesson(LessonVO lessonVO);	// 강의 추가
}
