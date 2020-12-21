package kr.co.codemaker.user.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.stringtemplate.v4.compiler.STParser.mapExpr_return;

import com.mysql.fabric.xmlrpc.base.Array;

import kr.co.codemaker.admin.chart.vo.PayVO;
import kr.co.codemaker.common.vo.PageVo;
import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.mypage.service.MyPayService;
import kr.co.codemaker.user.mypage.vo.MyPayVO;

@Controller
public class MyPayController {
	private static final Logger logger = LoggerFactory.getLogger(MyPayController.class);
	
	@Resource(name="myPayService")
	private MyPayService myPayService;
	
	@RequestMapping("/mypage/selectAllMyPay")
	public String selectAllMyPay(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(name="page",required = false, defaultValue = "1")int page,
			@RequestParam(name="pageSize", required = false, defaultValue = "5")int pageSize) {
		
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		String userId = userVo.getUserId();
		
		model.addAttribute("page",page);
		model.addAttribute("pageSize", pageSize);
	
		PageVo pageVo = new PageVo();
		pageVo.setUserId(userId);
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		model.addAttribute("pageVo", pageVo);
		
		Map<String, Object> map = myPayService.selectAllMyPay(pageVo);
	
		
		model.addAttribute("myPay", map.get("myPay"));
		model.addAttribute("pages", map.get("pages"));
		
		return "mypageT/user/mypay/mypay_selectAll";
	}
	
	
	@RequestMapping("/mypage/payRefund")
	public String payRefund(Model model, String payId, HttpSession session, HttpServletRequest request) {
		
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		String userId = userVo.getUserId();
		
		PayVO payVo = new PayVO();
		//파라미터로 가져갈것.. userid, payId
		payVo.setUserId(userId);
		payVo.setPayId(payId);
		
		MyPayVO mypayVo = new MyPayVO();
		try {
			mypayVo =myPayService.selectMyPay(payVo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("mypayVo", mypayVo);
		
		return "user/mypay/mypay_refund";
	}


}
