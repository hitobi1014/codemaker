package kr.co.codemaker.user.cart.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.cart.dao.UserPayMapper;
import kr.co.codemaker.user.cart.vo.LessonVO;
import kr.co.codemaker.user.cart.vo.PayVO;

@Controller
public class UserPayController {
	private static final Logger logger = LoggerFactory.getLogger(UserPayController.class);
	
	@Resource(name="userPayMapper")
	private UserPayMapper uPayMapper;
	
	@RequestMapping(path="user/payView")
	public String payView(HttpSession session, Model model, PayVO payVo, LessonVO lessonVo) {
		// 회원아이디, 강의 아이디 필요함
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");	//로그인한 회원아이디 세션에서 가져오기
		lessonVo.setLesId("LESSON0003");
		LessonVO getLessonVo = null;
		try {
			getLessonVo = uPayMapper.selectLessonInfo(lessonVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("userVo", userVo);
		model.addAttribute("lessonVo", getLessonVo);
		return "mainT/user/payment/pay";
	}
	
	@RequestMapping(path="user/pay")
	public String pay(PayVO payVo) {
		logger.debug("결제 정보 :{}",payVo);
		return "";
	}
	
	
}
