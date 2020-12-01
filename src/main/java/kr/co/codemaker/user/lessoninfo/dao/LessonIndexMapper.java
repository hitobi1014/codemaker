package kr.co.codemaker.user.lessoninfo.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.user.lessoninfo.vo.LessonIndexVO;

@Mapper("userLessonIndexMapper")
public interface LessonIndexMapper {
	
	List<LessonIndexVO> selectLessonIndex(String lesId) throws Exception;
	

}
