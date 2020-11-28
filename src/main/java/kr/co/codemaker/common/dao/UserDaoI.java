package kr.co.codemaker.common.dao;

import kr.co.codemaker.model.UsersVO;

public interface UserDaoI {

	int insertUser(UsersVO userVo);

	int idchk(UsersVO userVo);

}
