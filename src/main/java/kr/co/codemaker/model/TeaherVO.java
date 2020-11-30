package kr.co.codemaker.model;

import java.util.Date;

/**
 * 선생님VO
* TeaherVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 26.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
* 박다미 res_id, com_id 추가
*
 */
public class TeaherVO {
	
	private String tch_id;			// 선생님 아이디(이메일)
	private String tch_pass;		// 선생님 비밀번호
	private String tch_nm;			// 선생님 이름
	private String tch_tel;			// 선생님 전화번호
	private String tch_profile;     // 선생님 프로필사진
	private String tch_code;        // 선생님 가입인증 코드
	private Date tch_join;        	// 선생님 입사일
	private Date tch_retire;      	// 선생님 퇴사일
	private String tch_intro;       // 선생님 소개말
	private String tch_contract;    // 선생님 계약서(파일)
	private String tch_gn;          // 기업 구분자
	private String res_id;			// 이력서 아이디
	private String com_id;			// 기업 아이디
	
	
	public String getTch_id() {
		return tch_id;
	}
	public void setTch_id(String tch_id) {
		this.tch_id = tch_id;
	}
	public String getTch_pass() {
		return tch_pass;
	}
	public void setTch_pass(String tch_pass) {
		this.tch_pass = tch_pass;
	}
	public String getTch_nm() {
		return tch_nm;
	}
	public void setTch_nm(String tch_nm) {
		this.tch_nm = tch_nm;
	}
	public String getTch_tel() {
		return tch_tel;
	}
	public void setTch_tel(String tch_tel) {
		this.tch_tel = tch_tel;
	}
	public String getTch_profile() {
		return tch_profile;
	}
	public void setTch_profile(String tch_profile) {
		this.tch_profile = tch_profile;
	}
	public String getTch_code() {
		return tch_code;
	}
	public void setTch_code(String tch_code) {
		this.tch_code = tch_code;
	}
	public Date getTch_join() {
		return tch_join;
	}
	public void setTch_join(Date tch_join) {
		this.tch_join = tch_join;
	}
	public Date getTch_retire() {
		return tch_retire;
	}
	public void setTch_retire(Date tch_retire) {
		this.tch_retire = tch_retire;
	}
	public String getTch_intro() {
		return tch_intro;
	}
	public void setTch_intro(String tch_intro) {
		this.tch_intro = tch_intro;
	}
	public String getTch_contract() {
		return tch_contract;
	}
	public void setTch_contract(String tch_contract) {
		this.tch_contract = tch_contract;
	}
	public String getTch_gn() {
		return tch_gn;
	}
	public void setTch_gn(String tch_gn) {
		this.tch_gn = tch_gn;
	}
	
	
	
	public String getRes_id() {
		return res_id;
	}
	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	@Override
	public String toString() {
		return "TeaherVO [tch_id=" + tch_id + ", tch_pass=" + tch_pass + ", tch_nm=" + tch_nm + ", tch_tel=" + tch_tel
				+ ", tch_profile=" + tch_profile + ", tch_code=" + tch_code + ", tch_join=" + tch_join + ", tch_retire="
				+ tch_retire + ", tch_intro=" + tch_intro + ", tch_contract=" + tch_contract + ", tch_gn=" + tch_gn
				+ ", res_id=" + res_id + ", com_id=" + com_id + "]";
	}
	
	
}
