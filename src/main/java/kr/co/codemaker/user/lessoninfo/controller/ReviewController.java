package kr.co.codemaker.user.lessoninfo.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.lessoninfo.service.ReviewService;
import kr.co.codemaker.user.lessoninfo.vo.PayVO;
import kr.co.codemaker.user.lessoninfo.vo.ReviewStarVO;
import kr.co.codemaker.user.lessoninfo.vo.ReviewVO;
import kr.co.codemaker.user.mypage.service.MypageService;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Resource(name="reviewService")
	private ReviewService reviewService;

	@RequestMapping("/user/selectReview")
	public String selectReview(Model model, String lesId, HttpServletResponse response) throws IOException{

		List<ReviewVO> reviewList=new ArrayList<ReviewVO>();
		//수강후기 조회
		try {
			reviewList = reviewService.selectReview(lesId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//수강후기 별점 평균
		float reviewAvg=0;
		try {
			reviewAvg = reviewService.selectReviewAvg(lesId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//수강후기 별점 갯수
		ReviewStarVO reviewStarVo = new ReviewStarVO();
		try {
			reviewStarVo = reviewService.selectReviewStar(lesId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("lesId", lesId);
		model.addAttribute("reviewAvg", reviewAvg);
		model.addAttribute("reviewStarVo", reviewStarVo);
		
		return "mainT/user/lesson/reviewTest";
	}
	
	@RequestMapping("/user/reviewprofile")
	public void profileImg(String userProfile, HttpServletResponse response,HttpServletRequest request) throws Exception {

			
			FileInputStream fis = new FileInputStream(userProfile);
			ServletOutputStream sos =  response.getOutputStream();
			
			byte[] buffer = new byte[512];
			
			while (fis.read(buffer) != -1) {
				sos.write(buffer);
			}
			
			fis.close();
			sos.flush(); 
			sos.close();
			
	}

	@ResponseBody
	@RequestMapping("/user/insertReview")
	public String insertReview(Model model , ReviewVO reviewVo, String lesId, HttpSession session, HttpServletRequest request) {
		
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		
		String reviewUser = userVo.getUserId();
		String userId = reviewUser;
		 
		reviewVo.setUserId(reviewUser);
		
		PayVO payVo = new PayVO();
		payVo.setLesId(lesId);
		payVo.setUserId(userId);
		
		
		model.addAttribute("reviewVo", reviewVo);
		
		String checkPayId="";
		try {
			checkPayId = reviewService.checkPayId(payVo);
			logger.debug("checkPayId:{}",checkPayId);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		int insertCnt=0;
		
		if(checkPayId!=null) {
			try {
				insertCnt = reviewService.insertReview(reviewVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "1";
		}else {
			return "0";
		}
	}
	
	
	@RequestMapping("/user/deleteReview")
	public String deleteReview(ReviewVO reviewVo, String lesId) {

		String reviewId =reviewVo.getReviewId();

		int deleteCnt = 0;
		
		try {
			deleteCnt = reviewService.deleteReview(reviewId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/user/selectReview?lesId="+lesId;
	}
	
	@RequestMapping("review/test")
	public String test() {
		return "mainT/user/lesson/reviewTest";
	}
}
