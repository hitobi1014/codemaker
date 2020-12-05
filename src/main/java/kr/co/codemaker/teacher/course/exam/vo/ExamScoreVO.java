package kr.co.codemaker.teacher.course.exam.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class ExamScoreVO extends BaseVO {
	
	private String examId;	// 시험 아이디
	private String userId;	// 회원 아이디
	private int esFscore;	// 첫점수
	private int esLscore;	// 다시풀기 점수
	
	public ExamScoreVO() {
	
	}
	
	public ExamScoreVO(String examId, String userId) {
		this.examId = examId;
		this.userId = userId;
	}
	
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getEsFscore() {
		return esFscore;
	}
	public void setEsFscore(int esFscore) {
		this.esFscore = esFscore;
	}
	public int getEsLscore() {
		return esLscore;
	}
	public void setEsLscore(int esLscore) {
		this.esLscore = esLscore;
	}
	
	
}
