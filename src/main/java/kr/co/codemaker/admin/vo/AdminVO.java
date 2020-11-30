package kr.co.codemaker.admin.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class AdminVO extends BaseVO {

	private String adminId;
	private String adminPass;
	
	public void setAdminId(String adminId) {
		this.adminId = adminId; 
	}
	public String getAdminId() {
		return adminId; 
	}
	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass; 
	}
	public String getAdminPass() {
		return adminPass; 
	}

}
