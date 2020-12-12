package kr.co.codemaker.admin.chart.vo;

public class LessonChartVO {

	private String lesId;
	private String result;
	
	public void setLesId(String lesId) {
		this.lesId = lesId; 
	}
	public String getLesId() {
		return lesId; 
	}
	public void setResult(String result) {
		this.result = result; 
	}
	public String getResult() {
		return result; 
	}
	
	@Override
	public String toString() {
		return "LessonChartVO [lesId=" + lesId + ", result=" + result + "]";
	}

}
