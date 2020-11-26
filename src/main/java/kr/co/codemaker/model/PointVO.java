package kr.co.codemaker.model;

import java.util.Date;

/**
 * 포인트VO
* PointVO.java
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
public class PointVO {
	
	private String point_id;		// 포인트 아이디
	private Date point_date;      // 포인트 사용일
	private String point_update;	// 포인트 금액 내역
	private String point_gn;        // 포인트 사용구분(적립, 환불, 사용)
	private String point_sum;       // 남은 포인트
	private String user_id;		    // 회원 아이디
	
	public String getPoint_id() {
		return point_id;
	}
	public void setPoint_id(String point_id) {
		this.point_id = point_id;
	}
	public Date getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}
	public String getPoint_update() {
		return point_update;
	}
	public void setPoint_update(String point_update) {
		this.point_update = point_update;
	}
	public String getPoint_gn() {
		return point_gn;
	}
	public void setPoint_gn(String point_gn) {
		this.point_gn = point_gn;
	}
	public String getPoint_sum() {
		return point_sum;
	}
	public void setPoint_sum(String point_sum) {
		this.point_sum = point_sum;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "PointVO [point_id=" + point_id + ", point_date=" + point_date + ", point_update=" + point_update
				+ ", point_gn=" + point_gn + ", point_sum=" + point_sum + ", user_id=" + user_id + "]";
	}
	
}
