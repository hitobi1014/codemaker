package kr.co.codemaker.teacher.replyController;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.common.service.ReplyService;
import kr.co.codemaker.common.vo.ReplyVO;

@Controller
public class TeacherReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherReplyController.class);
	
	@Resource(name="replyService")
	private ReplyService replyService;
	
	@RequestMapping(path="/teacher/selectAllReply")
	public String selectAllReply(String qnaId, Model model) {
		
		List<ReplyVO> replyList = new ArrayList<ReplyVO>();
		try {
			replyList = replyService.selectAllReply(qnaId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("replyList", replyList);
 		
		return "mainT/teacher/reply/replyList";
	}
	
	@RequestMapping(path="/teacher/insertReply")
	public String insertReply(ReplyVO replyVo, String tchId, Model model) {
		return "";
	}
	
	@RequestMapping(path="/teacher/updateReply")
	public String updateReply(ReplyVO replyVo, Model model) {
		return "";
	}
	
	@RequestMapping(path="/teacher/deleteReply")
	public String deleteReply(ReplyVO replyVo) {
		return "";
	}
}
