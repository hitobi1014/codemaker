package kr.co.codemaker.user.board.community.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.user.board.community.service.PostService;
import kr.co.codemaker.user.board.community.vo.PostVO;

@Controller
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@Resource(name="postService")
	private PostService postService;
	
	
	@RequestMapping(path="/user/community")
	public String getAllPost(Model model, PostVO postVO) throws Exception {
		List<PostVO> postList = postService.getAllPost(postVO);
		model.addAttribute("postList", postList);
		logger.debug("postList!!!!!!!!!!!!!!!!!!!!!!!!!! : {}", postList);
		
		return "mainT/user/community/allSelect";
	}
	
	@RequestMapping(path="/user/community/select")
	public String getPost(PostVO postVO, Model model) throws Exception {
		
		postVO = postService.getPost(postVO);
		model.addAttribute("PostVO", postVO);
		logger.debug("postVO : {}", postVO);
		
		return "mainT/user/community/select";
	}
}
