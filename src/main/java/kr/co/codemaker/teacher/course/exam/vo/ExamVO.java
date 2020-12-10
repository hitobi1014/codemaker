package kr.co.codemaker.teacher.course.exam.vo;

import java.util.Date;
import java.util.List;

import kr.co.codemaker.common.vo.BaseVO;

/**
 * 
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
public class ExamVO extends LessonVO {

	private String examId; 		// 시험 아이디
	private String examNm; 		// 시험명
	private String examState; 	// 시험 등록 상태
	private Date examDate; 		// 시험 작성일
	private String lidxCont;	// 목차명
	
	// 페이징 작업 추가
	private int page; 			// 현재 보여주는 페이지 번호
	private int startPage; 		// 시작 페이지
	private int endPage; 		// 마지막 페이지
	
	

	public String getLidxCont() {
		return lidxCont;
	}

	public void setLidxCont(String lidxCont) {
		this.lidxCont = lidxCont;
	}

	public ExamVO() {

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

}
