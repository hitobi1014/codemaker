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
<<<<<<< HEAD
	public int insertUser(UserVO userVo) {
=======
	public int insertUser(UsersVO userVo) {
>>>>>>> VO수정
		return sqlSession.insert("user.insertUser", userVo);
	}

	@Override
	public int idchk(UserVO userVo) {
		return sqlSession.selectOne("user.idchk", userVo);
	}
	
	
}
