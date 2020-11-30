package kr.co.codemaker.common.service;

import kr.co.codemaker.model.UsersVO;

public interface UserServiceI {

	int insertUser(UsersVO userVo);

	int idchk(UsersVO userVo);

}
