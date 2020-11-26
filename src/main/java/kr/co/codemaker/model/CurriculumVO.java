package kr.co.codemaker.model;

/**
 * 커리큘럼VO
* CurriculumVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 24.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
public class CurriculumVO {
	
	private String cur_id;		// 커리큘럼 아이디
	private int cur_number;		// 커리큘럼 차수
	private String cur_cont;	// 커리큘럼 내용
	private String cur_gn;		// 커리큘럼 구분
	private String cur_root;	// 커리큘럼 부모코드
	private String les_id;		// 강의 아이디
	
	public CurriculumVO() {
	}

	public CurriculumVO(String cur_id, int cur_number, String cur_cont, String cur_gn, String cur_root, String les_id) {
		this.cur_id = cur_id;
		this.cur_number = cur_number;
		this.cur_cont = cur_cont;
		this.cur_gn = cur_gn;
		this.cur_root = cur_root;
		this.les_id = les_id;
	}
	
	public String getCur_id() {
		return cur_id;
	}
	public void setCur_id(String cur_id) {
		this.cur_id = cur_id;
	}
	public int getCur_number() {
		return cur_number;
	}
	public void setCur_number(int cur_number) {
		this.cur_number = cur_number;
	}
	public String getCur_cont() {
		return cur_cont;
	}
	public void setCur_cont(String cur_cont) {
		this.cur_cont = cur_cont;
	}
	public String getCur_gn() {
		return cur_gn;
	}
	public void setCur_gn(String cur_gn) {
		this.cur_gn = cur_gn;
	}
	public String getCur_root() {
		return cur_root;
	}
	public void setCur_root(String cur_root) {
		this.cur_root = cur_root;
	}
	public String getLes_id() {
		return les_id;
	}
	public void setLes_id(String les_id) {
		this.les_id = les_id;
	}
	
	@Override
	public String toString() {
		return "CurriculumVO [cur_id=" + cur_id + ", cur_number=" + cur_number + ", cur_cont=" + cur_cont + ", cur_gn="
				+ cur_gn + ", cur_root=" + cur_root + ", les_id=" + les_id + "]";
	}
	
}
