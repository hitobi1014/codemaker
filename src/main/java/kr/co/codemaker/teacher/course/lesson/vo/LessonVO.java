package kr.co.codemaker.teacher.course.lesson.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class LessonVO extends BaseVO{

	private String lesState;
	private String lesId;
	private String lesCont;
	private String subId;
	private String lesNm;
	private String tchId;
	private int lesTerm;
	private int lesCash;
	
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
	public void setLesTerm(int lesTerm) {
		this.lesTerm = lesTerm; 
	}
	public int getLesTerm() {
		return lesTerm; 
	}
	public void setLesCash(int lesCash) {
		this.lesCash = lesCash; 
	}
	public int getLesCash() {
		return lesCash; 
	}

}
