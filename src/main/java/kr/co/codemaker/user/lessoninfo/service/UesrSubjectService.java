package kr.co.codemaker.user.lessoninfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.user.lessoninfo.dao.UserSubjectMapper;
import kr.co.codemaker.user.lessoninfo.vo.SubjectVO;


@Service("userSubjectService")
public class UesrSubjectService {
	
	@Resource(name="userSubjectMapper")
	private UserSubjectMapper subjectMapper;
	
	
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
