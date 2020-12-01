package kr.co.codemaker.user.course.note.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class NoteVO extends BaseVO {

	private String noteId;		// 노트 아이디
	private String noteTitle;	// 노트 제목
	private String noteCont;	// 노트 내용
	private String noteDate;	// 노트 작성일
	private String userId;		// 회원아이디
	
	public void setNoteDate(String noteDate) {
		this.noteDate = noteDate; 
	}
	public String getNoteDate() {
		return noteDate; 
	}
	public void setNoteCont(String noteCont) {
		this.noteCont = noteCont; 
	}
	public String getNoteCont() {
		return noteCont; 
	}
	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle; 
	}
	public String getNoteTitle() {
		return noteTitle; 
	}
	public void setUserId(String userId) {
		this.userId = userId; 
	}
	public String getUserId() {
		return userId; 
	}
	public void setNoteId(String noteId) {
		this.noteId = noteId; 
	}
	public String getNoteId() {
		return noteId; 
	}

}
