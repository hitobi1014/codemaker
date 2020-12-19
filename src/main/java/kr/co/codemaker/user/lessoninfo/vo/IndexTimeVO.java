package kr.co.codemaker.user.lessoninfo.vo;

public class IndexTimeVO {

	private String userId;
	private String lidxId;
	private int lidxCurtime;
	public void setUserId(String userId) {
		this.userId = userId; 
	}
	public String getUserId() {
		return userId; 
	}
	public void setLidxId(String lidxId) {
		this.lidxId = lidxId; 
	}
	public String getLidxId() {
		return lidxId; 
	}
	public void setLidxCurtime(int lidxCurtime) {
		this.lidxCurtime = lidxCurtime; 
	}
	public int getLidxCurtime() {
		return lidxCurtime; 
	}

}
