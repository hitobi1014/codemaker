package kr.co.codemaker.admin.chart.vo;

import java.util.Date;

public class TeacherPayVO {

	private String payId;
	private String lesId;
	private int paySum;
	private String lesNm;
	private Date payDate;
	private String tchId;
	private String tchNm;
	
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getLesId() {
		return lesId;
	}
	public void setLesId(String lesId) {
		this.lesId = lesId;
	}
	public int getPaySum() {
		return paySum;
	}
	public void setPaySum(int paySum) {
		this.paySum = paySum;
	}
	public String getLesNm() {
		return lesNm;
	}
	public void setLesNm(String lesNm) {
		this.lesNm = lesNm;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public String getTchId() {
		return tchId;
	}
	public void setTchId(String tchId) {
		this.tchId = tchId;
	}
	public String getTchNm() {
		return tchNm;
	}
	public void setTchNm(String tchNm) {
		this.tchNm = tchNm;
	}
	

}
