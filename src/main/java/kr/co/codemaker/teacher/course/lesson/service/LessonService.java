package kr.co.codemaker.teacher.course.lesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.lesson.dao.LessonDaoI;
import kr.co.codemaker.teacher.course.lesson.dao.LessonMapper;
import kr.co.codemaker.teacher.course.lesson.dao.SubjectMapper;
import kr.co.codemaker.teacher.course.lesson.vo.LessonIndexVO;
import kr.co.codemaker.teacher.course.lesson.vo.LessonVO;
import kr.co.codemaker.teacher.course.lesson.vo.SubjectVO;

@Service("lessonService")
public class LessonService{
	
	@Resource(name="lessonMapper")
	private LessonMapper lessonMapper;
	
	
	
	public List<LessonVO> selectLesson(String subId) {
		try {
			return lessonMapper.selectLesson(subId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<LessonVO> selectNoLesson(){
		try {
			return lessonMapper.selectNoLesson();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int deleteLesson(String lesId){
		
		try {
			return lessonMapper.deleteLesson(lesId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
}
