package kr.co.codemaker.common.dao;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.model.AdminVO;

@Mapper("adminMapper")
public interface AdminMapper {
	
	/**
	 * 관리자 Login
	 * @param admin_id
	 * @author 이은지
	 * @since 2020. 11. 30
	 * @return
	 */
	public AdminVO getAdmin(AdminVO adminVo) throws Exception;
	
}
