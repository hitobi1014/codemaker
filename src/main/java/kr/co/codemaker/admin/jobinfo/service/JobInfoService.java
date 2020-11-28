package kr.co.codemaker.admin.jobinfo.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.codemaker.admin.jobinfo.dao.JobInfoDaoI;
import kr.co.codemaker.common.notice.service.NoticeService;
import kr.co.codemaker.model.JobInfoVO;

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
	
	private static final Logger log = LoggerFactory.getLogger(JobInfoService.class);

	@Resource(name="jobInfoDao")
	private JobInfoDaoI jobInfoDao;

	@Override
	public Map<String, Object> selectAllJobInfo(Map<String, Object> map) {
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("noticeList", jobInfoDao.selectAllJobInfo(map));
		log.debug("탐탐탐?2");
		// 15건, 페이지사이즈를 7로 가정했을때 3개의 페이지가 나와야한다
		// 15/7 = 2.14... 올림을 하여 3개의 페이지가 필요
		
		int cnt = jobInfoDao.jobInfoTotalCnt(map);
		
		
		int pages =(int) Math.ceil((double)cnt/(int) map.get("pageSize"));
		map2.put("pages", pages); 
		return map2;
	}

	@Override
	public JobInfoVO selectJobInfo(String jobInfo_id) {
		return jobInfoDao.selectJobInfo(jobInfo_id);
	}

	@Override
	public int insertJobInfo(JobInfoVO jobInfoVo) {
		return jobInfoDao.insertJobInfo(jobInfoVo);
	}

	@Override
	public int updateJobInfo(JobInfoVO jobInfoVo) {
		return jobInfoDao.updateJobInfo(jobInfoVo);
	}

	@Override
	public int deleteJobInfo(String jobInfo_id) {
		return jobInfoDao.deleteJobInfo(jobInfo_id);
	}

}
