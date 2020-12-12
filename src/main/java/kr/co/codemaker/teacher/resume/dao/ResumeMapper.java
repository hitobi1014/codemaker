package kr.co.codemaker.teacher.resume.dao;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.teacher.signup.vo.ResumeVO;

@Mapper("resumeMapper")
public interface ResumeMapper {
	
	/**
	 * 이력서 작성 메서드
	 * @param resumeVO
	 * @return
	 * @author 이은지
	 * @throws Exception
	 */
	public int insertResume(ResumeVO resumeVO) throws Exception;
	
}
