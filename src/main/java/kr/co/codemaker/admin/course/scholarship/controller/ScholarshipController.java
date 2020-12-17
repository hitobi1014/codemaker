package kr.co.codemaker.admin.course.scholarship.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codemaker.admin.course.scholarship.service.ScholarshipService;
import kr.co.codemaker.admin.course.scholarship.vo.PointVO;
import kr.co.codemaker.admin.course.scholarship.vo.ScholarshipVO;
import kr.co.codemaker.admin.course.scholarship.vo.SubjectVO;


/**
 * 
* ScholarshipController.java
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
@Controller
public class ScholarshipController {
	
	// admin/scholarship
	
	@Resource(name = "scholarshipService")
	private ScholarshipService scholarshipService;
	
	/**
	 * 강의별로 장학금을 지급할 학생들을 조회하는 메서드 (간략 조회)
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	@RequestMapping(path = "scholarship/selectAllScholarship")
	public String selectAllScholarship(ScholarshipVO scholarshipVO, Model model) {
		List<ScholarshipVO> scholarshipList = new ArrayList<ScholarshipVO>();
		List<ScholarshipVO> scholarshipAList = new ArrayList<ScholarshipVO>();
		List<SubjectVO> subjectList = new ArrayList<>();
		
		try {
			scholarshipList = scholarshipService.selectAllScholarshipCnt(scholarshipVO);
			subjectList = scholarshipService.selectAllSubject(scholarshipVO);
			scholarshipAList = scholarshipService.selectAllScholarship(scholarshipVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("scholarshipList", scholarshipList);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("scholarshipAList", scholarshipAList);
		
		return "adminPage/admin/scholarship/scholarshipAllSelect";
	}
	
	/**
	 * 수강중인 학생들을 상세조회
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	@RequestMapping(path = "scholarship/selectCurAllLesson")
	public String selectCurAllLesson(ScholarshipVO scholarshipVO, Model model) {
		List<ScholarshipVO> scholarshipList = new ArrayList<ScholarshipVO>();
		try {
			scholarshipList = scholarshipService.selectCurAllLesson(scholarshipVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("scholarshipList", scholarshipList);
		
		return "adminPage/admin/scholarship/lessonCurSelect";
	}
	
	/**
	 * 완강한 학생들을 상세조회
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	@RequestMapping(path = "scholarship/selectLessonScholarship")
	public String selectLessonScholarship(ScholarshipVO scholarshipVO, Model model) {
		List<ScholarshipVO> scholarshipList = new ArrayList<ScholarshipVO>();
		try {
			scholarshipList = scholarshipService.selectLessonScholarship(scholarshipVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("scholarshipList", scholarshipList);
		
		return "adminPage/admin/scholarship/lessonSelect";
	}
	
	/**
	 * 완강한 학생들 중에서 모든 시험을 푼 학생들을 상세조회
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	@RequestMapping(path = "scholarship/selectExamScholarship")
	public String selectExamScholarship(ScholarshipVO scholarshipVO, Model model) {
		List<ScholarshipVO> scholarshipList = new ArrayList<ScholarshipVO>();
		try {
			scholarshipList = scholarshipService.selectExamScholarship(scholarshipVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("scholarshipList", scholarshipList);
		
		return "adminPage/admin/scholarship/examAllSelect";
	}
	
	/**
	 * 장학금을 지급하는 메서드
	 * 
	 * @author 김미연
	 * @param scholarshipVO
	 * @return
	 */
	@RequestMapping(path = "scholarship/insertScholarship")
	@ResponseBody
	public void insertScholarship(ScholarshipVO scholarshipVO) {
		try {
			// 완강한 회원 장학금 지급 -> 10만원
			if(scholarshipVO.getSchlState().equals("1")) {
				for(String userId :  scholarshipVO.getUserIdList()) {
					PointVO pointVO = new PointVO();
					pointVO.setUserId(userId);
					pointVO.setPointUpdate(100000);
					scholarshipService.insertPoint(pointVO);
					
					scholarshipVO.setSchlPay(100000);
					scholarshipVO.setSchlState("1");
					scholarshipVO.setUserId(userId);
					scholarshipService.insertScholarship(scholarshipVO);
				}
			}
			// 완강하고 시험평균도 일정 이상이 회원 지급 -> 15만원
			else if(scholarshipVO.getSchlState().equals("2")) {
				for(String userId :  scholarshipVO.getUserIdList()) {
					PointVO pointVO = new PointVO();
					pointVO.setUserId(userId);
					pointVO.setPointUpdate(200000);
					scholarshipService.insertPoint(pointVO);
					
					scholarshipVO.setSchlPay(200000);
					scholarshipVO.setSchlState("2");
					scholarshipVO.setUserId(userId);
					scholarshipService.insertScholarship(scholarshipVO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
