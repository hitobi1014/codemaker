package kr.co.codemaker.user.cart.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.user.cart.dao.UserPayMapper;
import kr.co.codemaker.user.cart.vo.LessonVO;
import kr.co.codemaker.user.cart.vo.PayVO;

@Service("userPayService")
public class UserPayService {
	
	@Resource(name="userPayMapper")
	private UserPayMapper userPayMapper;
	
	public int insertPay(PayVO payVo) throws Exception {
		return userPayMapper.insertPay(payVo);
	}
	
	public LessonVO selectLessonInfo(LessonVO lessonVo) throws Exception {
		return userPayMapper.selectLessonInfo(lessonVo);
	}
}
