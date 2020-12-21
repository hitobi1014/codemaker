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
import kr.co.codemaker.admin.course.lesson.vo.ExamVO;
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
	
	/**
	 * 등록된 요청을 전체조회하는 메서드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping("/admin/selectAllAgree")
	public String selectAgreeCnt(LessonVO lessonVO, Model model){
		List<LessonVO> lessonList = new ArrayList<>();
		try {
			lessonList = adminLessonService.selectAgreeCnt(lessonVO);
			
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
			lessonList = adminLessonService.selectAgreeCnt(lessonVO);
			
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
			ExamVO examVO = new ExamVO();
			try {
				lessonVO.setLesState(lesState);
				lessonVO.setLesId(lesId);
				adminLessonService.updateLesson(lessonVO);
				
				examVO.setLesId(lesId);
				adminLessonService.updateExam(examVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin/selectAllAgree";
	}

}
