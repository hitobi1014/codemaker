package kr.co.codemaker.admin.jobinfo.model;

import java.util.Date;

/**
* JobInfoVO.java
*
* @author 박경호
* @version 1.0
* @since 2020. 11. 25.
*
* 수정자 수정내용
* ------ ------------------------
* 박경호 최초 생성
*
 */
public class JobInfoVO {
	private String job_id;		// 취업 공고 아이디
	private String job_title; 	// 취업 공고 제목
	private String job_cont; 	// 취업 공고 내용
	private Date job_date; 		// 공고 작성 날짜
	private String job_out; 	// 공고 삭제 여부
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
	public JobInfoVO(String job_id, String job_title, String job_cont, Date job_date, String job_out, String admin_id) {
		super();
		this.job_id = job_id;
		this.job_title = job_title;
		this.job_cont = job_cont;
		this.job_date = job_date;
		this.job_out = job_out;
		this.admin_id = admin_id;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((admin_id == null) ? 0 : admin_id.hashCode());
		result = prime * result + ((job_cont == null) ? 0 : job_cont.hashCode());
		result = prime * result + ((job_date == null) ? 0 : job_date.hashCode());
		result = prime * result + ((job_id == null) ? 0 : job_id.hashCode());
		result = prime * result + ((job_out == null) ? 0 : job_out.hashCode());
		result = prime * result + ((job_title == null) ? 0 : job_title.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		JobInfoVO other = (JobInfoVO) obj;
		if (admin_id == null) {
			if (other.admin_id != null)
				return false;
		} else if (!admin_id.equals(other.admin_id))
			return false;
		if (job_cont == null) {
			if (other.job_cont != null)
				return false;
		} else if (!job_cont.equals(other.job_cont))
			return false;
		if (job_date == null) {
			if (other.job_date != null)
				return false;
		} else if (!job_date.equals(other.job_date))
			return false;
		if (job_id == null) {
			if (other.job_id != null)
				return false;
		} else if (!job_id.equals(other.job_id))
			return false;
		if (job_out == null) {
			if (other.job_out != null)
				return false;
		} else if (!job_out.equals(other.job_out))
			return false;
		if (job_title == null) {
			if (other.job_title != null)
				return false;
		} else if (!job_title.equals(other.job_title))
			return false;
		return true;
	}
	
	
}
