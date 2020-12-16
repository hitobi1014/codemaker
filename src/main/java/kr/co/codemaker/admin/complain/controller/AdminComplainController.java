package kr.co.codemaker.admin.complain.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.common.service.ComplainService;
import kr.co.codemaker.common.vo.ComplainVO;
import kr.co.codemaker.common.vo.UserVO;

@Controller
public class AdminComplainController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminComplainController.class);
	
	@Resource(name="complainService")
	private ComplainService complainService;
	
	@RequestMapping(path="/admin/selectAllComplain")
	public String selectAllComplain(Model model) {
		List<ComplainVO> complainList = complainService.selectAllComplain();
		
		model.addAttribute("complainList", complainList);
		
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
