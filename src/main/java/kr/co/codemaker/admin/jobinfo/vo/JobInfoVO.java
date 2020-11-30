package kr.co.codemaker.admin.jobinfo.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class JobInfoVO extends BaseVO{

	private String jobinfoTitle;
	private String jobinfoOut;
	private String jobinfoId;
	private String adminId;
	private String jobinfoDate;
	private String jobinfoCont;
	
	public void setJobinfoTitle(String jobinfoTitle) {
		this.jobinfoTitle = jobinfoTitle; 
	}
	public String getJobinfoTitle() {
		return jobinfoTitle; 
	}
	public void setJobinfoOut(String jobinfoOut) {
		this.jobinfoOut = jobinfoOut; 
	}
	public String getJobinfoOut() {
		return jobinfoOut; 
	}
	public void setJobinfoId(String jobinfoId) {
		this.jobinfoId = jobinfoId; 
	}
	public String getJobinfoId() {
		return jobinfoId; 
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId; 
	}
	public String getAdminId() {
		return adminId; 
	}
	public void setJobinfoDate(String jobinfoDate) {
		this.jobinfoDate = jobinfoDate; 
	}
	public String getJobinfoDate() {
		return jobinfoDate; 
	}
	public void setJobinfoCont(String jobinfoCont) {
		this.jobinfoCont = jobinfoCont; 
	}
	public String getJobinfoCont() {
		return jobinfoCont; 
	}

}
