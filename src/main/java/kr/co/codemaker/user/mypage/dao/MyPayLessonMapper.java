package kr.co.codemaker.user.mypage.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.user.mypage.vo.PayLessonInfoVO;

/**
* MyPayLessonMapper.java
*
* @author 최민준
* @version 1.0
* @since 2020. 12. 15.
*
* 수정자 수정내용
* ------ ------------------------
* 최민준 마이페이지에서 내 강의실 조회
*
 */
@Mapper("myPayLessonMapper")
public interface MyPayLessonMapper {
	
	/**
	 * 마이페이지 - 내 강의실 - 강의리스트 조회
	 * @param	회원아이디가 담긴 vo
	 * @return	아이디에 해당하는 vo 리스트
	 */
	public List<PayLessonInfoVO> selectAllPayLesson(PayLessonInfoVO plVo) throws Exception;
	
}
