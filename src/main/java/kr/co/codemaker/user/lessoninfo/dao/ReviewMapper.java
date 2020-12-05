package kr.co.codemaker.user.lessoninfo.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.user.lessoninfo.vo.ReviewVO;

@Mapper("reviewMapper")
public interface ReviewMapper {

	List<ReviewVO> selectReview(String lesId)throws Exception;

	int insertReview(ReviewVO reviewVo)throws Exception;

	int deleteReview(String reviewId)throws Exception;
}
