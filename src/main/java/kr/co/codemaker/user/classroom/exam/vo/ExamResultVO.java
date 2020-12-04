package kr.co.codemaker.user.classroom.exam.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class ExamResultVO extends BaseVO {
	
	private String queId;		// 문제 아이디
	private String userId;		// 회원 아이디
	private String erAnswer;	// 학생 정답
	private String erCheck;		// 오답 여부
	private String examId;		// 시험 아이디
	
	public String getQueId() {
		return queId;
	}
	public void setQueId(String queId) {
		this.queId = queId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getErAnswer() {
		return erAnswer;
	}
	public void setErAnswer(String erAnswer) {
		this.erAnswer = erAnswer;
	}
	public String getErCheck() {
		return erCheck;
	}
	public void setErCheck(String erCheck) {
		this.erCheck = erCheck;
	}
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	
	
}
