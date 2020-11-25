package kr.co.codemaker.main.dao;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.codemaker.common.dao.MainDaoI;
import kr.co.codemaker.main.ModelTestConfig;
import kr.co.codemaker.user.mypage.model.UserVO;

public class MainDaoTest extends ModelTestConfig{

	@Resource(name="mainDao")
	private MainDaoI mainDao;
	
	@Test
	public void userLoginTest() {
		/***Given***/
		String userid = "brown";
		/***When***/
		UserVO userVo = mainDao.selectUser(userid);

		/***Then***/
		assertEquals("brown", userVo.getUser_id());
	}

}
