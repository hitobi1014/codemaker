package kr.co.codemaker.member.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.codemaker.ModelTestConfig;
import kr.co.codemaker.testmember.dao.MemberMapper;
import kr.co.codemaker.testmember.vo.MemberVO;

public class memberDaoTest extends ModelTestConfig{
	private static final Logger logger = LoggerFactory.getLogger(memberDaoTest.class);	
	
	@Resource(name="memberMapper")
	private MemberMapper memberMapper;
	
	@Test
	public void test() throws Exception {
		List<MemberVO> memberVo = memberMapper.selectMember();
		logger.debug("가져온VO {}",memberVo);
		assertEquals(27, memberVo.size());
	}

}
