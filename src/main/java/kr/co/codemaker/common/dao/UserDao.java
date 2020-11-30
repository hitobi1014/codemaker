package kr.co.codemaker.common.dao;

import org.springframework.stereotype.Repository;

import kr.co.codemaker.model.UsersVO;

@Repository("userDao")
public class UserDao implements UserDaoI {

	@Override
	public int insertUser(UsersVO userVo) {
		return 0;
	}

	@Override
	public int idchk(UsersVO userVo) {
		return 0;
	}

}
