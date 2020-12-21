package kr.co.codemaker.user.lessoninfo.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.user.lessoninfo.vo.IndexTimeVO;
import kr.co.codemaker.user.lessoninfo.vo.LessonIndexVO;

@Mapper("userLessonIndexMapper")
public interface LessonIndexMapper {
	
	List<LessonIndexVO> selectLessonIndex(LessonIndexVO lessonIndexVO) throws Exception; //강의목차 조회
	
	int updateLessonIndex(LessonIndexVO lessonIndexVO) throws Exception; //강의목차 수정(진행률)
	
	int insertIndexTime(IndexTimeVO indexTimeVO) throws Exception; 	// 강의 재생시간 추가
	
	List<IndexTimeVO> selectCurTime(IndexTimeVO indexTimeVO) throws Exception; 	// 강의 재생시간 조회
	
	List<IndexTimeVO> selectLidxId(IndexTimeVO indexTimeVO) throws Exception; 	// 회원이 구매한 강의 목차 조회
	
	int updateIndexTime(IndexTimeVO indexTimeVO) throws Exception;		// 강의 재생시간 수정

}
