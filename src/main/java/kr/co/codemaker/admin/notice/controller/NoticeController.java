package kr.co.codemaker.admin.notice.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.codemaker.admin.notice.service.NoticeServiceI;
import kr.co.codemaker.model.NoticeVO;


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
@RequestMapping(path="/admin/notice")
public class NoticeController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Resource(name="noticeService")
	private NoticeServiceI noticeService;
	
	@RequestMapping(path="/selectAllNotice")
	public String selectAllNotice(@RequestParam(name="page", required = false, defaultValue = "1") int page, 
			@RequestParam(name="pageSize", required = false, defaultValue = "5") int pageSize, 
			String searchOption, String keyWord, Model model, HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("pageSize", pageSize);
		map.put("searchOption", searchOption);
		map.put("keyWord", keyWord);
		map.put("pages", map.get("pages"));
		
		session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyWord", keyWord);
		
		logger.debug("map {}", map);
		
		Map<String, Object> map2 = noticeService.selectAllNotice(map);
		
		logger.debug("map2 {}", map2);
		
		model.addAttribute("noticeList", map2.get("noticeList"));
		model.addAttribute("pages", map2.get("pages"));
		model.addAttribute("page", map2.get("page"));
		model.addAttribute("pageSize", pageSize);
		
		return "admin/notice/noticeList";
	}
	
	@RequestMapping(path="/selectNotice")
	public String selectNotice(String notice_id, Model model) {
		
		NoticeVO noticeVo = noticeService.selectNotice(notice_id);
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "admin/notice/notice";
	}
	
	
	@RequestMapping(path="/insertNotice", method={RequestMethod.GET})
	public String insertViewNotice() {
		
		return "admin/notice/noticeInsert";
	}
	
	@RequestMapping(path="/insertNotice", method={RequestMethod.POST})
	public String insertNotice(NoticeVO noticeVo) {
		
		
		int cnt = noticeService.insertNotice(noticeVo);
		if(cnt == 1) {
			return "redirect:admin/notice/selectAllNotice";
		}else {
			return "admin/notice/noticeInsert";
		}
	}
	
	@RequestMapping(path="/updateNotice", method={RequestMethod.GET})
	public String updateViewNotice(NoticeVO noticeVo, Model model) {
		
		NoticeVO noticeVo2 = noticeService.selectNotice(noticeVo.getNotice_id());
		
		model.addAttribute("noticeVo", noticeVo2);
		
		return "admin/notice/noticeUpdate";
	}
	
	@RequestMapping(path="/updateNotice", method= {RequestMethod.POST})
	public String updateNotice(NoticeVO noticeVo) {
		
		int cnt = noticeService.updateNotice(noticeVo);
		
		if(cnt == 1) {
			return "redirect:admin/notice/selectNotice?notice_id="+noticeVo.getNotice_id();
		}else {
			return "admin/notice/noticeUpdate";
		}
	}
	
	@RequestMapping(path="/deleteNotice")
	public String deleteNotice(String notice_id) {
		
		noticeService.deleteNotice(notice_id);
		
		return "redirect:admin/notice/selectAllNotice";
		
	}
}
