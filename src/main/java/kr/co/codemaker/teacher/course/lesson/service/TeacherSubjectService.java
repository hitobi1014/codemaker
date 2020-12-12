package kr.co.codemaker.teacher.course.lesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.lesson.dao.TeacherSubjectMapper;
import kr.co.codemaker.teacher.course.lesson.vo.SubjectVO;

@Service("TeacherSubjectService")
public class TeacherSubjectService {
	
	@Resource(name="TeacherSubjectMapper")
	private TeacherSubjectMapper subjectMapper;
	
	
	public List<SubjectVO> selectSubject(){
		try {
			return subjectMapper.selectSubject();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	

	
}
