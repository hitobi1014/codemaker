package kr.co.codemaker.user.lessoninfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.user.lessoninfo.dao.SubjectMapper;
import kr.co.codemaker.user.lessoninfo.vo.SubjectVO;


@Service("userSubjectService")
public class SubjectService {
	
	@Resource(name="userSubjectMapper")
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
