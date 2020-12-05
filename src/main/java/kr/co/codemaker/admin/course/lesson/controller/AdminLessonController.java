package kr.co.codemaker.admin.course.lesson.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codemaker.admin.course.lesson.service.AdminLessonService;
import kr.co.codemaker.admin.course.lesson.vo.LessonIndexVO;
import kr.co.codemaker.admin.course.lesson.vo.LessonVO;
import kr.co.codemaker.admin.course.lesson.vo.SubjectVO;

/**
 * 
* AdminLessonController.java
*
* @author 김미연
* @version 1.0
* @since 2020. 12. 4.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
@Controller
public class AdminLessonController {

	@Resource(name = "adminLessonService")
	private AdminLessonService adminLessonService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminLessonController.class);
	
	/**
	 * 등록된 요청을 전체조회하는 메서드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping("/admin/selectAllAgree")
	public String selectAgreeCnt(Model model){
		List<LessonVO> lessonList = new ArrayList<>();
		try {
			lessonList = adminLessonService.selectAgreeCnt();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("lessonList", lessonList);
		
		return "adminPage/admin/lesson/lessonAllSelect";
	}
	
	/**
	 * 등록된 요청을 상세조회하는 메서드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping("/admin/selectAllLesson")
	public String selectAllLesson(LessonVO lessonVO, Model model){
		List<LessonVO> lessonLists = new ArrayList<>();
		List<LessonVO> lessonList = new ArrayList<>();
		
		try {
			lessonLists = adminLessonService.selectAllLesson(lessonVO);
			lessonList = adminLessonService.selectAgreeCnt();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("lessonList", lessonList);
		model.addAttribute("lessonLists", lessonLists);
		
		return "adminPage/admin/lesson/lessonAllSelect";
	}
	
	/**
	 * 강의를 상세조회하는 메서드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping("/admin/lessonSelect")
	public String selectLesson(LessonVO lessonVO, Model model) {
		
		try {
			lessonVO = adminLessonService.selectLesson(lessonVO);
			List<LessonIndexVO> lessonIndexList = adminLessonService.selectLessonIndex(lessonVO);
			
			lessonVO.setLessonIndexList(lessonIndexList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("lessonVO", lessonVO);
		
		return "admin/lesson/lessonSelect";
	}
	
	/**
	 * 해당 강의의 상태를 변경하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	@RequestMapping("/admin/updateLesson")
	public String updateLesson(@RequestParam(value="lesIds")List<String> lesIds, String lesState) {
		
		for(String lesId : lesIds) {
			LessonVO lessonVO = new LessonVO();
			try {
				lessonVO.setLesState(lesState);
				lessonVO.setLesId(lesId);
				adminLessonService.updateLesson(lessonVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin/selectAllAgree";
	}
	

//	/**
//	 * 등록된 전체 과목을 조회하는 메서드
//	 * 
//	 * @author 김미연
//	 * @return
//	 */
//	@RequestMapping("/admin/selectAllSubject")
//	public String selectAllSubject(Model model) {
//		List<SubjectVO> subjectList = new ArrayList<SubjectVO>();
//		
//		LessonVO lessonVO = new LessonVO();
//		lessonVO.setPage(1);
//		
//		List<LessonVO> lessonList = new ArrayList<>();
//		int totalCnt = 0;
//		
//		try {
//			subjectList = adminLessonService.selectAllSubject();
//			lessonList = adminLessonService.selectAllLesson(lessonVO);
//			totalCnt = adminLessonService.selectTotalCntLesson(lessonVO);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		model.addAttribute("subjectList", subjectList);
//		model.addAttribute("subjectVO", new SubjectVO());
//		
//		int pages = (int) Math.ceil((double) totalCnt / 3);
//		
//		lessonVO.setEndPage(pages);
//		lessonVO.setStartPage(1);
//		
//		model.addAttribute("lessonList", lessonList);
//		model.addAttribute("pages", pages);
//		model.addAttribute("lessonVO", lessonVO);
//		
//		return "admin/lesson/lessonAllSelect";
//	}
//	
//	/**
//	 * 등록된 전체 강의를 조회하는 메서드 - 페이징 포함
//	 * 
//	 * @author 김미연
//	 * @return
//	 */
//	@RequestMapping("/admin/selectAllPageLesson")
//	public String selectAllPageLesson(LessonVO lessonVO, Model model) {
//		if(lessonVO.getPage() == 0) {
//			lessonVO.setPage(1);
//		}
//		
//		List<LessonVO> lessonList = new ArrayList<>();
//		int totalCnt = 0;
//		
//		try {
//			lessonList = adminLessonService.selectAllLesson(lessonVO);
//			totalCnt = adminLessonService.selectTotalCntLesson(lessonVO);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		int pages = (int) Math.ceil((double) totalCnt / 3);
//		
//		lessonVO.setEndPage(pages);
//		lessonVO.setStartPage(1);
//		
//		model.addAttribute("lessonList", lessonList);
//		model.addAttribute("pages", pages);
//		model.addAttribute("lessonVO", lessonVO);
//		
//		return "admin/lesson/lessonSelectAllPage";
//	}
//
//	/**
//	 * 선택한 과목에 해당하는 강의를 조회하는 메서드
//	 * 
//	 * @author 김미연
//	 * @param subjectVO
//	 * @return
//	 */
//	@RequestMapping("/admin/selectLesson")
//	public String selectLesson(SubjectVO subjectVO, Model model) {
//		
//		List<LessonVO> lessonList =  new ArrayList<LessonVO>();
//		
//		try {
//			lessonList = adminLessonService.selectLesson(subjectVO);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		model.addAttribute("lessonVO", new LessonVO());
//		model.addAttribute("lessonList", lessonList);
//		
//		return "admin/lesson/lessonSelect";
//	}
//	
//	/**
//	 * 강의 승인상태에 따라 조회하는 메서드
//	 * 
//	 * @author 김미연
//	 * @param lessonVO
//	 * @return
//	 */
//	public String selectStateLesson(LessonVO lessonVO, Model model) {
//		if(lessonVO.getPage() == 0) {
//			lessonVO.setPage(1);
//		}
//		
//		int totalCnt = 0;
//		List<LessonVO> lessonList = new ArrayList<>();
//		
//		try {
//			lessonList = adminLessonService.selectStateLesson(lessonVO);
////			totalCnt = 
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		int pages = (int) Math.ceil((double) totalCnt / 3);
//		
//		lessonVO.setEndPage(pages);
//		lessonVO.setStartPage(1);
//		
//		model.addAttribute("lessonList", lessonList);
//		model.addAttribute("pages", pages);
//		model.addAttribute("lessonVO", lessonVO);
//
//		return "";
//	}
//
//
//	/**
//	 * 선택한 강의에 해당하는 강의목차를 조회하는 메서드
//	 * 
//	 * @author 김미연
//	 * @param lessonVO
//	 * @return
//	 */
//	@RequestMapping("/admin/selectLessonIndex")
//	public String selectLessonIndex(LessonVO lessonVO, Model model) {
//		List<LessonIndexVO> lessonIndexList =  new ArrayList<LessonIndexVO>();
//		int totalCnt = 0;
//		
//		if (lessonVO.getPage() == 0) {
//			lessonVO.setPage(1);
//		}
//		
//		try {
//			lessonIndexList = adminLessonService.selectLessonIndex(lessonVO);
//			totalCnt = adminLessonService.selectTotalCntLesIdx(lessonVO);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		int pages = (int) Math.ceil((double) totalCnt / 1);
//		
//		lessonVO.setEndPage(pages);
//		lessonVO.setStartPage(1);
//		
//		model.addAttribute("pages", pages);
//		model.addAttribute("lessonVO", lessonVO);
//		model.addAttribute("lessonIndexList", lessonIndexList);
//		
//		return "admin/lesson/lessonIndexSelect";
//	}
//

}
