package kr.co.codemaker.user.mypage.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.codemaker.user.mypage.dao.MemberDaoI;
import kr.co.codemaker.user.mypage.model.MemberVO;

@Service("memberService")
public class MemberService implements MemberServiceI{
private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Resource(name = "memberDao")
	private MemberDaoI memberDao;
	
	public MemberService() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<MemberVO> getMember() {
		logger.debug("이건서비스~!!!!!!!!!");
		return memberDao.getMember();
	}


}
