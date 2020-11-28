package kr.co.codemaker.admin.jobinfo.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.codemaker.admin.jobinfo.service.JobInfoServiceI;
import kr.co.codemaker.common.service.FilesServiceI;
import kr.co.codemaker.fileUpload.FileUploadUtil;
import kr.co.codemaker.model.FilesVO;
import kr.co.codemaker.model.JobInfoVO;

/**
* JobInfoController.java
*
* @author 박경호
* @version 1.0
* @since 2020. 11. 25.
*
* 수정자 수정내용
* ------ ------------------------
* 박경호 최초 생성
*
 */

@RequestMapping("/jobInfo")
@Controller
public class JobInfoController {
private static final Logger logger = LoggerFactory.getLogger(JobInfoController.class);
	
	@Resource(name="jobInfoService")
	private JobInfoServiceI jobInfoService;
	
	@Resource(name="filesService")
	private FilesServiceI filesService;
	
	@RequestMapping(path="/selectAllJobInfo")
	public String selectAlljobInfo(@RequestParam(name="page", required = false, defaultValue = "1") int page, 
			@RequestParam(name="pageSize", required = false, defaultValue = "5") int pageSize, 
			String searchOption, String keyWord, Model model) {	
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("pageSize", pageSize);
		map.put("searchOption", searchOption);
		map.put("keyWord", keyWord);
		map.put("pages", map.get("pages"));
		
		
		logger.debug("map {}", map);
		
		Map<String, Object> map2 = jobInfoService.selectAllJobInfo(map);
		
		logger.debug("map2 {}", map2);
		
		model.addAttribute("jobInfoList", map2.get("jobInfoList"));
		model.addAttribute("pages", map2.get("pages"));
		model.addAttribute("page", map2.get("page"));
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyWord", keyWord);
 		
		return "admin/jobInfo/jobInfoList";
	}
	
	@RequestMapping(path="/selectJobInfo")
	public String selectNotice(String job_id, Model model) {
		
		JobInfoVO jobInfoVo = jobInfoService.selectJobInfo(job_id);
		
		List<FilesVO> filesList = filesService.selectAllFiles(job_id);	
		
		model.addAttribute("jobInfoVo", jobInfoVo);
		model.addAttribute("filesList", filesList);
		
		return "admin/jobInfo/jobInfo";
	}
	
	
	@RequestMapping(path="/insertJobInfo", method={RequestMethod.GET})
	public String insertViewNotice() {
		
		return "admin/jobInfo/jobInfoInsert";
	}
	
	@RequestMapping(path="/insertJobInfo", method={RequestMethod.POST})
	public String insertNotice(JobInfoVO jobInfoVo, MultipartHttpServletRequest files) {
	 	
		List<MultipartFile> filesList = files.getFiles("realfile");
		
		int cnt = jobInfoService.insertJobInfo(jobInfoVo);
		
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
					
					filesVo.setFiles_gn(jobInfoVo.getJob_id());
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
			return "redirect:admin/jobInfo/selectAllJobInfo";
		}else {
			return "admin/jobInfo/jobInfoInsert";
		}
	}
	
	@RequestMapping(path="/updateJobInfo", method={RequestMethod.GET})
	public String updateViewNotice(JobInfoVO jobInfoVo, Model model) {
		
		JobInfoVO jobInfoVo2 = jobInfoService.selectJobInfo(jobInfoVo.getJob_id());
		
		model.addAttribute("jobInfoVo", jobInfoVo2);
		
		return "admin/jobInfo/jobInfoUpdate";
	}
	
	@RequestMapping(path="/updateJobInfo", method= {RequestMethod.POST})
	public String updateJobInfo(JobInfoVO jobInfoVo) {
		
		int cnt = jobInfoService.updateJobInfo(jobInfoVo);
		
		if(cnt == 1) {
			return "redirect:admin/jobInfo/selectJobInfo?notice_id="+jobInfoVo.getJob_id();
		}else {
			return "admin/jobInfo/jobInfoUpdate";
		}
	}
	
	@RequestMapping(path="/deleteJobInfo")
	public String deleteNotice(String job_id) {
		
		jobInfoService.deleteJobInfo(job_id);
		
		return "redirect:admin/jobInfo/selectAllJobInfo";
		
	}
}
