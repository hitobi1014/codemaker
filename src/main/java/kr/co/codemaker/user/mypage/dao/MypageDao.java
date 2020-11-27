package kr.co.codemaker.user.mypage.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("mypageDao")
public class MypageDao implements MypageDaoI {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
}
