package kr.co.codemaker.model;

import java.util.Date;

/**
 * 신고VO
* ComplainVO.java
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
public class ComplainVO {
	
	private String cp_id;       // 신고 아이디 
	private Date cp_date;       // 신고일
	private String cp_cont;     // 신고 내용
	private String cp_errorid;  // 신고된 글 아이디
	private String cp_state;    // 신고 상태코드(신고요청, 확인중, 신고확인/신고취소)
	private String cp_count;	// 신고 횟수
	
	public String getCp_id() {
		return cp_id;
	}
	public void setCp_id(String cp_id) {
		this.cp_id = cp_id;
	}
	public Date getCp_date() {
		return cp_date;
	}
	public void setCp_date(Date cp_date) {
		this.cp_date = cp_date;
	}
	public String getCp_cont() {
		return cp_cont;
	}
	public void setCp_cont(String cp_cont) {
		this.cp_cont = cp_cont;
	}
	public String getCp_errorid() {
		return cp_errorid;
	}
	public void setCp_errorid(String cp_errorid) {
		this.cp_errorid = cp_errorid;
	}
	public String getCp_state() {
		return cp_state;
	}
	public void setCp_state(String cp_state) {
		this.cp_state = cp_state;
	}
	public String getCp_count() {
		return cp_count;
	}
	public void setCp_count(String cp_count) {
		this.cp_count = cp_count;
	}
	
	@Override
	public String toString() {
		return "ComplainVO [cp_id=" + cp_id + ", cp_date=" + cp_date + ", cp_cont=" + cp_cont + ", cp_errorid="
				+ cp_errorid + ", cp_state=" + cp_state + ", cp_count=" + cp_count + "]";
	}
	
}
