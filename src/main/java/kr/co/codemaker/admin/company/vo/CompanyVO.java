package kr.co.codemaker.admin.company.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class CompanyVO extends BaseVO{

	private String comCode;
	private String comOwner;
	private String comTel;
	private String comAdd;
	private String comId;
	private String comNm;
	public void setComCode(String comCode) {
		this.comCode = comCode; 
	}
	public String getComCode() {
		return comCode; 
	}
	public void setComOwner(String comOwner) {
		this.comOwner = comOwner; 
	}
	public String getComOwner() {
		return comOwner; 
	}
	public void setComTel(String comTel) {
		this.comTel = comTel; 
	}
	public String getComTel() {
		return comTel; 
	}
	public void setComAdd(String comAdd) {
		this.comAdd = comAdd; 
	}
	public String getComAdd() {
		return comAdd; 
	}
	public void setComId(String comId) {
		this.comId = comId; 
	}
	public String getComId() {
		return comId; 
	}
	public void setComNm(String comNm) {
		this.comNm = comNm; 
	}
	public String getComNm() {
		return comNm; 
	}

}
