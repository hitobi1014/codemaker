package kr.co.codemaker.user.lessoninfo.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.user.lessoninfo.vo.LessonVO;

@Mapper("userLessonMapper")
public interface LessonMapper {
	List<LessonVO> selectLesson() throws Exception;

}
