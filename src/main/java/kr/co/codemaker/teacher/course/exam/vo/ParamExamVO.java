package kr.co.codemaker.teacher.course.exam.vo;

import java.util.List;

/**
 * 
* ParamExamVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 12. 11.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
public class ParamExamVO extends ExamVO {
	
	private List<String> queCont;
	private List<String> queAnswer;
	private List<String> queExplain;
	private List<Integer> queScore;
	
	private List<String> ansCont;

	public List<String> getQueCont() {
		return queCont;
	}
	public void setQueCont(List<String> queCont) {
		this.queCont = queCont;
	}
	public List<String> getQueAnswer() {
		return queAnswer;
	}
	public void setQueAnswer(List<String> queAnswer) {
		this.queAnswer = queAnswer;
	}
	public List<String> getQueExplain() {
		return queExplain;
	}
	public void setQueExplain(List<String> queExplain) {
		this.queExplain = queExplain;
	}
	public List<Integer> getQueScore() {
		return queScore;
	}
	public void setQueScore(List<Integer> queScore) {
		this.queScore = queScore;
	}
	public List<String> getAnsCont() {
		return ansCont;
	}
	public void setAnsCont(List<String> ansCont) {
		this.ansCont = ansCont;
	}

}
