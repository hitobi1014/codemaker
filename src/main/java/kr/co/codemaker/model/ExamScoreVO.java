package kr.co.codemaker.model;

/**
 * 시험점수 VO
* ExamScoreVO.java
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
public class ExamScoreVO {
	
	private String es_id;		// 시험점수 아이디 
	private String es_fscroe;   // 시험점수 첫 점수
	private String exam_lscore; // 시험점수 다시풀기 점수(다시 풀때마다 계속 수정됨)
	private String exam_id;     // 시험 아이디
	private String user_id;     // 회원 아이디
	
	public String getEs_id() {
		return es_id;
	}
	public void setEs_id(String es_id) {
		this.es_id = es_id;
	}
	public String getEs_fscroe() {
		return es_fscroe;
	}
	public void setEs_fscroe(String es_fscroe) {
		this.es_fscroe = es_fscroe;
	}
	public String getExam_lscore() {
		return exam_lscore;
	}
	public void setExam_lscore(String exam_lscore) {
		this.exam_lscore = exam_lscore;
	}
	public String getExam_id() {
		return exam_id;
	}
	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "ExamScoreVO [es_id=" + es_id + ", es_fscroe=" + es_fscroe + ", exam_lscore=" + exam_lscore
				+ ", exam_id=" + exam_id + ", user_id=" + user_id + "]";
	}
	
}
