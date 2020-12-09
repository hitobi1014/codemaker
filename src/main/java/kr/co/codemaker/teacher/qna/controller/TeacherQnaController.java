package kr.co.codemaker.teacher.qna.controller;

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

import kr.co.codemaker.common.service.QnaService;
import kr.co.codemaker.common.service.ReplyService;
import kr.co.codemaker.common.vo.QnaVO;
import kr.co.codemaker.common.vo.ReplyVO;
import kr.co.codemaker.user.course.qna.controller.UserQnaController;

@Controller
public class TeacherQnaController {
	
private static final Logger logger = LoggerFactory.getLogger(UserQnaController.class);
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	@Resource(name="replyService")
	private ReplyService replyService;
	
	@RequestMapping(path="/teacher/selectAllQna")
	public String selectAllQna(@RequestParam(name="page", required = false, defaultValue = "1") int page, 
			@RequestParam(name="pageSize", required = false, defaultValue = "10") int pageSize, 
			String lesId, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("pageSize", pageSize);
		map.put("lesId", lesId);
		map.put("pages", map.get("pages"));
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		try {
			map2 = qnaService.selectAllQna(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.debug("map2 {}", map2);
		
		model.addAttribute("qnaList", map2.get("qnaList"));
		model.addAttribute("pages", map2.get("pages"));
		model.addAttribute("page", map2.get("page"));
		model.addAttribute("pageSize", pageSize);
 		
		return "mainT/teacher/qna/qnaList";
	}
	
	@RequestMapping(path="/teacher/selectQna")
	public String selectQna(String qnaId, Model model) throws Exception {
		
		QnaVO qnaVo = qnaService.selectQna(qnaId);
		List<ReplyVO> replyList = replyService.selectAllReply(qnaId);
		
		model.addAttribute("qnaVo", qnaVo);
		model.addAttribute("replyList", replyList);
		
		return "mainT/teacher/qna/qna";
	}
}
