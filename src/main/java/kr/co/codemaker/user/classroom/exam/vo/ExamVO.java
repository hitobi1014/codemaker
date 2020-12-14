package kr.co.codemaker.user.classroom.exam.vo;

import java.util.Date;

import kr.co.codemaker.common.vo.BaseVO;

/**
 * 시험VO
* ExamVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 24.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
public class ExamVO extends BaseVO {
	
	private String examId;		// 시험 아이디
	private String examNm;		// 시험명
	private String examState;	// 시험 등록 상태
	private Date examDate;		// 시험 작성일
	private String curId;		// 커리큘럼 아이디
	private String lesId;		// 강의 아이디
	
	private String userId;		// 회원 아이디

	// 페이징 작업 추가
	private int page; 			// 현재 보여주는 페이지 번호
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getLesId() {
		return lesId;
	}
	public void setLesId(String lesId) {
		this.lesId = lesId;
	}
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public String getExamNm() {
		return examNm;
	}
	public void setExamNm(String examNm) {
		this.examNm = examNm;
	}
	public String getExamState() {
		return examState;
	}
	public void setExamState(String examState) {
		this.examState = examState;
	}
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	public String getCurId() {
		return curId;
	}
	public void setCurId(String curId) {
		this.curId = curId;
	}
	
}
