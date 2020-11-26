package kr.co.codemaker.model;

/**
 * 이력서VO
* ResumeVO.java
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
public class ResumeVO {
	
	private String res_id;          // 이력서 아이디
	private String res_nm;          // 이름
	private String res_tel;         // 전화번호
	private String res_mail;        // 이메일(중복체크 - 기존 선생님의 이메일과 비교)
	private String res_profile;     // 프로필 사진
	private String res_motive;      // 지원동기
	private String res_edu;         // 학력
	private String res_license;     // 자격증
	private String res_career;      // 경력
	private String res_state;		// 관리자 승인상태(지원 요청, 확인, 승인여부)
	
	public String getRes_id() {
		return res_id;
	}
	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}
	public String getRes_nm() {
		return res_nm;
	}
	public void setRes_nm(String res_nm) {
		this.res_nm = res_nm;
	}
	public String getRes_tel() {
		return res_tel;
	}
	public void setRes_tel(String res_tel) {
		this.res_tel = res_tel;
	}
	public String getRes_mail() {
		return res_mail;
	}
	public void setRes_mail(String res_mail) {
		this.res_mail = res_mail;
	}
	public String getRes_profile() {
		return res_profile;
	}
	public void setRes_profile(String res_profile) {
		this.res_profile = res_profile;
	}
	public String getRes_motive() {
		return res_motive;
	}
	public void setRes_motive(String res_motive) {
		this.res_motive = res_motive;
	}
	public String getRes_edu() {
		return res_edu;
	}
	public void setRes_edu(String res_edu) {
		this.res_edu = res_edu;
	}
	public String getRes_license() {
		return res_license;
	}
	public void setRes_license(String res_license) {
		this.res_license = res_license;
	}
	public String getRes_career() {
		return res_career;
	}
	public void setRes_career(String res_career) {
		this.res_career = res_career;
	}
	public String getRes_state() {
		return res_state;
	}
	public void setRes_state(String res_state) {
		this.res_state = res_state;
	}
	
	@Override
	public String toString() {
		return "ResumeVO [res_id=" + res_id + ", res_nm=" + res_nm + ", res_tel=" + res_tel + ", res_mail=" + res_mail
				+ ", res_profile=" + res_profile + ", res_motive=" + res_motive + ", res_edu=" + res_edu
				+ ", res_license=" + res_license + ", res_career=" + res_career + ", res_state=" + res_state + "]";
	}
	
}
