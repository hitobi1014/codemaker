package kr.co.codemaker.user.cart.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {
	
	@Resource(name="kakao")
	private KakaoPay kakaoPay;
	
	@RequestMapping("/kakaoPay")
	public String kakaoPay() {
		System.out.println("카카오페이진입");
		return "redirect:" + kakaoPay.kakaoPayReady();
	}
}
