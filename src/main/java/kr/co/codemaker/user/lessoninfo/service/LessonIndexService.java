package kr.co.codemaker.user.lessoninfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.user.lessoninfo.dao.LessonIndexMapper;
import kr.co.codemaker.user.lessoninfo.vo.LessonIndexVO;

@Service("userLessonIndexService")
public class LessonIndexService {
	
	@Resource(name="userLessonIndexMapper")
	private LessonIndexMapper lessonIndexMapper;
	
	public List<LessonIndexVO> selectLessonIndex(String lesId) {
		
		try {
			return lessonIndexMapper.selectLessonIndex(lesId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	

}
