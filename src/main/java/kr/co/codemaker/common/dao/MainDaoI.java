package kr.co.codemaker.common.dao;

import kr.co.codemaker.model.UsersVO;

public interface MainDaoI {

	/**
	* 로그인 시 입력한 회원아이디를 가지고 회원정보 조회
	* @author 최민준
	* @param user_id
	* @return User객체
	*/
	UsersVO selectUser(String user_id);
	
}
