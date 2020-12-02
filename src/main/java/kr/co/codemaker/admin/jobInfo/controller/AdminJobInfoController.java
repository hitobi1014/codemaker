package kr.co.codemaker.admin.jobinfo.controller;

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

import kr.co.codemaker.common.service.FilesService;
import kr.co.codemaker.common.service.JobInfoService;
import kr.co.codemaker.common.vo.FilesVO;
import kr.co.codemaker.common.vo.JobInfoVO;
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
public class AdminJobInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminJobInfoController.class);
	
	@Resource(name="jobInfoService")
	private JobInfoService jobInfoService;
	
	@Resource(name="filesService")
	private FilesService filesService;
	
	@RequestMapping(path="/admin/selectAllJobInfo")
	public String selectAllJobInfo(@RequestParam(name="page", required = false, defaultValue = "1") int page, 
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
			map2 = jobInfoService.selectAllJobInfo(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.debug("map2 {}", map2.get("jobInfoList"));
		
		model.addAttribute("jobInfoList", map2.get("jobInfoList"));
		model.addAttribute("pages", map2.get("pages"));
		model.addAttribute("page", map2.get("page"));
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyWord", keyWord);
 		
		return "adminPage/admin/jobInfo/jobInfoList";
	}
	
	@RequestMapping(path="/admin/selectJobInfo")
	public String selectJobInfo(String jobInfoId, Model model) {
		
		JobInfoVO jobInfoVo = new JobInfoVO();
		try {
			jobInfoVo = jobInfoService.selectJobInfo(jobInfoId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("jobInfoVo", jobInfoVo);
		logger.debug("jobInfoVo : {}", jobInfoVo);
		
		if(filesService.selectAllFiles(jobInfoId) != null) {
			List<FilesVO> filesList = filesService.selectAllFiles(jobInfoId);	
			model.addAttribute("filesList", filesList);
		}
		
		return "adminPage/admin/jobInfo/jobInfo";
	}
	
	
	@RequestMapping(path="/admin/insertJobInfo", method={RequestMethod.GET})
	public String insertViewJobInfo() {
		
		return "adminPage/admin/jobInfo/jobInfoInsert";
	}
	
	@RequestMapping(path="/admin/insertJobInfo", method={RequestMethod.POST})
	public String insertJobInfo(JobInfoVO jobInfoVo, MultipartHttpServletRequest files) {
	 	
		List<MultipartFile> filesList = files.getFiles("realfile");
		
		int cnt = 0;
		try {
			cnt = jobInfoService.insertJobInfo(jobInfoVo);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		logger.debug("파일 전 cnt {}", cnt);
		
		for(int i = 0; i < filesList.size(); i++) {
			MultipartFile profile = filesList.get(i);
			
			String filesNm = profile.getOriginalFilename();
			if(profile != null && !profile.equals("")) {
				
				String ext = FileUploadUtil.getExtenstion(filesNm);
				String fileName = UUID.randomUUID().toString();
				String filesPath = "";
				
				if (profile.getSize() > 0) {
					filesPath = "D:\\profile\\" + fileName + "." + ext;
					File file = new File("D:\\profile\\" + filesNm);
					try {
						profile.transferTo(file);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					FilesVO filesVo = new FilesVO();
					
					
					filesVo.setFilesGroup("1");
					filesVo.setFilesNm(filesNm);
					filesVo.setFilesPath(filesPath);
					
					logger.debug("filesVo {}", filesVo);
					
					filesService.insertFiles(filesVo);
					
					logger.debug("파일 후 cnt {}", cnt);
				}
			}
		}
		logger.debug("파일 후 cnt {}", cnt);
		
		if(cnt == 1) {
			return "redirect:selectAllJobInfo";
		}else {
			return "adminPage/admin/jobInfo/jobInfoInsert";
		}
	}
	
	@RequestMapping(path="/admin/updateJobInfo", method={RequestMethod.GET})
	public String updateViewJobInfo(JobInfoVO jobinfoVo, Model model) {
		
		JobInfoVO jobinfoVo2 = new JobInfoVO();
		try {
			jobinfoVo2 = jobInfoService.selectJobInfo(jobinfoVo.getJobinfoId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("jobinfoVo", jobinfoVo2);
		
		return "adminPage/admin/jobinfo/jobInfoUpdate";
	}
	
	@RequestMapping(path="/admin/updateJobInfo", method= {RequestMethod.POST})
	public String updateNotice(JobInfoVO jobinfoVo, MultipartHttpServletRequest files, HttpServletRequest request) {
		
		String[] arr = request.getParameterValues("del_files");
		
		List<MultipartFile> fileslist = files.getFiles("realfile");
		
		if(arr != null) {
			for (int i = 0; i < arr.length; i++) {
				String filesId = arr[i];
				filesService.deleteFiles(filesId);
			}
		}
		
		int cnt = 0;
		try {
			cnt = jobInfoService.updateJobInfo(jobinfoVo);
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
					
					filesVo.setFilesGroup(filesVo.getFilesGroup());
					filesVo.setFilesNm(files_nm);
					filesVo.setFilesPath(files_path);
					filesVo.setFilesId(filesVo.getFilesId());
					
					filesService.insertFiles(filesVo);
				}
			}
		}
		
		if(cnt == 1) {
			return "redirect:selectJobInfo?jobInfoId="+jobinfoVo.getJobinfoId();
		}else {
			return "adminPage/admin/jobInfo/jobInfoUpdate";
		}
	}
	
	@RequestMapping(path="/admin/deleteJobInfo")
	public String deleteNotice(String jobInfoId) {
		
		try {
			jobInfoService.deleteJobInfo(jobInfoId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:selectAllJobInfo";
		
	}
}
