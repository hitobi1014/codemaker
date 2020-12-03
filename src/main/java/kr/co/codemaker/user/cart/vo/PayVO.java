package kr.co.codemaker.user.cart.vo;

import java.util.Date;

import kr.co.codemaker.common.vo.BaseVO;

public class PayVO extends BaseVO{
	private String payId;			//결제아이디
	private int payGroup;   	//결제그룹
	private String payRefund;  	//결제환불여부
	private String payWay;     	//결제수단
	private int paySum;     	//결제금액
	private Date payDate;    	//결제일
	private Date cosTerm;    	//수강기간
	private int cosProcess; 	//수강진행도
	private String userId;     	//회원아이디
	private String lesId;      	//강의아이디
	
	public PayVO() {}
	public PayVO(String payId, int payGroup, String payRefund, String payWay, int paySum, Date payDate, Date cosTerm,
			int cosProcess, String userId, String lesId) {
		super();
		this.payId = payId;
		this.payGroup = payGroup;
		this.payRefund = payRefund;
		this.payWay = payWay;
		this.paySum = paySum;
		this.payDate = payDate;
		this.cosTerm = cosTerm;
		this.cosProcess = cosProcess;
		this.userId = userId;
		this.lesId = lesId;
	}

	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public int getPayGroup() {
		return payGroup;
	}
	public void setPayGroup(int payGroup) {
		this.payGroup = payGroup;
	}
	public String getPayRefund() {
		return payRefund;
	}
	public void setPayRefund(String payRefund) {
		this.payRefund = payRefund;
	}
	public String getPayWay() {
		return payWay;
	}
	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}
	public int getPaySum() {
		return paySum;
	}
	public void setPaySum(int paySum) {
		this.paySum = paySum;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLesId() {
		return lesId;
	}
	public void setLesId(String lesId) {
		this.lesId = lesId;
	}
}
