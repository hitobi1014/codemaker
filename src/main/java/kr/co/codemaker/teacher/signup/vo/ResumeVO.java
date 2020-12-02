package kr.co.codemaker.teacher.signup.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class ResumeVO extends BaseVO{

	private String resId;
	private String resCode;
	private String resNm;
	private String resTel;
	private String resMail;
	private String resProfile;
	private String resMotive;
	private String resEdu;
	private String resLicense;
	private String resCareer;
	private String resState;
	public ResumeVO() {
	}
	
	public ResumeVO(String resCode) {
		super();
		this.resCode = resCode;
	}

	public String getResId() {
		return resId;
	}
	public void setResId(String resId) {
		this.resId = resId;
	}
	public String getResCode() {
		return resCode;
	}
	public void setResCode(String resCode) {
		this.resCode = resCode;
	}
	public String getResNm() {
		return resNm;
	}
	public void setResNm(String resNm) {
		this.resNm = resNm;
	}
	public String getResTel() {
		return resTel;
	}
	public void setResTel(String resTel) {
		this.resTel = resTel;
	}
	public String getResMail() {
		return resMail;
	}
	public void setResMail(String resMail) {
		this.resMail = resMail;
	}
	public String getResProfile() {
		return resProfile;
	}
	public void setResProfile(String resProfile) {
		this.resProfile = resProfile;
	}
	public String getResMotive() {
		return resMotive;
	}
	public void setResMotive(String resMotive) {
		this.resMotive = resMotive;
	}
	public String getResEdu() {
		return resEdu;
	}
	public void setResEdu(String resEdu) {
		this.resEdu = resEdu;
	}
	public String getResLicense() {
		return resLicense;
	}
	public void setResLicense(String resLicense) {
		this.resLicense = resLicense;
	}
	public String getResCareer() {
		return resCareer;
	}
	public void setResCareer(String resCareer) {
		this.resCareer = resCareer;
	}
	public String getResState() {
		return resState;
	}
	public void setResState(String resState) {
		this.resState = resState;
	}
}
