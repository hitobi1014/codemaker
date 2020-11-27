package kr.co.codemaker.common.dao;

import kr.co.codemaker.model.UserVO;

public interface UserDaoI {

	int insertUser(UserVO userVo);

	int idchk(UserVO userVo);

}
