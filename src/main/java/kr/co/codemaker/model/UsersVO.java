package kr.co.codemaker.model;

/**
 * 회원 VO
* UserVO.java
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
public class UsersVO {

	String user_id;         //회원의 아이디(이메일)
	String user_pass;       //회원의 비밀번호
	String user_nm;         //회원의 이름
	String user_tel;        //회원의 전화번호
	String user_profile;    //회원의 프로필
	String user_out;        //회원의 탈퇴여부
	String user_black;      //회원의 블랙여부
	
	public UsersVO() {
		
	}
	
	public UsersVO(String user_id, String user_pass, String user_nm, String user_tel, String user_profile,
			String user_out, String user_black) {
		
		this.user_id = user_id;
		this.user_pass = user_pass;
		this.user_nm = user_nm;
		this.user_tel = user_tel;
		this.user_profile = user_profile;
		this.user_out = user_out;
		this.user_black = user_black;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_profile() {
		return user_profile;
	}
	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}
	public String getUser_out() {
		return user_out;
	}
	public void setUser_out(String user_out) {
		this.user_out = user_out;
	}
	public String getUser_black() {
		return user_black;
	}
	public void setUser_black(String user_black) {
		this.user_black = user_black;
	}
	
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_pass=" + user_pass + ", user_nm=" + user_nm + ", user_tel="
				+ user_tel + ", user_profile=" + user_profile + ", user_out=" + user_out + ", user_black=" + user_black
				+ "]";
	}
	
	
	
}
