package kr.co.codemaker.model;

import java.util.Date;

/**
 * 스케줄VO
* ScheduleVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 26.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
public class ScheduleVO {
	
	private String sch_id;			// 스케줄 아이디
	private Date sch_date;        	// 스케줄 날짜
	private String sch_time;        // 스케줄 시간
	private String sch_cont;        // 스케줄 내용
	private String sch_writer;      // 스케줄 작성자(관리자 아이디 또는 선생님 아이디)
	
	public String getSch_id() {
		return sch_id;
	}
	public void setSch_id(String sch_id) {
		this.sch_id = sch_id;
	}
	public Date getSch_date() {
		return sch_date;
	}
	public void setSch_date(Date sch_date) {
		this.sch_date = sch_date;
	}
	public String getSch_time() {
		return sch_time;
	}
	public void setSch_time(String sch_time) {
		this.sch_time = sch_time;
	}
	public String getSch_cont() {
		return sch_cont;
	}
	public void setSch_cont(String sch_cont) {
		this.sch_cont = sch_cont;
	}
	public String getSch_writer() {
		return sch_writer;
	}
	public void setSch_writer(String sch_writer) {
		this.sch_writer = sch_writer;
	}
	
	@Override
	public String toString() {
		return "ScheduleVO [sch_id=" + sch_id + ", sch_date=" + sch_date + ", sch_time=" + sch_time + ", sch_cont="
				+ sch_cont + ", sch_writer=" + sch_writer + "]";
	}

}
