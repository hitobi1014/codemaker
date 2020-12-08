package kr.co.codemaker.admin.course.subject.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.admin.course.subject.vo.SubjectVO;

@Mapper("adminSubjectMapper")
public interface AdminSubjectMapper {
	List<SubjectVO> selectAllSubject(SubjectVO subjectVO) throws Exception;		// 과목 전체 조회
	
	int insertSubject(SubjectVO subjectVO) throws Exception;	// 과목 등록
	
	int updateSubject(SubjectVO subjectVO) throws Exception; 	// 과목 수정

	
	

}
