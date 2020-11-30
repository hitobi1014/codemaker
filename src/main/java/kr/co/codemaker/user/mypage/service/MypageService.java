package kr.co.codemaker.user.mypage.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.common.model.UserVO;
import kr.co.codemaker.user.mypage.dao.MyPageMapper;


@Service("mypageService")
public class MypageService{

	@Resource(name="myPageMapper")
	private MyPageMapper myPageMapper;
	
	public UserVO myinfoSelect(String userId) throws Exception {
		return myPageMapper.myinfoSelect(userId);
	}

	public int deleteUser(String userId) throws Exception {
		return myPageMapper.deleteUser(userId);
	}

	public int updateUser(UserVO userVo) throws Exception {
		return myPageMapper.updateUser(userVo); 
	}

	
	
}
