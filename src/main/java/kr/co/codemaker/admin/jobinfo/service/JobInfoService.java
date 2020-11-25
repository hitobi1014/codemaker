package kr.co.codemaker.admin.jobinfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.admin.jobinfo.dao.JobInfoDaoI;
import kr.co.codemaker.admin.jobinfo.model.JobInfoVO;

/**
* JobInfoService.java
*
* @author 박경호
* @version 1.0
* @since 2020. 11. 25.
*
* 수정자 수정내용
* ------ ------------------------
* 박경호 최초 생성
*
 */
@Service("jobInfoService")
public class JobInfoService implements JobInfoServiceI {

	@Resource(name="jobInfoDao")
	private JobInfoDaoI jobInfoDao;
	
	@Override
	public JobInfoVO selectJobInfo(String job_id) {
		return jobInfoDao.selectJobInfo(job_id);
	}

	@Override
	public List<JobInfoVO> selectAllJobInfo() {
		return jobInfoDao.selectAllJobInfo();
	}

}
