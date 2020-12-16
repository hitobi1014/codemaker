package kr.co.codemaker.admin.company.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.admin.company.dao.CompanyMapper;
import kr.co.codemaker.admin.company.vo.CompanyVO;

@Service("companyService")
public class CompanyService {
	
	@Resource(name="companyMapper")
	private CompanyMapper companyMapper;
	
	public List<CompanyVO> selectAllCompany(CompanyVO companyVO) throws Exception{
		return companyMapper.selectAllCompany(companyVO);
	}
	
	

}
