package kr.co.codemaker.teacher.course.exam.vo;

import java.util.Date;

/**
 * 시험VO
* ExamVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 24.
*
* 수정자 수정내용
* 시험 문제 전체 조회의 성능상의 문제로 인하여 강의 아이디 컬럼을 추가하였다.(반정규화)
* ------ ------------------------
* 김미연 최초 생성
*
 */
public class ExamVO {
	
	private String exam_id;		// 시험 아이디
	private String exam_nm;		// 시험명
	private String exam_state;	// 시험 등록 상태
	private Date exam_date;		// 시험 작성일
	private String les_id;		// 강의 아이디
	private String cur_id;		// 커리큘럼 아이디
	
	public ExamVO() {
	}
	
	public ExamVO(String exam_id, String exam_nm, String exam_state, Date exam_date, String cur_id, String les_id) {
		
		this.exam_id = exam_id;
		this.exam_nm = exam_nm;
		this.exam_state = exam_state;
		this.exam_date = exam_date;
		this.les_id = les_id;
		this.cur_id = cur_id;
	}
	
	
	public String getExam_id() {
		return exam_id;
	}
	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
	}
	public String getExam_nm() {
		return exam_nm;
	}
	public void setExam_nm(String exam_nm) {
		this.exam_nm = exam_nm;
	}
	public String getExam_state() {
		return exam_state;
	}
	public void setExam_state(String exam_state) {
		this.exam_state = exam_state;
	}
	public Date getExam_date() {
		return exam_date;
	}
	public void setExam_date(Date exam_date) {
		this.exam_date = exam_date;
	}
	public String getCur_id() {
		return cur_id;
	}
	public void setCur_id(String cur_id) {
		this.cur_id = cur_id;
	}
	public String getLes_id() {
		return les_id;
	}
	public void setLes_id(String les_id) {
		this.les_id = les_id;
	}
	
	@Override
	public String toString() {
		return "ExamVO [exam_id=" + exam_id + ", exam_nm=" + exam_nm + ", exam_state=" + exam_state + ", exam_date="
				+ exam_date + ", cur_id=" + cur_id + ", les_id=" + les_id + "]";
	}

}
