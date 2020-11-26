package kr.co.codemaker.common.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.common.dao.UserDaoI;
import kr.co.codemaker.common.model.UserVO;

@Service("userService")
public class UserService implements UserServiceI {

	@Resource(name="userDao")
	private UserDaoI userDao;
	
	public UserService() {
	}

	@Override
	public int insertUser(UserVO userVo) {
		// TODO Auto-generated method stub
		return userDao.insertUser(userVo);
	}
	
	
}
