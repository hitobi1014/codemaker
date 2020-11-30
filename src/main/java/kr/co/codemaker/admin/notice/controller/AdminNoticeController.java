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

import kr.co.codemaker.common.notice.service.NoticeService;
import kr.co.codemaker.common.service.FilesService;
import kr.co.codemaker.common.vo.FilesVO;
import kr.co.codemaker.common.vo.NoticeVO;
import kr.co.codemaker.fileUpload.FileUploadUtil;


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
public class AdminNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@Resource(name="filesService")
	private FilesService filesService;
	
	@RequestMapping(path="/admin/selectAllNotice")
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
 		
		return "admin/notice/noticeList";
	}
	
	@RequestMapping(path="/admin/selectNotice")
	public String selectNotice(String noticeId, Model model) {
		
		NoticeVO noticeVo = new NoticeVO();
		try {
			noticeVo = noticeService.selectNotice(noticeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<FilesVO> filesList = filesService.selectAllFiles(noticeId);	
		
		model.addAttribute("noticeVo", noticeVo);
		model.addAttribute("filesList", filesList);
		
		return "admin/notice/notice";
	}
	
	
	@RequestMapping(path="/admin/insertNotice", method={RequestMethod.GET})
	public String insertViewNotice() {
		
		return "admin/notice/noticeInsert";
	}
	
	@RequestMapping(path="/insertNotice", method={RequestMethod.POST})
	public String insertNotice(NoticeVO noticeVo, MultipartHttpServletRequest files) {
	 	
		List<MultipartFile> filesList = files.getFiles("realfile");
		
		int cnt = 0;
		try {
			cnt = noticeService.insertNotice(noticeVo);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
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
					
					filesVo.setFilesGroup(noticeVo.getNoticeId());
					filesVo.setFilesNm(files_nm);
					filesVo.setFilesPath(files_path);
					filesVo.setFilesId(files_id);
					
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
	
	@RequestMapping(path="/admin/updateNotice", method={RequestMethod.GET})
	public String updateViewNotice(NoticeVO noticeVo, Model model) {
		
		NoticeVO noticeVo2 = new NoticeVO();
		try {
			noticeVo2 = noticeService.selectNotice(noticeVo.getNoticeId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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
		
		int cnt = 0;
		try {
			cnt = noticeService.updateNotice(noticeVo);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
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
					
					filesVo.setFilesGroup(noticeVo.getNoticeId());
					filesVo.setFilesNm(files_nm);
					filesVo.setFilesPath(files_path);
					filesVo.setFilesId(filesVo.getFilesId());
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
		
		try {
			noticeService.deleteNotice(notice_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:selectAllNotice";
		
	}
}
