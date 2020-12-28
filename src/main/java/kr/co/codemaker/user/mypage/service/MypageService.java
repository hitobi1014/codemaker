package kr.co.codemaker.user.mypage.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import kr.co.codemaker.common.vo.PageVo;
import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.lessoninfo.vo.ReviewVO;
import kr.co.codemaker.user.mypage.dao.MyPageMapper;
import kr.co.codemaker.user.mypage.vo.PointVO;


@Service("mypageService")
public class MypageService{

	@Resource(name="myPageMapper")
	private MyPageMapper myPageMapper;
	
	public UserVO myinfoSelect(String userId) throws Exception {
		return myPageMapper.myinfoSelect(userId);
	}

	public int deleteUser(UserVO userVo) throws Exception {
		return myPageMapper.deleteUser(userVo);
	}

	public int updateUser(UserVO userVo) throws Exception {
		return myPageMapper.updateUser(userVo); 
	}

	public Map<String, Object> selectPoint(PageVo pageVo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("pointList", myPageMapper.selectPoint(pageVo));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int totalCnt = 0;
		
		try {
			totalCnt = myPageMapper.selectTotalCnt(pageVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int pages = (int)Math.ceil((double)totalCnt/5); 
		map.put("pages", pages);
		
		return map;
	}

	public int insertPoint(PointVO pointVo)throws Exception {
		return myPageMapper.insertPoint(pointVo);
	}

	public int deletePoint(PointVO pointVo) throws Exception {
		return myPageMapper.deletePoint(pointVo);
	}

	public int deletePointCompare(String userId)throws Exception {
		return myPageMapper.deletePointCompare(userId);
	}




	
	
}
