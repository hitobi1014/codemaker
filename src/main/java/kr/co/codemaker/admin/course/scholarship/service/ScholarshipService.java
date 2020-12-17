package kr.co.codemaker.admin.course.scholarship.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.admin.course.scholarship.dao.ScholarshipMapper;
import kr.co.codemaker.admin.course.scholarship.vo.PointVO;
import kr.co.codemaker.admin.course.scholarship.vo.ScholarshipVO;
import kr.co.codemaker.admin.course.scholarship.vo.SubjectVO;

/**
 * 
* ScholarshipService.java
*
* @author 김미연
* @version 1.0
* @since 2020. 12. 17.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
@Service("scholarshipService")
public class ScholarshipService {
	
	@Resource(name = "scholarshipMapper")
	private ScholarshipMapper scholarshipMapper;
	
	/**
	 * 과목을 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 * @throws Exception
	 */
	public List<SubjectVO> selectAllSubject(ScholarshipVO scholarshipVO) throws Exception {
		return scholarshipMapper.selectAllSubject(scholarshipVO);
	}
	
	/**
	 * 강의별로 장학금을 지급할 학생들을 조회하는 메서드 (간략 조회)
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	public List<ScholarshipVO> selectAllScholarshipCnt(ScholarshipVO scholarshipVO) throws Exception{
		return scholarshipMapper.selectAllScholarshipCnt(scholarshipVO);
	}
	
	/**
	 * 수강중인 학생들을 상세조회
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	public List<ScholarshipVO> selectCurAllLesson(ScholarshipVO scholarshipVO) throws Exception{
		return scholarshipMapper.selectCurAllLesson(scholarshipVO);
	}
	
	/**
	 * 완강한 학생들을 상세조회
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	public List<ScholarshipVO> selectLessonScholarship(ScholarshipVO scholarshipVO) throws Exception{
		return scholarshipMapper.selectLessonScholarship(scholarshipVO);
	}
	
	/**
	 * 완강한 학생들 중에서 모든 시험을 푼 학생들을 상세조회
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	public List<ScholarshipVO> selectExamScholarship(ScholarshipVO scholarshipVO) throws Exception{
		return scholarshipMapper.selectExamScholarship(scholarshipVO);
	}
	
	/**
	 * 장학금을 지급한 전체 목록 조회
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	public List<ScholarshipVO> selectAllScholarship(ScholarshipVO scholarshipVO) throws Exception{
		return scholarshipMapper.selectAllScholarship(scholarshipVO);
	}
	
	/**
	 * 장학금을 지급하는 메서드
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	public int insertScholarship(ScholarshipVO scholarshipVO) throws Exception{
		return scholarshipMapper.insertScholarship(scholarshipVO);
	}
	
	/**
	 * 장학금을 지급하는 메서드 -> 포인트
	 * 
	 * @author 김미연
	 * @param pointVO
	 * @return
	 */
	public int insertPoint(PointVO pointVO) throws Exception{
		return scholarshipMapper.insertPoint(pointVO);
	}

}
