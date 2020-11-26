package kr.co.codemaker.model;

import java.util.Date;

/**
 * 수강후기VO
* ReviewVO.java
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
public class ReviewVO {
	
	private String review_id;   // 후기 아이디 
	private String review_cont; // 후기 내용
	private String review_star; // 후기 별점
	private Date review_date; 	// 후기 작성일
	private String user_id;     // 회원 아이디
	private String cos_id;		// 수강 아이디
	
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getReview_cont() {
		return review_cont;
	}
	public void setReview_cont(String review_cont) {
		this.review_cont = review_cont;
	}
	public String getReview_star() {
		return review_star;
	}
	public void setReview_star(String review_star) {
		this.review_star = review_star;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCos_id() {
		return cos_id;
	}
	public void setCos_id(String cos_id) {
		this.cos_id = cos_id;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", review_cont=" + review_cont + ", review_star=" + review_star
				+ ", review_date=" + review_date + ", user_id=" + user_id + ", cos_id=" + cos_id + "]";
	}
	

}
