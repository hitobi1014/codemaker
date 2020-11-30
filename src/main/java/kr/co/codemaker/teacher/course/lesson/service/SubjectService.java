package kr.co.codemaker.teacher.course.lesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.course.lesson.dao.SubjectMapper;
import kr.co.codemaker.teacher.course.lesson.vo.SubjectVO;

@Service("subjectService")
public class SubjectService {
	
	@Resource(name="subjectMapper")
	private SubjectMapper subjectMapper;
	
	
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
