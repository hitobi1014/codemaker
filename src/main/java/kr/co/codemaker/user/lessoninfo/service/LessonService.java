package kr.co.codemaker.user.lessoninfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.user.lessoninfo.dao.LessonMapper;
import kr.co.codemaker.user.lessoninfo.vo.LessonVO;


@Service("userLessonService")
public class LessonService{
	
	@Resource(name="userLessonMapper")
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
