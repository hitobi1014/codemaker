package kr.co.codemaker.common.service;

import kr.co.codemaker.model.UserVO;

public interface UserServiceI {

	int insertUser(UserVO userVo);

	int idchk(UserVO userVo);

}
