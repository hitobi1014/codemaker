package kr.co.codemaker.common.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.admin.vo.AdminVO;
import kr.co.codemaker.common.dao.AdminMapper;

@Service("adminService")
public class AdminService {
	
	@Resource(name="adminMapper")
	private AdminMapper adminMapper;

	/**
	 * 관리자 Login
	 * @param admin_id
	 * @author 이은지
	 * @since 2020. 11. 30
	 * @return
	 */
	public AdminVO getAdmin(String AdminId){
		return adminMapper.getAdmin(AdminId);
	}
	
}
