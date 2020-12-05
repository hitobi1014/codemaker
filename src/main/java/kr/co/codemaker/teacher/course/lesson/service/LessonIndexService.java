package kr.co.codemaker.teacher.course.lesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.lesson.dao.LessonIndexMapper;
import kr.co.codemaker.teacher.course.lesson.dao.TeacherSubjectMapper;
import kr.co.codemaker.teacher.course.lesson.vo.LessonIndexVO;

@Service("lessonIndexService")
public class LessonIndexService {
	
	@Resource(name="lessonIndexMapper")
	private LessonIndexMapper lessonIndexMapper;
	
	public List<LessonIndexVO> selectLessonIndex(String lesId) throws Exception {
		
		try {
//			return lessonIndexMapper.selectLessonIndex(lesId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public int insertLessonIndex(LessonIndexVO lesIdxVO) throws Exception{
		return lessonIndexMapper.insertLessonIndex(lesIdxVO);
	}
	

}
