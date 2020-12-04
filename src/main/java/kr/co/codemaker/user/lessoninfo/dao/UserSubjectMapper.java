package kr.co.codemaker.user.lessoninfo.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.user.lessoninfo.vo.SubjectVO;

@Mapper("userSubjectMapper")
public interface UserSubjectMapper {
	
	List<SubjectVO> selectSubject() throws Exception;

}
