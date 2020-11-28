package kr.co.codemaker.common.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.codemaker.model.UsersVO;


@Repository("userDao")
public class UserDao implements UserDaoI {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertUser(UsersVO userVo) {
		return sqlSession.insert("user.insertUser", userVo);
	}
	
	
}
