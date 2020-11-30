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
import kr.co.codemaker.model.UsersVO;

@Controller
@RequestMapping(path="/user")
public class userLoginController {
	private static final Logger logger = LoggerFactory.getLogger(userLoginController.class);
	
	@Resource(name="mainService")
	private MainServiceI mainService;
	
	@RequestMapping(path="/login", method = RequestMethod.GET)
	public String userLoginView(@RequestParam(required=false) String msg, Model model) {
		logger.debug("로그인진입");
		if(msg !=null) {
			model.addAttribute("msg", msg);
		}
		return "user/main/login";
	}
	
	@RequestMapping(path="/login", method = RequestMethod.POST)
	public String userLogin(UsersVO userVo,
			@RequestParam(name="rememberMe", required=false, defaultValue="0") int rememberMe, Model model, HttpSession session,
			HttpServletResponse response) throws UnsupportedEncodingException{
		UsersVO getUserVo = mainService.selectUser(userVo.getUser_id());
		Cookie userCookie=null;
		Cookie remember = null;
		//아이디 저장 버튼 클릭시 쿠키에 아이디 정보 저장
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
		
		// 로그인 성공시 메인홈페이지로 이동
		if(getUserVo != null && userVo.getUser_pass().equals(getUserVo.getUser_pass())) {
			session.setAttribute("MEMBER_INFO", getUserVo);
			return "mainT/user/main/main_content";
		// 비밀번호 틀렸을때 문구출력
		}else if(getUserVo != null && !userVo.getUser_pass().equals(getUserVo.getUser_pass())) {
			String msg = URLEncoder.encode("비밀번호를 확인해주세요","UTF-8");
			return "redirect:/user/login?msg="+msg;
		// 일치하는 아이디가 없을때 문구 출력
		}else {
			String msg = URLEncoder.encode("존재하는 회원 정보가 없습니다","UTF-8");
			return "redirect:/user/login?msg="+msg;
		}
	}
	
	@RequestMapping(path="/signup")
	public String userSignupView() {
		return "user/signup/signup";
	}
	
	@RequestMapping(path="/main")
	public String contentTest() {
		return "mainT/user/main/main_content";
	}

	@RequestMapping(path="/maintest")
	public String maincontentTest() {
		return "mainT/user/main/main_test";
	}
	
	@RequestMapping(path="/mainbck")
	public String userMainBckView() {
		return "user/main/main_bck";
	}
	
	@RequestMapping(path="/mainlogin")
	public String userMainLoginView() {
		return "user/main/main_login";
	}
	
	@RequestMapping(path="/mypage")
	public String userMypageView() {
		return "mypageT/user/mypage/mypage_content";
	}
	
	@RequestMapping(path="/mypagebck")
	public String userMypageBckView() {
		return "user/mypage/layout/mypage_bck";
	}
	
	@RequestMapping(path="/mypagetest")
	public String userMypageNewView() {
		return "user/mypage/test";
	}

}
