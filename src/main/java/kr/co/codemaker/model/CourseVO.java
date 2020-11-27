package kr.co.codemaker.model;

/**
 * 수강VO
* CourseVO.java
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
public class CourseVO {
	
	private String cos_id;		// 수강 아이디
	private String cos_term;	// 수강 기간
	private int cos_process;	// 수강 진행도
	private String pay_id;		// 결제 아이디
	
	public String getCos_id() {
		return cos_id;
	}
	public void setCos_id(String cos_id) {
		this.cos_id = cos_id;
	}
	public String getCos_term() {
		return cos_term;
	}
	public void setCos_term(String cos_term) {
		this.cos_term = cos_term;
	}
	public int getCos_process() {
		return cos_process;
	}
	public void setCos_process(int cos_process) {
		this.cos_process = cos_process;
	}
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	
	@Override
	public String toString() {
		return "CourseVO [cos_id=" + cos_id + ", cos_term=" + cos_term + ", cos_process=" + cos_process + ", pay_id="
				+ pay_id + "]";
	}
	
}
