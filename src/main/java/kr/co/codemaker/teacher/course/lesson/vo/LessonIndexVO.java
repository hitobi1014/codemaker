package kr.co.codemaker.teacher.course.lesson.vo;

import java.util.List;

import kr.co.codemaker.common.vo.BaseVO;

public class LessonIndexVO extends BaseVO{

	private String lidxId; 	// 목차아이디
	private String lidxCont;	// 목차 과정내용
	private String lesId;		// 강의아이디
	private int lidxNum;		// 목차 강의차수
	private String lidxPath;	// 목차 주소
	
								
	private List<LessonIndexVO> lesIdxList;


	public String getLidxCont() {
		return lidxCont;
	}


	public void setLidxCont(String lidxCont) {
		this.lidxCont = lidxCont;
	}


	public String getLesId() {
		return lesId;
	}


	public void setLesId(String lesId) {
		this.lesId = lesId;
	}


	public int getLidxNum() {
		return lidxNum;
	}


	public void setLidxNum(int lidxNum) {
		this.lidxNum = lidxNum;
	}


	public String getLidxId() {
		return lidxId;
	}


	public void setLidxId(String lidxId) {
		this.lidxId = lidxId;
	}


	public List<LessonIndexVO> getLesIdxList() {
		return lesIdxList;
	}


	public void setLesIdxList(List<LessonIndexVO> lesIdxList) {
		this.lesIdxList = lesIdxList;
	}


	public String getLidxPath() {
		return lidxPath;
	}


	public void setLidxPath(String lidxPath) {
		this.lidxPath = lidxPath;
	}
	
	
	

}
