package kr.co.codemaker.user.course.reply.controller;

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

import kr.co.codemaker.common.service.ReplyService;
import kr.co.codemaker.common.vo.ReplyVO;

@Controller
public class UserReplyController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserReplyController.class);
	
	@Resource(name="replyService")
	private ReplyService replyService;
	
	@RequestMapping(path="/user/insertReply")
	public String insertReply(ReplyVO replyVo, String userId, Model model) {
replyService.insertReply(replyVo);
		
		model.addAttribute("replyVo", replyVo);
		
		return "redirect:/user/selectQna?qnaId="+replyVo.getQnaId();
	}
	
	@RequestMapping(path="/user/insertrReply")
	public String updateReply(ReplyVO replyVo, @RequestParam("rreplyCont") String replyCont, @RequestParam("root") String replyRoot, Model model) {
		
		replyVo.setReplyCont(replyCont);
		replyVo.setReplyRoot(replyRoot);
		
		replyService.insertReply(replyVo);
		
		model.addAttribute("replyVo", replyVo);
		
		return "redirect:/user/selectQna?qnaId="+replyVo.getQnaId();
	}
	
	@RequestMapping(path="/user/deleteReply")
	public String deleteReply(ReplyVO replyVo, String qnaId) {
replyService.deleteReply(replyVo.getReplyId());
		
		return "redirect:/user/selectQna?qnaId="+replyVo.getQnaId();
	}
	
	
}
