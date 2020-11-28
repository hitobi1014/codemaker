package kr.co.codemaker.model;

/**
 * 강의VO
* LessonVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 26.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
public class LessonVO {
	
	private String les_id;		// 강의 아이디
	private String les_nm;		// 강의명
	private String les_cont;	// 강의소개
	private String cur_state;	// 강의 등록 상태(임시저장, 승인대기, 승인완료)
	private String tch_id;		// 선생님 아이디
	private String sub_id;		// 과목 아이디
	
	public String getLes_id() {
		return les_id;
	}
	public void setLes_id(String les_id) {
		this.les_id = les_id;
	}
	public String getLes_nm() {
		return les_nm;
	}
	public void setLes_nm(String les_nm) {
		this.les_nm = les_nm;
	}
	public String getLes_cont() {
		return les_cont;
	}
	public void setLes_cont(String les_cont) {
		this.les_cont = les_cont;
	}
	public String getCur_state() {
		return cur_state;
	}
	public void setCur_state(String cur_state) {
		this.cur_state = cur_state;
	}
	public String getTch_id() {
		return tch_id;
	}
	public void setTch_id(String tch_id) {
		this.tch_id = tch_id;
	}
	public String getSub_id() {
		return sub_id;
	}
	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}
	
	@Override
	public String toString() {
		return "LessonVO [les_id=" + les_id + ", les_nm=" + les_nm + ", les_cont=" + les_cont + ", cur_state="
				+ cur_state + ", tch_id=" + tch_id + ", sub_id=" + sub_id + "]";
	}

}
