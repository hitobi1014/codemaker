package kr.co.codemaker.model;

/**
 * 강의VO LessonVO.java
 *
 * @author 김미연
 * @version 1.0
 * @since 2020. 11. 26.
 *
 *        수정자 수정내용 ------ ------------------------ 김미연 최초 생성 (les_id 뺌) 박다미
 *        les_cont(강의내용), les_cash(강의금액), les_term(강의기간) 추가
 *
 */
public class LessonVO {

	private String les_nm; // 강의명
	private String les_cont; // 강의내용
	private String cur_state; // 강의 등록 상태(임시저장, 승인대기, 승인완료)
	private String tch_id; // 선생님 아이디
	private String sub_id; // 과목 아이디
	private int les_cash; // 강의 금액
	private int les_term; // 강의 기간

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

	public int getLes_cash() {
		return les_cash;
	}

	public void setLes_cash(int les_cash) {
		this.les_cash = les_cash;
	}

	public int getLes_term() {
		return les_term;
	}

	public void setLes_term(int les_term) {
		this.les_term = les_term;
	}

	@Override
	public String toString() {
		return "LessonVO [les_nm=" + les_nm + ", les_cont=" + les_cont + ", cur_state=" + cur_state + ", tch_id="
				+ tch_id + ", sub_id=" + sub_id + ", les_cash=" + les_cash + ", les_term=" + les_term + "]";
	}

}
