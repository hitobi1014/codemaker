package kr.co.codemaker.admin.company.controller;

import java.util.ArrayList;
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

import kr.co.codemaker.admin.company.service.CompanyService;
import kr.co.codemaker.admin.company.vo.CompanyVO;
import kr.co.codemaker.admin.jobinfo.controller.AdminJobInfoController;

/**
* CompanyController.java
*
* @author 박다미
* @version 1.0
* @since 2020. 12. 15.
*
* 수정자 수정내용
* ------ ------------------------
* 박다미 최초 생성
*
 */

@Controller
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminJobInfoController.class);
	
	@Resource(name="companyService")
	private CompanyService companyService;
	
	@RequestMapping(path="/admin/selectAllCompany")
	public String selectAllCompany(@RequestParam(name="page", required = false, defaultValue = "1") int page, 
			@RequestParam(name="pageSize", required = false, defaultValue = "3")int pageSize,Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("pageSize", pageSize);
		
		logger.debug("map {}", map);
		
		try {
			map = companyService.selectAllCompany(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("companyList",map.get("companyList"));
		model.addAttribute("page",page);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pages", map.get("pages"));
		return "adminPage/admin/company/companyAllSelect";
	}
	
	
	// codemaker & 기업 계약서
	@RequestMapping(path="/admin/companyContract")
	public String contractTest(String comId, Model model) {
		CompanyVO companyVO = new CompanyVO();
		companyVO.setComId(comId);
		
		try {
			companyVO = companyService.selectCompany(companyVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("companyVO", companyVO);
		return "admin/company/canvas4";
	}

	
	@RequestMapping(path="/contract")
	public String contract() {
		return "user/lesson/canvas4";
	}
}
