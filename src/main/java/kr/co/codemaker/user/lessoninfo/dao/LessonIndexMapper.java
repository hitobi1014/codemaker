package kr.co.codemaker.user.lessoninfo.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.user.lessoninfo.vo.LessonIndexVO;

@Mapper("userLessonIndexMapper")
public interface LessonIndexMapper {
	
	List<LessonIndexVO> selectLessonIndex(LessonIndexVO lessonIndexVO) throws Exception;	// 강의목차 조회
	
	int updateLessonIndex(LessonIndexVO lessonIndexVO) throws Exception; //강의목차 수정(진행률)
	

}
