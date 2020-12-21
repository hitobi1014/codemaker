package kr.co.codemaker.user.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.codemaker.admin.chart.vo.PayVO;
import kr.co.codemaker.common.vo.PageVo;
import kr.co.codemaker.user.mypage.dao.MyPayMapper;
import kr.co.codemaker.user.mypage.vo.MyPayVO;
import kr.co.codemaker.user.mypage.vo.PointVO;

@Service("myPayService")
public class MyPayService {
	@Resource(name="myPayMapper")
	private MyPayMapper myPayMapper;


	public Map<String, Object> selectAllMyPay(PageVo pageVo)  {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("myPay", myPayMapper.selectAllMyPay(pageVo));
		} catch (Exception e) {
			e.printStackTrace();
		}
		int totalCnt=0;
		
		try {
			totalCnt = myPayMapper.selectTotalCnt(pageVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int pages = (int)Math.ceil((double)totalCnt/5); 
		map.put("pages", pages);
		
		return map;
	}


	public MyPayVO selectMyPay(PayVO payVo) throws Exception {
		return myPayMapper.selectMyPay(payVo);
	}


	public int payRefund(String payId) throws Exception {
		return myPayMapper.payRefund(payId);
	}


	public int insertRefund(PointVO pointVo) throws Exception {
		return myPayMapper.insertRefund(pointVo);
	}


	

	
}
