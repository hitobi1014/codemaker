package kr.co.codemaker.admin.teacher.vo;

import java.util.Date;

import kr.co.codemaker.common.vo.BaseVO;

public class TeacherVO extends BaseVO{

	private String tchGn;
	private String tchPass;
	private String tchTel;
	private String tchId;
	private String tchCode;
	private String resId;
	private String tchNm;
	private Date tchJoin;
	private String tchIntro;
	private String tchProfile;
	private Date tchRetire;
	private String comId;
	
	public String getTchProfile() {
		return tchProfile;
	}
	public void setTchProfile(String tchProfile) {
		this.tchProfile = tchProfile;
	}
	public Date getTchRetire() {
		return tchRetire;
	}
	public void setTchRetire(Date tchRetire) {
		this.tchRetire = tchRetire;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public void setTchGn(String tchGn) {
		this.tchGn = tchGn; 
	}
	public String getTchGn() {
		return tchGn; 
	}
	public void setTchPass(String tchPass) {
		this.tchPass = tchPass; 
	}
	public String getTchPass() {
		return tchPass; 
	}
	public void setTchTel(String tchTel) {
		this.tchTel = tchTel; 
	}
	public String getTchTel() {
		return tchTel; 
	}
	public void setTchId(String tchId) {
		this.tchId = tchId; 
	}
	public String getTchId() {
		return tchId; 
	}
	public void setTchCode(String tchCode) {
		this.tchCode = tchCode; 
	}
	public String getTchCode() {
		return tchCode; 
	}
	public void setResId(String resId) {
		this.resId = resId; 
	}
	public String getResId() {
		return resId; 
	}
	public void setTchNm(String tchNm) {
		this.tchNm = tchNm; 
	}
	public String getTchNm() {
		return tchNm; 
	}
	public void setTchJoin(Date tchJoin) {
		this.tchJoin = tchJoin; 
	}
	public Date getTchJoin() {
		return tchJoin; 
	}
	public void setTchIntro(String tchIntro) {
		this.tchIntro = tchIntro; 
	}
	public String getTchIntro() {
		return tchIntro; 
	}

}
