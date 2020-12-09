package kr.co.codemaker.admin.course.subject.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codemaker.admin.course.subject.service.AdminSubjectService;
import kr.co.codemaker.admin.course.subject.vo.SubjectVO;
import kr.co.codemaker.teacher.course.lesson.controller.TeacherLessonController;

/**
 * 
*
* @author 박다미
* @version 1.0
* @since 2020. 12. 8.
*
* 수정자 수정내용
* ------ ------------------------
* 박다미 최초 생성
*
 */
@Controller
public class AdminSubjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherLessonController.class);
	@Resource(name="adminSubjectService")
	private AdminSubjectService adminSubjectService;
	
	/**
	 * 관리자 - 과목 전체 조회
	 * @param model
	 * @return
	 */
	@RequestMapping(path="/admin/selectAllSubjcet")
	public String selectAllSubject(Model model) {
		SubjectVO subjectVO = new SubjectVO();
		List<SubjectVO> subList;
		
		try {
			subList = adminSubjectService.selectAllSubject(subjectVO);
			model.addAttribute("subList", subList);
			return "adminPage/admin/subject/subjectAllSelect";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 관리자 - 과목 등록
	 * @param subNm 과목명
	 * @return
	 */
	@RequestMapping(path="/admin/insertSubjcet")
	public String insertSubject(String subNm) {
		
		logger.debug("과목이름:{}",subNm);
		SubjectVO subjectVO = new SubjectVO();
		subjectVO.setSubNm(subNm);
		
		try {
			int cnt = adminSubjectService.insertSubjcet(subjectVO);
			if(cnt ==1 ) {
				return "redirect:/admin/selectAllSubjcet";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	

	@RequestMapping(path="/admin/updateSubject")
	public String updateSubject(SubjectVO subjectVO) {
//		SubjectVO subjectVO = new SubjectVO();
//		String subId, String subNm
		subjectVO.setSubId(subjectVO.getSubId());
		subjectVO.setSubNm(subjectVO.getSubNm());
		
		try {
			int cnt = adminSubjectService.updateSubject(subjectVO);
			if(cnt ==1) {
				return "redirect:/admin/selectAllSubjcet";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
