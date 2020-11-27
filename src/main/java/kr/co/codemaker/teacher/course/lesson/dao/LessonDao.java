package kr.co.codemaker.teacher.course.lesson.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.codemaker.model.LessonVO;
import kr.co.codemaker.teacher.course.lesson.controller.LessonController;

@Repository("lessonDao")
public class LessonDao implements LessonDaoI{
	private static final Logger logger = LoggerFactory.getLogger(LessonDao.class);

	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	@Override
	public LessonVO selectLesson(String les_id) {
		return sqlSession.selectOne("lesson.selectLesson",les_id);
	}

	@Override
	public List<LessonVO> selectAllLesson() {
		List<LessonVO> lessonList =  sqlSession.selectList("lesson.selectAllLesson");
		return lessonList;
	}

	@Override
	public int insertLesson(LessonVO lessonVO) {
		logger.debug("lessonVO다오!!!:{}", lessonVO);
		return sqlSession.insert("lesson.insertLesson",lessonVO);
	}



}
