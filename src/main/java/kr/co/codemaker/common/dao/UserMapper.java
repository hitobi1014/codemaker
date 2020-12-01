package kr.co.codemaker.common.dao;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.common.vo.UserVO;

@Mapper("userMapper")
public interface UserMapper {

	int insertUser(UserVO userVo);

	int idchk(UserVO userVo);

}
