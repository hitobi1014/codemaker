package kr.co.codemaker.model;

/**
 * 수강과목VO
* SubjectVO.java
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
public class SubjectVO {
	
	private String sub_id;		// 과목아이디 
	private String sub_nm; 		// 과목명
	private String sub_out;		// 과목 삭제여부
	
	public String getSub_id() {
		return sub_id;
	}
	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}
	public String getSub_nm() {
		return sub_nm;
	}
	public void setSub_nm(String sub_nm) {
		this.sub_nm = sub_nm;
	}
	public String getSub_out() {
		return sub_out;
	}
	public void setSub_out(String sub_out) {
		this.sub_out = sub_out;
	}
	
	@Override
	public String toString() {
		return "SubjectVO [sub_id=" + sub_id + ", sub_nm=" + sub_nm + ", sub_out=" + sub_out + "]";
	}
	
}
