package kr.co.codemaker.teacher.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.codemaker.common.notice.service.NoticeService;
import kr.co.codemaker.common.service.FilesService;
import kr.co.codemaker.common.vo.FilesVO;
import kr.co.codemaker.common.vo.NoticeVO;


/**
* NoticeController.java
*
* @author 박경호
* @version 1.0
* @since 2020. 11. 24.
*
* 수정자 수정내용
* ------ ------------------------
* 박경호 최초 생성
*
 */
@Controller
public class TeacherNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherNoticeController.class);
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@Resource(name="filesService")
	private FilesService filesService;
	
	@RequestMapping(path="/teacher/selectAllNotice")
	public String selectAllNotice(@RequestParam(name="page", required = false, defaultValue = "1") int page, 
			@RequestParam(name="pageSize", required = false, defaultValue = "10") int pageSize, 
			String searchOption, String keyWord, Model model) {	
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("pageSize", pageSize);
		map.put("searchOption", searchOption);
		map.put("keyWord", keyWord);
		map.put("pages", map.get("pages"));
		
		
		logger.debug("map {}", map);
		
		Map<String, Object> map2 = new HashMap<>();
		try {
			map2 = noticeService.selectAllNotice(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.debug("map2 {}", map2);
		
		model.addAttribute("noticeList", map2.get("noticeList"));
		model.addAttribute("pages", map2.get("pages"));
		model.addAttribute("page", map2.get("page"));
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyWord", keyWord);
 		
		return "teacherPage/teacher/notice/noticeList";
	}
	
	@RequestMapping(path="/teacher/selectNotice")
	public String selectNotice(String notice_id, Model model) {
		
		NoticeVO noticeVo = new NoticeVO();
		try {
			noticeVo = noticeService.selectNotice(notice_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<FilesVO> filesList = filesService.selectAllFiles(notice_id);	
		
		model.addAttribute("noticeVo", noticeVo);
		model.addAttribute("filesList", filesList);
		
		return "teacherPage/teacher/notice/notice";
	}
	
}
