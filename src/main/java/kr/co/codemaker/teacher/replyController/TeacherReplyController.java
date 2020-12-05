package kr.co.codemaker.teacher.replyController;

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
public class TeacherReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherReplyController.class);
	
	@Resource(name="replyService")
	private ReplyService replyService;
	
	@RequestMapping(path="/teacher/insertReply")
	public String insertReply(ReplyVO replyVo, Model model) {
		
		replyService.insertReply(replyVo);
		
		model.addAttribute("replyVo", replyVo);
		
		return "redirect:/teacher/selectQna?qnaId="+replyVo.getQnaId();
	}
	
	@RequestMapping(path="/teacher/insertrReply")
	public String insertrReply(ReplyVO replyVo, @RequestParam("rreplyCont") String replyCont, @RequestParam("root") String replyRoot, Model model) {
		
		replyVo.setReplyCont(replyCont);
		replyVo.setReplyRoot(replyRoot);
		
		replyService.insertReply(replyVo);
		
		model.addAttribute("replyVo", replyVo);
		
		return "redirect:/teacher/selectQna?qnaId="+replyVo.getQnaId();
	}
	
	@RequestMapping(path="/teacher/deleteReply")
	public String deleteReply(ReplyVO replyVo, String qnaId) {
		
		logger.debug("delete replyVo {}", replyVo);
		
		replyService.deleteReply(replyVo.getReplyId());
		
		return "redirect:/teacher/selectQna?qnaId="+replyVo.getQnaId();
	}
}
