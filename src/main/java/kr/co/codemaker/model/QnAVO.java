package kr.co.codemaker.model;

import java.util.Date;

/**
 * Q&A VO
* QnAVO.java
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
public class QnAVO {
	
	private String qna_id;		// Q&A 아이디
	private String qna_title;   // Q&A 제목
	private String qna_cont;    // Q&A 내용
	private Date qna_date;      // Q&A 작성일
	private String qna_out;     // Q&A 삭제여부
	private String les_id;      // 강의 아이디
	private String user_id;     // 회원 아이디
	
	public String getQna_id() {
		return qna_id;
	}
	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_cont() {
		return qna_cont;
	}
	public void setQna_cont(String qna_cont) {
		this.qna_cont = qna_cont;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_out() {
		return qna_out;
	}
	public void setQna_out(String qna_out) {
		this.qna_out = qna_out;
	}
	public String getLes_id() {
		return les_id;
	}
	public void setLes_id(String les_id) {
		this.les_id = les_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "QnAVO [qna_id=" + qna_id + ", qna_title=" + qna_title + ", qna_cont=" + qna_cont + ", qna_date="
				+ qna_date + ", qna_out=" + qna_out + ", les_id=" + les_id + ", user_id=" + user_id + "]";
	}

}
