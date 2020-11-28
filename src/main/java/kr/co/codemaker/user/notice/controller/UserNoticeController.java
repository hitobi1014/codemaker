package kr.co.codemaker.user.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.codemaker.common.notice.service.NoticeServiceI;
import kr.co.codemaker.common.service.FilesServiceI;
import kr.co.codemaker.fileUpload.FileUploadUtil;
import kr.co.codemaker.model.FilesVO;
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
@RequestMapping(path="/userNotice")
public class UserNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserNoticeController.class);
	
	@Resource(name="noticeService")
	private NoticeServiceI noticeService;
	
	@Resource(name="filesService")
	private FilesServiceI filesService;
	
	@RequestMapping(path="/selectAllNotice")
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
		
		Map<String, Object> map2 = noticeService.selectAllNotice(map);
		
		logger.debug("map2 {}", map2);
		
		model.addAttribute("noticeList", map2.get("noticeList"));
		model.addAttribute("pages", map2.get("pages"));
		model.addAttribute("page", map2.get("page"));
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyWord", keyWord);
 		
		return "mainT/user/notice/noticeList";
	}
	
	@RequestMapping(path="/selectNotice")
	public String selectNotice(String noticeId, Model model) {
		
		NoticeVO noticeVo = noticeService.selectNotice(noticeId);
		
		List<FilesVO> filesList = filesService.selectAllFiles(noticeId);	
		
		model.addAttribute("noticeVo", noticeVo);
		model.addAttribute("filesList", filesList);
		
		return "mainT/user/notice/notice";
	}
	
}
