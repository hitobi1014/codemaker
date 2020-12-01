package kr.co.codemaker.user.mypage.vo;

import java.util.Date;

public class PointVO {

	private String pointSum;
	private Date pointDate;
	private String pointId;
	private String pointGn;
	private String userId;
	private String pointUpdate;
	
	public void setPointSum(String pointSum) {
		this.pointSum = pointSum; 
	}
	public String getPointSum() {
		return pointSum; 
	}

	public Date getPointDate() {
		return pointDate;
	}
	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}
	public void setPointId(String pointId) {
		this.pointId = pointId; 
	}
	public String getPointId() {
		return pointId; 
	}
	public void setPointGn(String pointGn) {
		this.pointGn = pointGn; 
	}
	public String getPointGn() {
		return pointGn; 
	}
	public void setUserId(String userId) {
		this.userId = userId; 
	}
	public String getUserId() {
		return userId; 
	}
	public void setPointUpdate(String pointUpdate) {
		this.pointUpdate = pointUpdate; 
	}
	public String getPointUpdate() {
		return pointUpdate; 
	}
	@Override
	public String toString() {
		return "PointVO [pointSum=" + pointSum + ", pointDate=" + pointDate + ", pointId=" + pointId + ", pointGn="
				+ pointGn + ", userId=" + userId + ", pointUpdate=" + pointUpdate + "]";
	}

	
	
}
