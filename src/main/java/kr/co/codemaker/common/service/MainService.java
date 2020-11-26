package kr.co.codemaker.common.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.common.dao.MainDaoI;
import kr.co.codemaker.user.mypage.model.UserVO;

@Service("mainService")
public class MainService implements MainServiceI {

	@Resource(name="mainDao")
	private MainDaoI mainDao;
	
	@Override
	public UserVO selectUser(String user_id) {
		return mainDao.selectUser(user_id);
	}

}
