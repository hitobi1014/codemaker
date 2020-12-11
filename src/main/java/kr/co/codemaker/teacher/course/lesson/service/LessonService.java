package kr.co.codemaker.teacher.course.lesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.lesson.dao.LessonMapper;
import kr.co.codemaker.teacher.course.lesson.dao.TeacherSubjectMapper;
import kr.co.codemaker.teacher.course.lesson.vo.LessonIndexVO;
import kr.co.codemaker.teacher.course.lesson.vo.LessonVO;
import kr.co.codemaker.teacher.course.lesson.vo.SubjectVO;

@Service("lessonService")
public class LessonService{
	
	@Resource(name="lessonMapper")
	private LessonMapper lessonMapper;
	
	
	
	public List<LessonVO> selectLesson(LessonVO lessonVO) throws Exception{
		return lessonMapper.selectLesson(lessonVO);
	}
	
	public List<LessonVO> selectNoLesson(String tchId) throws Exception{
		return lessonMapper.selectNoLesson(tchId);
	}
	
	public LessonVO selectDetailLesson(LessonVO lessonVO) throws Exception{
		return lessonMapper.selectDetailLesson(lessonVO);
	}

	public int deleteLesson(String lesId) throws Exception{
		return lessonMapper.deleteLesson(lesId);
	}
	
	public int insertLesson(LessonVO lessonVO) throws Exception{
		return lessonMapper.insertLesson(lessonVO);
	}
	
	public int updateLesson(LessonVO lessonVO) throws Exception{
		return lessonMapper.updateLesson(lessonVO);
	}
	
	public int updateTempoLesson(LessonVO lessonVO) throws Exception{
		return lessonMapper.updateTempoLesson(lessonVO);
	}
	
}
