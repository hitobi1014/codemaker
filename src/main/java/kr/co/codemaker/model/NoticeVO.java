package kr.co.codemaker.model;

import java.util.Date;

/**
 * 공지사항 게시판VO
* NoticeVO.java
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
public class NoticeVO {
	
	private String notice_id;		// 공지사항 아이디
	private String notice_title;    // 공지사항 제목
	private String notice_cont;     // 공지사항 내용
	private Date notice_date;       // 공지사항 작성일
	private String notice_out;      // 공지사항 삭제여부
	private String notice_head;     // 공지사항 구분자
	private String admin_id;        // 관리자 아이디
	
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_cont() {
		return notice_cont;
	}
	public void setNotice_cont(String notice_cont) {
		this.notice_cont = notice_cont;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_out() {
		return notice_out;
	}
	public void setNotice_out(String notice_out) {
		this.notice_out = notice_out;
	}
	public String getNotice_head() {
		return notice_head;
	}
	public void setNotice_head(String notice_head) {
		this.notice_head = notice_head;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notice_id=" + notice_id + ", notice_title=" + notice_title + ", notice_cont=" + notice_cont
				+ ", notice_date=" + notice_date + ", notice_out=" + notice_out + ", notice_head=" + notice_head
				+ ", admin_id=" + admin_id + "]";
	}

}
