package kr.co.codemaker.admin.course.lesson.vo;

import java.util.List;

/**
 * 
* LessonVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 12. 4.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
public class LessonVO {

	private String lesState;	// 강의 상태
	private String lesId;		// 강의 아이디
	private String lesCont;		// 강의 소개내용
	private String subId;		// 과목아이디
	private String lesNm;		// 강의명
	private String tchId;		// 선생님 아이디
	private int lesTerm;		// 강의기간
	private int lesCash;		// 강의비용
	
	// 페이징 작업 추가
	private int page; 		// 현재 보여주는 페이지 번호
	private int startPage; 	// 시작 페이지
	private int endPage; 	// 마지막 페이지
	
	//---------------------------------------------------------
	public void setLesState(String lesState) {
		this.lesState = lesState; 
	}
	public String getLesState() {
		return lesState; 
	}
	public void setLesId(String lesId) {
		this.lesId = lesId; 
	}
	public String getLesId() {
		return lesId; 
	}
	public void setLesCont(String lesCont) {
		this.lesCont = lesCont; 
	}
	public String getLesCont() {
		return lesCont; 
	}
	public void setSubId(String subId) {
		this.subId = subId; 
	}
	public String getSubId() {
		return subId; 
	}
	public void setLesNm(String lesNm) {
		this.lesNm = lesNm; 
	}
	public String getLesNm() {
		return lesNm; 
	}
	public void setTchId(String tchId) {
		this.tchId = tchId; 
	}
	public String getTchId() {
		return tchId; 
	}
	public int getLesTerm() {
		return lesTerm;
	}
	public void setLesTerm(int lesTerm) {
		this.lesTerm = lesTerm;
	}
	public int getLesCash() {
		return lesCash;
	}
	public void setLesCash(int lesCash) {
		this.lesCash = lesCash;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

}
