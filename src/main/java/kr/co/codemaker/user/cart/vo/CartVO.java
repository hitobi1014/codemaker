package kr.co.codemaker.user.cart.vo;

public class CartVO {
	private String lesId;
	private String userId;
	
	public CartVO() {
	}

	public CartVO(String userId) {
		this.userId = userId;
	}

	public void setLesId(String lesId) {
		this.lesId = lesId; 
	}
	public String getLesId() {
		return lesId; 
	}
	public void setUserId(String userId) {
		this.userId = userId; 
	}
	public String getUserId() {
		return userId; 
	}
	
	@Override
	public String toString() {
		return "CartVO [lesId=" + lesId + ", userId=" + userId + "]";
	}
	
	
}
