package kr.co.codemaker.user.cart.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SampleController {
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	@Resource(name="kakao")
	private KakaoPay kakaoPay;
	
	@RequestMapping("/kakaoPay")
	public String kakaoPay(String total, Model model, HttpSession session,@RequestParam(required = false)String test) {
		logger.debug("받은 정보 :{}", total);
		String url = kakaoPay.kakaoPayReady(total,session);
		model.addAttribute("url", url);
		if(test!=null) {
			logger.debug("테스트 :{}",test);
			model.addAttribute("test", test);
		}
		return "jsonView";
	}
}
