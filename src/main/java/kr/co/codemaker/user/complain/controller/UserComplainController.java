package kr.co.codemaker.user.complain.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.codemaker.common.service.ComplainService;
import kr.co.codemaker.common.vo.ComplainVO;

@Controller
public class UserComplainController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserComplainController.class);
	
	@Resource(name="complainService")
	private ComplainService complainService;
	
	@RequestMapping(path="/user/insertComplain", method=RequestMethod.GET)
	public String insertViewComplain(String qnaId, String replyId, Model model) {
		
		if(qnaId != null) {
			model.addAttribute("qnaId", qnaId);
		}else {
			model.addAttribute("replyId", replyId);
		}
		
		
		return "user/complain/complainInsert";
	}
	
	
	@RequestMapping(path="/user/insertComplain", method=RequestMethod.POST)
	public String insertComplain(ComplainVO complainVo) {
		logger.debug("컨트롤러 넘어 왔~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		
		complainService.insertComplain(complainVo);
		
		if(complainVo.getReplyId() != null) {
			String reId = complainService.selectReplyQna(complainVo);
			return "redirect:selectQna?qnaId="+reId;
		}else {
			return "redirect:selectQna?qnaId="+complainVo.getQnaId();
		}
	}
}
