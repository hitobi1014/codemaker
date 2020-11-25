package kr.co.codemaker.common.service;

import kr.co.codemaker.user.mypage.model.UserVO;

public interface MainServiceI {

	/**
	* 로그인 시 입력한 회원아이디를 가지고 회원정보 조회
	* @author 최민준
	* @param user_id
	* @return User객체
	*/
	UserVO selectUser(String user_id);
}
