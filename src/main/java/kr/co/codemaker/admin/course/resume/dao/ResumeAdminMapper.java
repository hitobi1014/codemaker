package kr.co.codemaker.admin.course.resume.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.teacher.signup.vo.ResumeVO;

@Mapper("resumeAdminMapper")
public interface ResumeAdminMapper {
	
	List<ResumeVO> selectAllResume(ResumeVO resumeVO) throws Exception;
	
	ResumeVO getAllResume(ResumeVO resumeVO) throws Exception;
	
	ResumeVO updateResume(ResumeVO resumeVO) throws Exception;
}
