package kr.co.codemaker.common.vo;

public class UserVO extends BaseVO{

	private String userPass;
	private String userTel;
	private String userNm;
	private String userId;
	private String userOut;
	private String userBlack;
	public void setUserPass(String userPass) {
		this.userPass = userPass; 
	}
	public String getUserPass() {
		return userPass; 
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel; 
	}
	public String getUserTel() {
		return userTel; 
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm; 
	}
	public String getUserNm() {
		return userNm; 
	}
	public void setUserId(String userId) {
		this.userId = userId; 
	}
	public String getUserId() {
		return userId; 
	}
	public void setUserOut(String userOut) {
		this.userOut = userOut; 
	}
	public String getUserOut() {
		return userOut; 
	}
	public void setUserBlack(String userBlack) {
		this.userBlack = userBlack; 
	}
	public String getUserBlack() {
		return userBlack; 
	}

}
