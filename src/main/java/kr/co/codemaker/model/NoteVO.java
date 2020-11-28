package kr.co.codemaker.model;

import java.util.Date;

/**
 * 강의노트 VO
* NoteVO.java
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
public class NoteVO {
	
	private String note_id;     // 강의노트 아이디 
	private String note_title;  // 강의노트 제목
	private String note_cont;   // 강의노트 내용
	private Date note_date;   	// 강의노트 작성일
	private String user_id;		// 회원 아이디
	
	public String getNote_id() {
		return note_id;
	}
	public void setNote_id(String note_id) {
		this.note_id = note_id;
	}
	public String getNote_title() {
		return note_title;
	}
	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}
	public Date getNote_date() {
		return note_date;
	}
	public void setNote_date(Date note_date) {
		this.note_date = note_date;
	}
	public String getNote_cont() {
		return note_cont;
	}
	public void setNote_cont(String note_cont) {
		this.note_cont = note_cont;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "NoteVO [note_id=" + note_id + ", note_title=" + note_title + ", note_date=" + note_date + ", note_cont="
				+ note_cont + ", user_id=" + user_id + "]";
	}
	
}
