package kr.co.codemaker.common.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.codemaker.common.dao.LoginMapper;
import kr.co.codemaker.common.vo.UserVO;

@Service("loginService")
public class LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Resource(name="loginMapper")
	private LoginMapper loginMapper;
	
	public UserVO selectUser(String userId) throws Exception {
		logger.debug("로그인 서비스");
		return loginMapper.selectUser(userId);
	}
}
