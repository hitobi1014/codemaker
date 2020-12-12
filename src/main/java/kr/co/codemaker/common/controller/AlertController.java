package kr.co.codemaker.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AlertController {
	
	@RequestMapping("/common/alert")
	public String alert(Model model) {
		
		return "/user/chat/alert";
	}
	
}
