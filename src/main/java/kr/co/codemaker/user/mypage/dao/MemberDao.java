package kr.co.codemaker.user.mypage.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.codemaker.user.mypage.model.MemberVO;

@Repository("memberDao")
public class MemberDao implements MemberDaoI{
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MemberVO> getMember() {
		logger.debug("이건 다오~!!!!!!");
		return sqlSession.selectList("member.getMember");
	}



	
	
}
