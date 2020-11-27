package kr.co.codemaker.model;

import java.util.Date;

/**
 * 결제VO
* PayVO.java
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
public class PayVO {
	
	private String pay_id;		// 결제 아이디
	private String pay_refund;  // 환불 여부
	private String pay_way;     // 결제 수단
	private String pay_sum;     // 결제 금액
	private Date pay_date;      // 결제일
	private String user_id;     // 회원 아이디
	private String les_id;		// 강의 아이디
	
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	public String getPay_refund() {
		return pay_refund;
	}
	public void setPay_refund(String pay_refund) {
		this.pay_refund = pay_refund;
	}
	public String getPay_way() {
		return pay_way;
	}
	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}
	public String getPay_sum() {
		return pay_sum;
	}
	public void setPay_sum(String pay_sum) {
		this.pay_sum = pay_sum;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLes_id() {
		return les_id;
	}
	public void setLes_id(String les_id) {
		this.les_id = les_id;
	}
	
	@Override
	public String toString() {
		return "PayVO [pay_id=" + pay_id + ", pay_refund=" + pay_refund + ", pay_way=" + pay_way + ", pay_sum="
				+ pay_sum + ", pay_date=" + pay_date + ", user_id=" + user_id + ", les_id=" + les_id + "]";
	}
	

}
