package kr.co.codemaker.teacher.course.lesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.lesson.dao.LessonDaoI;
import kr.co.codemaker.teacher.course.lesson.dao.LessonMapper;
import kr.co.codemaker.teacher.course.lesson.dao.SubjectMapper;
import kr.co.codemaker.teacher.course.lesson.vo.LessonVO;
import kr.co.codemaker.teacher.course.lesson.vo.SubjectVO;

@Service("lessonService")
public class LessonService{
	
	@Resource(name="lessonMapper")
	private LessonMapper lessonMapper;
	
	
	
	public List<LessonVO> selectLesson() {
		try {
			return lessonMapper.selectLesson();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	

//	@Override
//	public LessonVO selectLesson(String les_id) {
//		return lessonDao.selectLesson(les_id);
//	}
//	
//	@Override
//	public List<LessonVO> selectAllLesson() {
//		return lessonDao.selectAllLesson();
//	}
//
//	@Override
//	public int insertLesson(LessonVO lessonVO) {
//		return lessonDao.insertLesson(lessonVO);
//	}



}
