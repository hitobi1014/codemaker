package kr.co.codemaker.common.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.common.vo.UserVO;

/**
* LoginMapper.java
*
* @author 최민준
* @version 1.0
* @since 2020. 11. 30.
*
* 수정자 수정내용
* ------ ------------------------
* 최민준 최초 작성 (11.30)
* 		 아이디 찾기 작성 (12.1)
* 		 비밀번호 찾기 작성
*
 */
@Mapper("loginMapper")
public interface LoginMapper {
	/**
	 * 로그인시 회원 아이디로 나머지 정보 조회
	 * @param 회원 아이디
	*/
	public UserVO selectUser(String userId) throws Exception;
	
	/**
	 * 아이디 또는 비밀번호 찾을 때 회원정보 조회
	 * @param 회원의 전화번호, 이름 또는 전화번호, 아이디
	*/
	public UserVO findUserInfo(UserVO userVo) throws Exception;
	
	/**
	* @param 회원아이디, 변경할 비밀번호
	*/
	public int updateUserPass(UserVO userVo) throws Exception;
	
}

