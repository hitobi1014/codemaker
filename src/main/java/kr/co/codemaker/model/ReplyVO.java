package kr.co.codemaker.model;

import java.util.Date;

/**
 * Q&A 댓글 VO
* ReplyVO.java
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
public class ReplyVO {
	
	private String reply_id;        // 댓글 아이디
	private Date reply_cont;      // 댓글 내용
	private String reply_date;      // 댓글 작성일
	private String reply_out;       // 댓글 삭제여부
	private String reply_gn;        // 댓글 구분코드
	private String reply_root;      // 댓글 부모코드
	private String reply_writer;	// 댓글 작성자(회원 아이디 또는 선생님 아이디)
	
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public Date getReply_cont() {
		return reply_cont;
	}
	public void setReply_cont(Date reply_cont) {
		this.reply_cont = reply_cont;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_out() {
		return reply_out;
	}
	public void setReply_out(String reply_out) {
		this.reply_out = reply_out;
	}
	public String getReply_gn() {
		return reply_gn;
	}
	public void setReply_gn(String reply_gn) {
		this.reply_gn = reply_gn;
	}
	public String getReply_root() {
		return reply_root;
	}
	public void setReply_root(String reply_root) {
		this.reply_root = reply_root;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [reply_id=" + reply_id + ", reply_cont=" + reply_cont + ", reply_date=" + reply_date
				+ ", reply_out=" + reply_out + ", reply_gn=" + reply_gn + ", reply_root=" + reply_root
				+ ", reply_writer=" + reply_writer + "]";
	}
	
}
