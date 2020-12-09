package kr.co.codemaker.user.lessoninfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.user.lessoninfo.dao.ReviewMapper;
import kr.co.codemaker.user.lessoninfo.vo.ReviewStarVO;
import kr.co.codemaker.user.lessoninfo.vo.ReviewVO;

@Service("reviewService")
public class ReviewService {

	@Resource(name="reviewMapper")
	private ReviewMapper reviewMapper;

	public List<ReviewVO> selectReview(String lesId) throws Exception{
		return reviewMapper.selectReview(lesId);
	}

	public int insertReview(ReviewVO reviewVo) throws Exception {
		return reviewMapper.insertReview(reviewVo);
	}

	public int deleteReview(String reviewId) throws Exception {
		return reviewMapper.deleteReview(reviewId);
	}

	public float selectReviewAvg(String lesId) throws Exception {
		return reviewMapper.selectReviewAvg(lesId);
	}

	public ReviewStarVO selectReviewStar(String lesId) throws Exception {
		return reviewMapper.selectReviewStar(lesId);
	}

}
