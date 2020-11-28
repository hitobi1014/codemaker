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
	
	private String noticeId;		// 공지사항 아이디
	private String noticeTitle;    // 공지사항 제목
	private String noticeCont;     // 공지사항 내용
	private Date noticeDate;       // 공지사항 작성일
	private String noticeOut;      // 공지사항 삭제여부
	private String noticeHead;     // 공지사항 구분자
	private String adminId;        // 관리자 아이디
	@Override
	public String toString() {
		return "NoticeVO [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeCont=" + noticeCont
				+ ", noticeDate=" + noticeDate + ", noticeOut=" + noticeOut + ", noticeHead=" + noticeHead
				+ ", adminId=" + adminId + "]";
	}
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeCont() {
		return noticeCont;
	}
	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeOut() {
		return noticeOut;
	}
	public void setNoticeOut(String noticeOut) {
		this.noticeOut = noticeOut;
	}
	public String getNoticeHead() {
		return noticeHead;
	}
	public void setNoticeHead(String noticeHead) {
		this.noticeHead = noticeHead;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	

}
