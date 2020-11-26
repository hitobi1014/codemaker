package kr.co.codemaker.common.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.codemaker.user.mypage.model.UserVO;

@Repository("mainDao")
public class MainDao implements MainDaoI {
	
	private static final Logger logger = LoggerFactory.getLogger(MainDao.class);
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public UserVO selectUser(String user_id) {
//		return sqlSession.selectOne("main.selectUser", user_id);
		return new UserVO("test", "testPass", "테스트계정", "01034020201", null, null, null);
	}


}
