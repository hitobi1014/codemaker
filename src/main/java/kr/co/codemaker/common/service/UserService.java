package kr.co.codemaker.common.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.common.dao.UserDaoI;
import kr.co.codemaker.model.UserVO;

@Service("userService")
public class UserService implements UserServiceI {

	@Resource(name="userDao")
	private UserDaoI userDao;
	
	public UserService() {
	}
	
	@Override
	public int insertUser(UserVO userVo) {
		return userDao.insertUser(userVo);
	}

	@Override
	public int idchk(UserVO userVo) {
		return userDao.idchk(userVo);
	}
	
	
}
