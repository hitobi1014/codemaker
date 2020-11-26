package kr.co.codemaker.common.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.codemaker.common.service.MainServiceI;
import kr.co.codemaker.model.UserVO;

@Controller
@RequestMapping(path="/main")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="mainService")
	private MainServiceI mainService;
	
	@RequestMapping(path="/userLogin",method = RequestMethod.GET)
	public String userLoginView(@RequestParam(required=false) String msg, Model model) {
		logger.debug("로그인진입");
		if(msg !=null) {
			model.addAttribute("msg", msg);
		}
		return "user/main/login";
	}
	
	@RequestMapping(path="/userLogin",method = RequestMethod.POST)
	public String userLogin(UserVO userVo,
			@RequestParam(name="rememberMe", required=false, defaultValue="0") int rememberMe, Model model, HttpSession session,
			HttpServletResponse response) throws UnsupportedEncodingException {	
		logger.debug("받아온 정보 : {}",userVo);
		logger.debug("리멤버:{}",rememberMe);
		UserVO getUserVo = mainService.selectUser(userVo.getUser_id());
		logger.debug("가져온 유저:{}",getUserVo);
		Cookie userCookie=null;
		Cookie remember = null;
		if(rememberMe == 1) {
			userCookie = new Cookie("userid", URLEncoder.encode(userVo.getUser_id(),"UTF-8"));
			remember = new Cookie("remember", Integer.toString(rememberMe));
			userCookie.setMaxAge(60*60*24*30);
			remember.setMaxAge(60*60*24*30);
			response.addCookie(userCookie);
			response.addCookie(remember);
		}else {
			userCookie = new Cookie("userid", null);
			remember = new Cookie("remember", null);
			userCookie.setMaxAge(0);
			remember.setMaxAge(0);
			response.addCookie(userCookie);
			response.addCookie(remember);
		}
		
		if(getUserVo != null && userVo.getUser_pass().equals(getUserVo.getUser_pass())) {
			session.setAttribute("MEMBER_INFO", getUserVo);
			return "user/main/main_login";
		}else if(getUserVo != null && !userVo.getUser_pass().equals(getUserVo.getUser_pass())) {
			String msg = URLEncoder.encode("비밀번호를 확인해주세요","UTF-8");
			return "redirect:/main/userLogin?msg="+msg;
		}else {
			String msg = URLEncoder.encode("존재하는 회원 정보가 없습니다","UTF-8");
			return "redirect:/main/userLogin?msg="+msg;
		}
	}
}
