package kr.co.codemaker.model;

/**
 * 관리자VO
* AdminVO.java
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
public class AdminVO {
	
	private String admin_id;	// 관리자 아이디
	private String admin_pass;	// 관리자 비밀번호
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pass() {
		return admin_pass;
	}
	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}
	
	@Override
	public String toString() {
		return "AdminVO [admin_id=" + admin_id + ", admin_pass=" + admin_pass + "]";
	}
	
}
