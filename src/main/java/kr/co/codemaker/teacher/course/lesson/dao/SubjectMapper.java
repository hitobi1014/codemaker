package kr.co.codemaker.teacher.course.lesson.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.teacher.course.lesson.vo.SubjectVO;

@Mapper("subjectMapper")
public interface SubjectMapper {
	
	List<SubjectVO> selectSubject() throws Exception;

}
