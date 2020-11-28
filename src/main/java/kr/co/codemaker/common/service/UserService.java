package kr.co.codemaker.common.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.common.dao.UserDaoI;
import kr.co.codemaker.model.UsersVO;

@Service("userService")
public class UserService implements UserServiceI {

	@Resource(name="userDao")
	private UserDaoI userDao;
	
	@Override
	public int insertUser(UsersVO userVo) {
		return userDao.insertUser(userVo);
	}
	
	
}
