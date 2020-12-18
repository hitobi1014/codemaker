package kr.co.codemaker.user.mypage.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.admin.chart.vo.PayVO;
import kr.co.codemaker.common.vo.PageVo;
import kr.co.codemaker.user.mypage.vo.MyPayVO;

@Mapper("myPayMapper")
public interface MyPayMapper {

	List<MyPayVO> selectAllMyPay(PageVo pageVo)throws Exception;

	int selectTotalCnt(PageVo pageVo)throws Exception;

	MyPayVO selectMyPay(PayVO payVo)throws Exception;

}
