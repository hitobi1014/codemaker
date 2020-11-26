package kr.co.codemaker.model;

import java.util.Date;

/**
 * 취업공고 VO
* JobInfoVO.java
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
public class JobInfoVO {
	
	private String job_id;      // 취업공고 아이디 
	private String job_title;   // 취업공고 제목
	private String job_cont;    // 취업공고 내용
	private Date job_date;    	// 취업공고 작성일
	private String job_out;     // 취업공고 삭제여부
	private String admin_id;	// 관리자 아이디
	
	public String getJob_id() {
		return job_id;
	}
	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public String getJob_cont() {
		return job_cont;
	}
	public void setJob_cont(String job_cont) {
		this.job_cont = job_cont;
	}
	public Date getJob_date() {
		return job_date;
	}
	public void setJob_date(Date job_date) {
		this.job_date = job_date;
	}
	public String getJob_out() {
		return job_out;
	}
	public void setJob_out(String job_out) {
		this.job_out = job_out;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	@Override
	public String toString() {
		return "JobInfoVO [job_id=" + job_id + ", job_title=" + job_title + ", job_cont=" + job_cont + ", job_date="
				+ job_date + ", job_out=" + job_out + ", admin_id=" + admin_id + "]";
	}
	
}
