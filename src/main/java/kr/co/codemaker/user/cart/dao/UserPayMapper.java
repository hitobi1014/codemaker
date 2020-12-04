package kr.co.codemaker.user.cart.dao;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.user.cart.vo.LessonVO;
import kr.co.codemaker.user.cart.vo.PayVO;

/**
* UserPayMapper.java
*
* @author 최민준
* @version 1.0
* @since 2020. 12. 3.
*
* 수정자 수정내용
* ------ ------------------------
* 최민준  결제 최초 작성
* 		  결제페이지에서 보여질 강의 정보 작성
*
 */
@Mapper("userPayMapper")
public interface UserPayMapper {
	
	/**
	 * 회원이 강의를 결제하는 기능
	 * @param 결제정보를 담은 vo
	 */
	public int insertPay(PayVO payVo) throws Exception;
	
	
	/**
	 * 결제페이지에서 보여줄 강의 정보
	 * @param 결제페이지로 넘어갈때 가져가는 강의아이디
	 */
	public LessonVO selectLessonInfo(LessonVO lessonVo) throws Exception;
}
