package kr.co.codemaker.teacher.course.lesson.vo;

import java.util.List;

import kr.co.codemaker.common.vo.BaseVO;

public class LessonIndexVO extends BaseVO{

	private String lidxId;
	private String lidxNum;
	private String lidxCont;
	private String lesId;
<<<<<<< HEAD
=======
	private int lidxNum;
	private String lidxId;
	
								
	private List<LessonIndexVO> lesIdxList;


	public String getLidxCont() {
		return lidxCont;
	}


>>>>>>> 선생님_강의
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
	
	

}
