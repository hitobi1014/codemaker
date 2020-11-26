package kr.co.codemaker.model;

/**
 * 회원의 블랙리스트VO
* BlackListVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 26.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
public class BlackListVO {
	
	private String user_id;		// 회원의 아이디

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "BlackListVO [user_id=" + user_id + "]";
	}

}
