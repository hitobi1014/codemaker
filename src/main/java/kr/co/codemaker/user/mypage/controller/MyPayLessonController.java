package kr.co.codemaker.user.mypage.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.mypage.service.MyPayLessonService;
import kr.co.codemaker.user.mypage.vo.PayLessonInfoVO;

@Controller
public class MyPayLessonController {
	private static final Logger logger = LoggerFactory.getLogger(MyPayLessonController.class);
	
	@Resource(name="myPayLessonService")
	private MyPayLessonService myPayLessonService;
	
	@RequestMapping(path="/user/myLesson")
	public String selectAllPayLesson(HttpSession session, Model model) {
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		logger.debug("회원아이디 : {}",userVo.getUserId());
		PayLessonInfoVO plVo = new PayLessonInfoVO();
		plVo.setUserId(userVo.getUserId());
		List<PayLessonInfoVO> plList = null;
		try {
			plList = myPayLessonService.selectAllPayLesson(plVo);
			logger.debug("가져온 내 강의 {}", plList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("plList", plList);
		return "mypageT/user/mypage/mypage-lesson";
	}
}
