package kr.co.codemaker.model;

/**
 * 문제 VO
* QuestionVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 24.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
public class QuestionVO {
	
	private String que_id;		// 시험 문제 아이디
	private String que_cont;	// 시험 문제
	private String que_answer;	// 시험 정답
	private String que_explain;	// 문제 해설
	private String exam_id;		// 시험 아이디
	
	public QuestionVO() {
	}
	
	public QuestionVO(String que_id, String que_cont, String que_answer, String que_explain, String exam_id) {
		this.que_id = que_id;
		this.que_cont = que_cont;
		this.que_answer = que_answer;
		this.que_explain = que_explain;
		this.exam_id = exam_id;
	}
	
	public String getQue_id() {
		return que_id;
	}
	public void setQue_id(String que_id) {
		this.que_id = que_id;
	}
	public String getQue_cont() {
		return que_cont;
	}
	public void setQue_cont(String que_cont) {
		this.que_cont = que_cont;
	}
	public String getQue_answer() {
		return que_answer;
	}
	public void setQue_answer(String que_answer) {
		this.que_answer = que_answer;
	}
	public String getQue_explain() {
		return que_explain;
	}
	public void setQue_explain(String que_explain) {
		this.que_explain = que_explain;
	}
	public String getExam_id() {
		return exam_id;
	}
	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
	}
	
	@Override
	public String toString() {
		return "QuestionVO [que_id=" + que_id + ", que_cont=" + que_cont + ", que_answer=" + que_answer
				+ ", que_explain=" + que_explain + ", exam_id=" + exam_id + "]";
	}

}
