package kr.co.codemaker.teacher.course.exam.vo;

/**
 * 문제 보기VO
* AnswersheetVO.java
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
public class AnswersheetVO {
	
	private String ans_id;		// 보기 아이디
	private String ans_cont;	// 보기 내용
	private String que_id;		// 시험문제 아이디
	
	public AnswersheetVO() {
	}
	
	public AnswersheetVO(String ans_id, String ans_cont, String que_id) {
		
		this.ans_id = ans_id;
		this.ans_cont = ans_cont;
		this.que_id = que_id;
	}
	
	public String getAns_id() {
		return ans_id;
	}
	public void setAns_id(String ans_id) {
		this.ans_id = ans_id;
	}
	public String getAns_cont() {
		return ans_cont;
	}
	public void setAns_cont(String ans_cont) {
		this.ans_cont = ans_cont;
	}
	public String getQue_id() {
		return que_id;
	}
	public void setQue_id(String que_id) {
		this.que_id = que_id;
	}
	
	@Override
	public String toString() {
		return "AnswersheetVO [ans_id=" + ans_id + ", ans_cont=" + ans_cont + ", que_id=" + que_id + "]";
	}

}
