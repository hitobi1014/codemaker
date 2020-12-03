package kr.co.codemaker.teacher.course.lesson.vo;

import java.util.List;

import kr.co.codemaker.common.vo.BaseVO;

public class LessonIndexVO extends BaseVO{

	private String lidxCont;
	private String lesId;
	private int lidxNum;
	private String lidxId;
	
	private List<LessonIndexVO> lesIdxList;
	
	public List<LessonIndexVO> getLesIdxList() {
		return lesIdxList;
	}
	public void setLesIdxLsit(List<LessonIndexVO> lesIdxList) {
		this.lesIdxList = lesIdxList;
	}
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
	public void setLidxNum(int lidxNum) {
		this.lidxNum = lidxNum; 
	}
	public int getLidxNum() {
		return lidxNum; 
	}
	public void setLidxId(String lidxId) {
		this.lidxId = lidxId; 
	}
	public String getLidxId() {
		return lidxId; 
	}

}
