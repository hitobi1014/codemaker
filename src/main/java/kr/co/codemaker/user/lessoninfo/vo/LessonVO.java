package kr.co.codemaker.user.lessoninfo.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class LessonVO extends BaseVO{

	private String lesState;	// 강의 상태코드
	private String lesId;		// 강의 아이디
	private String lesCont;	// 강의 소개
	private String subId;		// 과목 아이디
	private String lesNm;		// 강의명
	private String tchId;		// 선생님 아이디
	private int lesTerm;		// 강의 기간
	private int lesCash;		// 강의 수강료
	
	private String lidxId;		// 강의목차 아이디
	private int lidxDurtime;	// 강의 전체시간
	private int lidxCurtime;	// 강의 재생시간
	
	
	
	public String getLidxId() {
		return lidxId;
	}
	public void setLidxId(String lidxId) {
		this.lidxId = lidxId;
	}
	public int getLidxDurtime() {
		return lidxDurtime;
	}
	public void setLidxDurtime(int lidxDurtime) {
		this.lidxDurtime = lidxDurtime;
	}
	public int getLidxCurtime() {
		return lidxCurtime;
	}
	public void setLidxCurtime(int lidxCurtime) {
		this.lidxCurtime = lidxCurtime;
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

}
