package kr.co.codemaker.admin.notice.controller;

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
@RequestMapping(path="/adminNotice")
public class AdminNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
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
 		
		return "admin/notice/noticeList";
	}
	
	@RequestMapping(path="/selectNotice")
	public String selectNotice(String notice_id, Model model) {
		
		NoticeVO noticeVo = noticeService.selectNotice(notice_id);
		
		List<FilesVO> filesList = filesService.selectAllFiles(notice_id);	
		
		model.addAttribute("noticeVo", noticeVo);
		model.addAttribute("filesList", filesList);
		
		return "admin/notice/notice";
	}
	
	
	@RequestMapping(path="/insertNotice", method={RequestMethod.GET})
	public String insertViewNotice() {
		
		return "admin/notice/noticeInsert";
	}
	
	@RequestMapping(path="/insertNotice", method={RequestMethod.POST})
	public String insertNotice(NoticeVO noticeVo, MultipartHttpServletRequest files) {
	 	
		List<MultipartFile> filesList = files.getFiles("realfile");
		
		int cnt = noticeService.insertNotice(noticeVo);
		
		logger.debug("파일 전 cnt {}", cnt);
		
		for(int i = 0; i < filesList.size(); i++) {
			MultipartFile profile = filesList.get(i);
			
			String files_nm = profile.getOriginalFilename();
			if(profile != null && !profile.equals("")) {
				
				String ext = FileUploadUtil.getExtenstion(files_nm);
				String fileName = UUID.randomUUID().toString();
				String files_path = "";
				
				if (profile.getSize() > 0) {
					files_path = "D:\\profile\\" + fileName + "." + ext;
					File file = new File("D:\\profile\\" + files_nm);
					try {
						profile.transferTo(file);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					FilesVO filesVo = new FilesVO();
					
					String files_id = "1426";
					
					filesVo.setFiles_gn(noticeVo.getNoticeId());
					filesVo.setFiles_nm(files_nm);
					filesVo.setFiles_path(files_path);
					filesVo.setFiles_id(files_id);
					
					logger.debug("filesVo {}", filesVo);
					
					filesService.insertFiles(filesVo);
					
					logger.debug("파일 후 cnt {}", cnt);
				}
			}
		}
		logger.debug("파일 후 cnt {}", cnt);
		
		if(cnt == 1) {
			return "redirect:selectAllNotice";
		}else {
			return "admin/notice/noticeInsert";
		}
	}
	
	@RequestMapping(path="/updateNotice", method={RequestMethod.GET})
	public String updateViewNotice(NoticeVO noticeVo, Model model) {
		
		NoticeVO noticeVo2 = noticeService.selectNotice(noticeVo.getNoticeId());
		
		model.addAttribute("noticeVo", noticeVo2);
		
		return "admin/notice/noticeUpdate";
	}
	
	@RequestMapping(path="/updateNotice", method= {RequestMethod.POST})
	public String updateNotice(NoticeVO noticeVo, MultipartHttpServletRequest files, HttpServletRequest request) {
		
		String[] arr = request.getParameterValues("del_files");
		
		List<MultipartFile> fileslist = files.getFiles("realfile");
		
		if(arr != null) {
			for (int i = 0; i < arr.length; i++) {
				String files_id = arr[i];
				filesService.deleteFiles(files_id);
			}
		}
		
		int cnt = noticeService.updateNotice(noticeVo);
		
		for(int i = 0; i < fileslist.size(); i++) {
			
			MultipartFile profile = fileslist.get(i);
			
			String files_nm = profile.getOriginalFilename();
			if(profile != null && !profile.equals("")) {
			
			String ext = FileUploadUtil.getExtenstion(files_nm);
			String fileName = UUID.randomUUID().toString();
			String files_path = "";
			
				if (profile.getSize() > 0) {
					files_path = "D:\\profile\\" + fileName + "." + ext;
					File file = new File("D:\\profile\\" + files_nm);
					try {
						profile.transferTo(file);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					FilesVO filesVo = new FilesVO();
					
					filesVo.setFiles_gn(noticeVo.getNoticeId());
					filesVo.setFiles_nm(files_nm);
					filesVo.setFiles_path(files_path);
					filesVo.setFiles_id(filesVo.getFiles_id());
					filesService.insertFiles(filesVo);
				}
			}
		}
		
		if(cnt == 1) {
			return "redirect:selectNotice?notice_id="+noticeVo.getNoticeId();
		}else {
			return "admin/notice/noticeUpdate";
		}
	}
	
	@RequestMapping(path="/deleteNotice")
	public String deleteNotice(String notice_id) {
		
		noticeService.deleteNotice(notice_id);
		
		return "redirect:selectAllNotice";
		
	}
}
