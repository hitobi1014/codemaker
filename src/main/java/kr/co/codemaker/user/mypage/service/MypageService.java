package kr.co.codemaker.user.mypage.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.user.mypage.dao.MypageDaoI;


@Service("mypageService")
public class MypageService implements MypageServiceI {

	@Resource(name="mypageDao")
	private MypageDaoI mypageDao;
	
	public MypageService() {
		
	}
	
	
}
