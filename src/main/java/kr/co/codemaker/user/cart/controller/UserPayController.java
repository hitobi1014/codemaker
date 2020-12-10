package kr.co.codemaker.user.cart.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.cart.service.UserPayService;
import kr.co.codemaker.user.cart.vo.CartVO;
import kr.co.codemaker.user.cart.vo.LessonVO;
import kr.co.codemaker.user.cart.vo.PayVO;
import kr.co.codemaker.user.cart.vo.PointVO;

/**
 * @author 최민준
 *
 */
@Controller
public class UserPayController {
	private static final Logger logger = LoggerFactory.getLogger(UserPayController.class);
	
	@Resource(name="userPayService")
	private UserPayService userPayService;
	
	@RequestMapping(path="user/payView", produces="application/json; charset=utf-8")//@RequestBody List<LessonVO> jsonData
	public String payView(HttpSession session, Model model, PayVO payVo, LessonVO lessonVo){
		// 회원아이디, 강의 아이디 필요함
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");	//로그인한 회원아이디 세션에서 가져오기
		LessonVO getLessonVo = null;
		PointVO pointVo = null;
		try {
			pointVo = userPayService.selectPoint(new PointVO(userVo.getUserId()));
		} catch (Exception e) {e.printStackTrace();}
		try {
			getLessonVo = userPayService.selectLessonInfo(lessonVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("userVo", userVo);
		model.addAttribute("lessonVo", getLessonVo);
		model.addAttribute("pointVo", pointVo);
		return "mainT/user/payment/pay";
	}
	
	@RequestMapping(path="user/payViewList")
	public String payViewList(HttpSession session, PayVO payVo,Model model, LessonVO lessonList) {
		logger.debug("정보 : {}",lessonList.getLessonList());
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		PointVO pointVo = null;
		try {
			pointVo = userPayService.selectPoint(new PointVO(userVo.getUserId()));
		} catch (Exception e) {e.printStackTrace();}
		List<LessonVO> lesson = new ArrayList<>();
		for(int i=0; i<lessonList.getLessonList().size();i++) {
			if(lessonList.getLessonList().get(i).getLesId() != null) {
				lesson.add(lessonList.getLessonList().get(i));
			}
		}
		model.addAttribute("userVo", userVo);
		model.addAttribute("lessonVoList", lesson);
		model.addAttribute("pointVo", pointVo);
		return "mainT/user/payment/payList";
	}
	
	//결제하기
	@RequestMapping(path="user/pay")
	public String pay(PayVO payVo, PointVO pointVo,HttpSession session) {
		String payGroup = UUID.randomUUID().toString();
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		pointVo.setUserId(userVo.getUserId());
		if(pointVo.getPointUpdate() !=null) {
			try {
				userPayService.usePoint(pointVo);
			} catch (Exception e) {e.printStackTrace();}
		}
		logger.debug("포인트 : {}",pointVo);
		logger.debug("결제정보 : {}",payVo.getPayList());
		//장바구니에서 결제할때
		if(payVo.getPayList() != null) {
			for(int i=0; i<payVo.getPayList().size();i++) {
				CartVO cartVo = new CartVO();
				cartVo.setLesId(payVo.getPayList().get(i).getLesId());
				cartVo.setUserId(payVo.getPayList().get(i).getUserId());
				try {
					payVo.getPayList().get(i).setPayGroup(payGroup);
					userPayService.insertPay(payVo.getPayList().get(i));
					userPayService.deleteCart(cartVo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		//강의 페이지에서 바로 결제 할때
		}else if(payVo !=null) {
			try {
				payVo.setPayGroup(payGroup);
				userPayService.insertPay(payVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/user/main";
	}
	
	//강의담기 (장바구니 기능)
	@RequestMapping(path="user/cart")
	public String addCart(CartVO cartVo, Model model) {
		CartVO getCartVo = null;
		String msg = "";
		String code="";
		//똑같은 강의를 담았을때 메세지 출력
		try {
			getCartVo = userPayService.selectCart(cartVo);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if(getCartVo != null) {
			code="0";
			msg="이미 장바구니에 강의를 담았습니다";
			model.addAttribute("msg", msg);
			model.addAttribute("code", code);
			return "jsonView";
		}
		
		//강의담기
		int insertCnt =0;
		try {
			insertCnt = userPayService.insertCart(cartVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(insertCnt >0) {
			code="1";
			msg ="success";
		}else {
			msg="fail";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("msg", code);
		
		return "jsonView";
	}
	
	//장바구니로 이동, 담은강의 리스트 조회
	@RequestMapping(path="user/cartView")
	public String cartView(HttpSession session,Model model,LessonVO lessonVo) {
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		List<CartVO> cartList = null;
		try {
			cartList = userPayService.selectCartList(new CartVO(userVo.getUserId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
//		logger.debug("카트 리스트 확인:{}",cartList);
		
		List<LessonVO> lessonList = new ArrayList<>();
		for(int i=0; i<cartList.size(); i++) {
			LessonVO lesson =null;
			try {
				lesson = userPayService.selectLessonInfo(new LessonVO(cartList.get(i).getLesId()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			lessonList.add(lesson);
		}
		model.addAttribute("lessonList", lessonList);
		
		return "mainT/user/payment/cart";
	}

}
