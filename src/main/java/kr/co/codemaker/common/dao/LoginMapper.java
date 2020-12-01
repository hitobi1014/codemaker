package kr.co.codemaker.common.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.common.vo.UserVO;

@Mapper("loginMapper")
public interface LoginMapper {
	public UserVO selectUser(String userId) throws Exception;
}

