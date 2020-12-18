package kr.co.codemaker.admin.complain.controller;

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

import kr.co.codemaker.common.service.ComplainService;
import kr.co.codemaker.common.vo.ComplainVO;
import kr.co.codemaker.common.vo.UserVO;

@Controller
public class AdminComplainController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminComplainController.class);
	
	@Resource(name="complainService")
	private ComplainService complainService;
	
	@RequestMapping(path="/admin/selectAllComplain")
	public String selectAllComplain(@RequestParam(name="page", required = false, defaultValue = "1") int page, 
			@RequestParam(name="pageSize", required = false, defaultValue = "5") int pageSize, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("pageSize", pageSize);
		
		map = complainService.selectAllComplain(map);
		
		model.addAttribute("complainList",map.get("complainList"));
		model.addAttribute("page", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pages", map.get("pages"));
		
		return "adminPage/admin/complain/complainList";
	}
	
	@RequestMapping(path="/admin/selectComplain")
	public String selectComplain(ComplainVO complainVo, Model model) {
		ComplainVO cpVo = complainService.selectComplain(complainVo);
		
		if(cpVo.getReplyId() != null) {
			String reId = complainService.selectReplyQna(cpVo);
			model.addAttribute("reId", reId);
		}
		
		model.addAttribute("cpVo", cpVo);
		
		return "admin/complain/complain";
	}
	
	@RequestMapping(path="/admin/checkComplain")
	public String checkComplain(ComplainVO complainVo) {
		
		logger.debug("complainVO : {}", complainVo);
		
		complainService.checkComplain(complainVo);
		
		return "jsonView";
	}
	
	@RequestMapping(path="/admin/selectBlackList")
	public String selectBlackList(Model model) {
		
		List<UserVO> blacklist = complainService.selectBlackList();
		
		model.addAttribute("blacklist", blacklist);
		
		return "adminPage/admin/complain/complainBlack";
	}
	
	@RequestMapping(path="/admin/insertBlackList")
	public String insertBlackList(UserVO userVo) {
		
		complainService.insertBlackList(userVo);
		
		return "redirect:/admin/selectBlackList";
	}
}
