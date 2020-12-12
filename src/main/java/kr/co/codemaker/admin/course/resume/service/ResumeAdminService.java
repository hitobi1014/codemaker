package kr.co.codemaker.admin.course.resume.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.admin.course.resume.dao.ResumeAdminMapper;
import kr.co.codemaker.teacher.signup.vo.ResumeVO;

@Service("resumeAdminService")
public class ResumeAdminService {
	
	@Resource(name="resumeAdminMapper")
	private ResumeAdminMapper resumeAdminMapper;
	
	public List<ResumeVO> selectAllResume() throws Exception{
		return resumeAdminMapper.selectAllResume();
	}
	
	public ResumeVO getAllResume(ResumeVO resumeVO) throws Exception{
		return resumeAdminMapper.getAllResume(resumeVO);
	}
		
	public ResumeVO updateResume(ResumeVO resumeVO) throws Exception{
		return resumeAdminMapper.updateResume(resumeVO);
	}
}
