package kr.co.codemaker.model;

/**
 * 기업VO
* CompanyVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 26.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
* 박다미 com_contract 빼고, com_code 추가
 */
public class CompanyVO {
	
	private String com_id;			// 기업 아이디
	private String com_nm;          // 기업명
	private String com_add;         // 기업 주소
	private String com_owner;       // 대표자
	private String com_tel;         // 전화번호
	private String com_code;		 // 기업 코드
	
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getCom_nm() {
		return com_nm;
	}
	public void setCom_nm(String com_nm) {
		this.com_nm = com_nm;
	}
	public String getCom_add() {
		return com_add;
	}
	public void setCom_add(String com_add) {
		this.com_add = com_add;
	}
	public String getCom_owner() {
		return com_owner;
	}
	public void setCom_owner(String com_owner) {
		this.com_owner = com_owner;
	}
	public String getCom_tel() {
		return com_tel;
	}
	public void setCom_tel(String com_tel) {
		this.com_tel = com_tel;
	}
	public String getCom_code() {
		return com_code;
	}
	public void setCom_code(String com_code) {
		this.com_code = com_code;
	}
	@Override
	public String toString() {
		return "CompanyVO [com_id=" + com_id + ", com_nm=" + com_nm + ", com_add=" + com_add + ", com_owner="
				+ com_owner + ", com_tel=" + com_tel + ", com_code=" + com_code + "]";
	}
	
	
}