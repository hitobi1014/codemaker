package kr.co.codemaker.common.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.codemaker.user.mypage.model.UserVO;

@Repository("mainDao")
public class MainDao implements MainDaoI {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public UserVO selectUser(String user_id) {
		return sqlSession.selectOne("main.selectUser", user_id);
	}

}
