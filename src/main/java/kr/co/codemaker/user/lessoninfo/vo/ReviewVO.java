package kr.co.codemaker.user.lessoninfo.vo;

import java.util.Date;

public class ReviewVO extends PayVO {

	private String payId;
	private String reviewCont;
	private String reviewId;
	private Date reviewDate;
	private String reviewStar;
	private String userNm;
	private String userProfile;
	

	


	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getReviewCont() {
		return reviewCont;
	}
	public void setReviewCont(String reviewCont) {
		this.reviewCont = reviewCont;
	}
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}



	@Override
	public String toString() {
		return "ReviewVO [payId=" + payId + ", reviewCont=" + reviewCont + ", reviewId=" + reviewId + ", reviewDate="
				+ reviewDate + ", reviewStar=" + reviewStar + ", userNm=" + userNm + ", userProfile=" + userProfile
				+ "]";
	}

	
}
