package kr.co.codemaker.teacher.resume.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.teacher.resume.dao.ResumeMapper;
import kr.co.codemaker.teacher.signup.vo.ResumeVO;

@Service("resumeService")
public class ResumeService {
	
	@Resource(name="resumeMapper")
	private ResumeMapper resumeMapper;
	
	/**
	 * 이력서 작성 메서드
	 * @param resumeVO
	 * @return
	 * @throws Exception
	 */
	public int insertResume(ResumeVO resumeVO) throws Exception{
		return resumeMapper.insertResume(resumeVO);
	}
}
