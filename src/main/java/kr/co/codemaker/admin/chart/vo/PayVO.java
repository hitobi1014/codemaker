package kr.co.codemaker.admin.chart.vo;

import java.util.Date;

public class PayVO extends LessonVO{

	private String payId;
	private String lesId;
	private int paySum;
	private String payWay;
	private Date payDate;
	private String payRefund;
	private String userId;
	private Date cosTerm;
	private int cosProcess;
	private int payGroup;
	
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
	public String getPayWay() {
		return payWay;
	}
	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public String getPayRefund() {
		return payRefund;
	}
	public void setPayRefund(String payRefund) {
		this.payRefund = payRefund;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getCosTerm() {
		return cosTerm;
	}
	public void setCosTerm(Date cosTerm) {
		this.cosTerm = cosTerm;
	}
	public int getCosProcess() {
		return cosProcess;
	}
	public void setCosProcess(int cosProcess) {
		this.cosProcess = cosProcess;
	}
	public int getPayGroup() {
		return payGroup;
	}
	public void setPayGroup(int payGroup) {
		this.payGroup = payGroup;
	}
	
	

}
