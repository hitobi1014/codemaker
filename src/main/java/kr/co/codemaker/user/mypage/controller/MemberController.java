package kr.co.codemaker.user.mypage.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.codemaker.user.mypage.model.MemberVO;
import kr.co.codemaker.user.mypage.service.MemberServiceI;

@RequestMapping("/mypage")
@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Resource(name="memberService")
	private MemberServiceI memberService;
	
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}
	
	@RequestMapping("/test2")
	public String test2() {
		logger.debug("과연????????????");
		List<MemberVO> mv = memberService.getMember();
		logger.debug("두번쨰?????????????");
		logger.debug("memberVo : {} " , mv);
		
		return "test";
	}
}
