package kr.co.codemaker.user.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.cart.service.UserPayService;
import kr.co.codemaker.user.cart.vo.CartVO;
import kr.co.codemaker.user.cart.vo.LessonVO;
import kr.co.codemaker.user.cart.vo.PayVO;

/**
 * @author 최민준
 *
 */
@Controller
public class UserPayController {
	private static final Logger logger = LoggerFactory.getLogger(UserPayController.class);
	
	@Resource(name="userPayService")
	private UserPayService userPayService;
	
	@RequestMapping(path="user/payView")
	public String payView(HttpSession session, Model model, PayVO payVo, LessonVO lessonVo, @RequestParam(name="lessonVo[]")List<LessonVO> lessonVoList) {
//		ObjectMapper jsonMapper = new ObjectMapper();
//		LessonVO lvo =new LessonVO();
//		try {
//			lvo = jsonMapper.readValue(jsonData, LessonVO.class);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		logger.debug("데이터 : {}", lessonVoList.get(0).getLesNm());
		
//		logger.debug("강의 정보 :{}",lessonVo);
		return "";
		// 회원아이디, 강의 아이디 필요함
//		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");	//로그인한 회원아이디 세션에서 가져오기
//		LessonVO getLessonVo = null;
//		try {
//			getLessonVo = userPayService.selectLessonInfo(lessonVo);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		model.addAttribute("userVo", userVo);
//		model.addAttribute("lessonVo", getLessonVo);
//		return "mainT/user/payment/pay";
	}
	
	//결제하기
	@RequestMapping(path="user/pay")
	public String pay(PayVO payVo) {
		logger.debug("결제 정보 :{}",payVo);
		return "";
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
		logger.debug("추가된 강의 정보 :{}",lessonList);
		model.addAttribute("lessonList", lessonList);
		
		return "mainT/user/payment/cart";
	}

}
