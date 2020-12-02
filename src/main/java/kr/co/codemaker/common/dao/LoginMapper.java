package kr.co.codemaker.common.dao;


import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.admin.vo.AdminVO;
import kr.co.codemaker.common.vo.UserVO;

@Mapper("loginMapper")
public interface LoginMapper {
	/**
	 * 회원 Login
	 * @param userId
	 * @author 최민준
	 * @return
	 * @throws Exception
	 */
	public UserVO selectUser(String userId) throws Exception;
	
	/**
	 * 관리자 Login
	 * @author 이은지
	 * @since 2020. 11. 30
	 * @param adminId
	 * @return
	 * @throws Exception
	 */
	public AdminVO getAdmin(String adminId) throws Exception;
}

