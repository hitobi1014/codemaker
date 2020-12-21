package kr.co.codemaker.common.vo;

import java.util.Date;

public class ComplainVO extends BaseVO {

	private String qnaId;
	private String replyId;
	private String cpId;
	private String cpState;
	private String cpCont;
	private String cpGn;
	private Date cpDate;
	private String cpCount;
	
	private String userId;
	
	public Date getCpDate() {
		return cpDate;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setCpDate(Date cpDate) {
		this.cpDate = cpDate;
	}
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public void setQnaId(String qnaId) {
		this.qnaId = qnaId; 
	}
	public String getQnaId() {
		return qnaId; 
	}
	public void setCpId(String cpId) {
		this.cpId = cpId; 
	}
	public String getCpId() {
		return cpId; 
	}
	public void setCpState(String cpState) {
		this.cpState = cpState; 
	}
	public String getCpState() {
		return cpState; 
	}
	public void setCpCont(String cpCont) {
		this.cpCont = cpCont; 
	}
	public String getCpCont() {
		return cpCont; 
	}
	public void setCpGn(String cpGn) {
		this.cpGn = cpGn; 
	}
	public String getCpGn() {
		return cpGn; 
	}
	public void setCpCount(String cpCount) {
		this.cpCount = cpCount; 
	}
	public String getCpCount() {
		return cpCount; 
	}

}
