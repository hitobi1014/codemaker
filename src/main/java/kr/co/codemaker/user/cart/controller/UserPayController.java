package kr.co.codemaker.user.cart.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.cart.vo.PayVO;

@Controller
public class UserPayController {
	private static final Logger logger = LoggerFactory.getLogger(UserPayController.class);
	
	@RequestMapping(path="user/payView")
	public String payView(HttpSession session, Model model, PayVO payVo) {
		// 회원아이디, 강의 아이디 필요함
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		logger.debug("세션 정보 :{}",userVo);
		model.addAttribute("userVo", userVo);
		return "mainT/user/payment/pay";
	}
	
	
}
