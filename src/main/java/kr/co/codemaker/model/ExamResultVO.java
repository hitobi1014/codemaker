package kr.co.codemaker.model;

/**
 * 시험결과VO
* ExamResultVO.java
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
public class ExamResultVO {
	
	private String er_id;       // 시험결과 아이디
	private String er_answer;   // 학생이 기입한 정답
	private String er_check;    // 오답여부
	private String que_id;      // 시험문제 아이디
	private String user_id;		// 회원 아이디
	
	public String getEr_id() {
		return er_id;
	}
	public void setEr_id(String er_id) {
		this.er_id = er_id;
	}
	public String getEr_answer() {
		return er_answer;
	}
	public void setEr_answer(String er_answer) {
		this.er_answer = er_answer;
	}
	public String getEr_check() {
		return er_check;
	}
	public void setEr_check(String er_check) {
		this.er_check = er_check;
	}
	public String getQue_id() {
		return que_id;
	}
	public void setQue_id(String que_id) {
		this.que_id = que_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "ExamResultVO [er_id=" + er_id + ", er_answer=" + er_answer + ", er_check=" + er_check + ", que_id="
				+ que_id + ", user_id=" + user_id + "]";
	}
	
}
