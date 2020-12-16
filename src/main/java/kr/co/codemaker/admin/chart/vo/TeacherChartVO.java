package kr.co.codemaker.admin.chart.vo;

public class TeacherChartVO {

	private String tchNm;
	private String result;
	private String lesNm;
	private String lesId;
	private int cnt;
	
	public String getTchNm() {
		return tchNm;
	}
	public void setTchNm(String tchNm) {
		this.tchNm = tchNm;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getLesNm() {
		return lesNm;
	}
	public void setLesNm(String lesNm) {
		this.lesNm = lesNm;
	}
	public String getLesId() {
		return lesId;
	}
	public void setLesId(String lesId) {
		this.lesId = lesId;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	@Override
	public String toString() {
		return "TeacherChartVO [tchNm=" + tchNm + ", result=" + result + ", lesNm=" + lesNm + ", lesId=" + lesId
				+ ", cnt=" + cnt + "]";
	}
	
	
}
