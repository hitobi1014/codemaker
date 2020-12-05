package kr.co.codemaker.teacher.course.exam.vo;

/**
 * 시험을 조회하기 위한 VO
* ExamRequestVO.java
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
public class ExamRequestVO {
	
	// 시험 상태에 따라 조회 + 해당 강의의 시험 문제 전체 조회
	// 시험 상태 와 커리큘럼 아이디
	private String examState;	// 시험 등록 상태
	private String lesId;		// 강의 아이디

	// 페이징 작업 추가
	private int page; 			// 현재 보여주는 페이지 번호
//	private int pageSize; 		// 한번에 보여줄 페이지 수 -> 5개로 고정한다.
	private int startPage; 		// 시작 페이지
	private int endPage; 		// 마지막 페이지
	
	public ExamRequestVO() {
	}
	
	public ExamRequestVO(String examState, String lesId, int page) {
		this.examState = examState;
		this.lesId = lesId;
		this.page = page;
	}
	
	
	public String getExamState() {
		return examState;
	}
	public void setExamState(String examState) {
		this.examState = examState;
	}
	public String getLesId() {
		return lesId;
	}
	public void setLesId(String lesId) {
		this.lesId = lesId;
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
	
	@Override
	public String toString() {
		return "ExamRequestVO [examState=" + examState + ", lesId=" + lesId + ", page=" + page + ", startPage="
				+ startPage + ", endPage=" + endPage + "]";
	}
	
}
