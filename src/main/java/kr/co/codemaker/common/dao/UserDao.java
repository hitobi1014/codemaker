package kr.co.codemaker.common.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.codemaker.model.UserVO;


@Repository("userDao")
public class UserDao implements UserDaoI {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertUser(UserVO userVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.insertUser", userVo);
	}
	
	
}
