package kr.co.codemaker.teacher.course.lesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.model.LessonVO;
import kr.co.codemaker.teacher.course.lesson.dao.LessonDaoI;

@Service("lessonService")
public class LessonService implements LessonServiceI{
	
	@Resource(name="lessonDao")
	private LessonDaoI lessonDao;

	@Override
	public LessonVO selectLesson(String les_id) {
		return lessonDao.selectLesson(les_id);
	}
	
	@Override
	public List<LessonVO> selectAllLesson() {
		return lessonDao.selectAllLesson();
	}

	@Override
	public int insertLesson(LessonVO lessonVO) {
		return lessonDao.insertLesson(lessonVO);
	}



}
