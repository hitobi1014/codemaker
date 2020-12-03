package kr.co.codemaker.user.cart.dao;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
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
*
 */
@Mapper("userPayMapper")
public interface UserPayMapper {
	
	public int insertPay(PayVO payVo) throws Exception;
}
