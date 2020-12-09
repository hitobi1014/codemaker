package kr.co.codemaker.user.cart.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class PointVO extends BaseVO{

	private String pointSum;
	private String pointDate;
	private String pointId;
	private String pointGn;
	private String userId;
	private String pointUpdate;
	
	public PointVO() {}
	
	public PointVO(String userId) {
		this.userId = userId;
	}
	public void setPointSum(String pointSum) {
		this.pointSum = pointSum; 
	}
	public String getPointSum() {
		return pointSum; 
	}
	public void setPointDate(String pointDate) {
		this.pointDate = pointDate; 
	}
	public String getPointDate() {
		return pointDate; 
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

}
