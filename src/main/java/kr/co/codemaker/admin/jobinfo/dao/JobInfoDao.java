package kr.co.codemaker.admin.jobinfo.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.codemaker.model.JobInfoVO;


/**
* JobInfoDao.java
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
@Repository("jobInfoDao")
public class JobInfoDao implements JobInfoDaoI {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public JobInfoVO selectJobInfo(String job_id) {
		return sqlSession.selectOne("jobInfo.selectJobInfo", job_id);
	}

	@Override
	public List<JobInfoVO> selectAllJobInfo() {
		return sqlSession.selectList("jobInfo.selectAllJobInfo");
	}

}
