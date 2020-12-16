package kr.co.codemaker.admin.company.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.admin.company.vo.CompanyVO;

@Mapper("companyMapper")
public interface CompanyMapper {
	
	List<CompanyVO> selectAllCompany(CompanyVO companyVO) throws Exception;		// 기업리스트 조회

}
