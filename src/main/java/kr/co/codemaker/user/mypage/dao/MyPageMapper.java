package kr.co.codemaker.user.mypage.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.common.vo.PageVo;
import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.mypage.vo.PointVO;

@Mapper("myPageMapper")
public interface MyPageMapper{

	UserVO myinfoSelect(String userId) throws Exception;

	int deleteUser(String userId)throws Exception;

	int updateUser(UserVO userId)throws Exception;

	List<PointVO> selectPoint(PageVo pageVo)throws Exception;

	int selectTotalCnt(PageVo pageVo)throws Exception;

	int insertPoint(PointVO pointVo)throws Exception;

	int deletePoint(PointVO pointVo)throws Exception;

}
