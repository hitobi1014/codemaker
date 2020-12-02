package kr.co.codemaker.common.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.common.dao.UserMapper;
import kr.co.codemaker.common.vo.UserVO;

@Service("userService")
public class UserService {

	@Resource(name="userMapper")
	private UserMapper userMapper;
	
	public UserService() {
	}
	
	public int insertUser(UserVO userVo) {
		return userMapper.insertUser(userVo);
	}

	public int idchk(UserVO userVo) {
		return userMapper.idchk(userVo);
	}
	
	
}
