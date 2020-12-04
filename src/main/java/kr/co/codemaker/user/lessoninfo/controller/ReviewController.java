package kr.co.codemaker.user.lessoninfo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.lessoninfo.service.ReviewService;
import kr.co.codemaker.user.lessoninfo.vo.ReviewVO;
import kr.co.codemaker.user.mypage.service.MypageService;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Resource(name="reviewService")
	private ReviewService reviewService;

	@RequestMapping("/user/selectReview")
	public String selectReview(Model model, String lesId){

		List<ReviewVO> reviewList=new ArrayList<ReviewVO>();
		try {
			reviewList = reviewService.selectReview(lesId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("reviewList");
		
		model.addAttribute("reviewList", reviewList);
		
		return "mainT/user/lesson/selectReview";
	}
	
	@RequestMapping("/user/insertReview")
	public String insertReview(ReviewVO reviewVo, HttpSession session, HttpServletRequest request) {
		
		logger.debug("insert 컨트롤러 시작");
		logger.debug("reviewVo : {} ", reviewVo);
	
		session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		
		String reviewUser = userVo.getUserId();
		String userId = reviewUser;
		String payId = "PAY0010";
		
		reviewVo.setUserId(reviewUser);
		reviewVo.setPayId(payId);
		
		int insertCnt=0;
		
		try {
			insertCnt = reviewService.insertReview(reviewVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/user/selectReview";
	}
}
