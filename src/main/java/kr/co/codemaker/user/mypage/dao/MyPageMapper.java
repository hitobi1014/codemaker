package kr.co.codemaker.user.mypage.dao;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.common.model.UserVO;

@Mapper("myPageMapper")
public interface MyPageMapper{

	UserVO myinfoSelect(String userId) throws Exception;

	int deleteUser(String userId)throws Exception;

	int updateUser(UserVO userId)throws Exception;


}
