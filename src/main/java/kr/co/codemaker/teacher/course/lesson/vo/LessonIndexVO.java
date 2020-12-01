package kr.co.codemaker.teacher.course.lesson.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class LessonIndexVO extends BaseVO{

	private String lidxId;
	private String lidxNum;
	private String lidxCont;
	private String lesId;
	public void setLidxCont(String lidxCont) {
		this.lidxCont = lidxCont; 
	}
	public String getLidxCont() {
		return lidxCont; 
	}
	public void setLesId(String lesId) {
		this.lesId = lesId; 
	}
	public String getLesId() {
		return lesId; 
	}
	public void setLidxNum(String lidxNum) {
		this.lidxNum = lidxNum; 
	}
	public String getLidxNum() {
		return lidxNum; 
	}
	public void setLidxId(String lidxId) {
		this.lidxId = lidxId; 
	}
	public String getLidxId() {
		return lidxId; 
	}

}
