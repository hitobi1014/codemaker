package kr.co.codemaker.common.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.common.dao.AdminMapper;

@Service("adminService")
public class AdminService {
	
	@Resource(name="adminMapper")
	private AdminMapper adminMapper;

	
	public AdminVO getAdmin(AdminVO adminVo) throws Exception {
		
		return adminMapper.getAdmin(adminVo);
	}

}
