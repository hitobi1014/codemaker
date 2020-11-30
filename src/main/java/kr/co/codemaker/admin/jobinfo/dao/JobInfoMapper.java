package kr.co.codemaker.admin.jobinfo.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.admin.jobinfo.vo.JobInfoVO;


/**
* JobInfoDaoI.java
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
@Mapper("jobInfoMapper")
public interface JobInfoMapper {
	/**
	 * 하나의 취업공고를 확인하기 위한 메서드
	 * @author 박경호
	 * @param job_id 취업 공고 아이디
	 * @return 하나의 취업 공고
	 */
	public JobInfoVO selectJobInfo(String jobInfoId);
	
	/**
	 * 모든 취업 공고를 조회하기 위한 메서드
	 * @author 박경호
	 * @return 취업 공고 리스트
	 */
	public List<JobInfoVO> selectAllJobInfo(Map<String, Object> map);
	
	/**
	 * 취업 공고의 수를 구하는 메세드
	 * @author 박경호
	 * @param map 가져갈 객체
	 * @return 취업 공고의 총 갯수
	 */
	public int jobInfoTotalCnt(Map<String, Object> map);
	
	/**
	 * 취업 공고를 추가하는 메서드
	 * @author 박경호
	 * @param jobInfoVo 하나의 취업공고
	 * @return 추가한 취업 공고의 갯수
	 */
	public int insertJobInfo(JobInfoVO jobInfoVo);
	
	/**
	 * 취업공고를 수정하기 위한 메서드
	 * @author 박경호
	 * @param jobInfoVo 수정하는 취업공고
	 * @return 수정한 취업 공고의 갯수
	 */
	public int updateJobInfo(JobInfoVO jobInfoVo);
	
	/**
	 * 취업공고를 삭제하는 메서드
	 * @author 박경호
	 * @param job_id 삭제할 취업공고 아이디
	 * @return 삭제된 취업공고 갯수
	 */
	public int deleteJobInfo(String jobInfoId);
}
