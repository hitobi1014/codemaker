package kr.co.codemaker.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.common.dao.ComplainMapper;
import kr.co.codemaker.common.vo.ComplainVO;
import kr.co.codemaker.common.vo.UserVO;

@Service("complainService")
public class ComplainService {
	
	@Resource(name="complainMapper")
	private ComplainMapper complainMapper;
	
	public List<ComplainVO> selectAllComplain(){
		return complainMapper.selectAllComplain();
	}
	
	public int insertComplain(ComplainVO complainVo) {
		return complainMapper.insertComplain(complainVo);
	}
	
	public ComplainVO selectComplain(ComplainVO complainVo) {
		return complainMapper.selectComplain(complainVo);
	}
	
	public int checkComplain(ComplainVO complainVo) {
		return complainMapper.checkComplain(complainVo);
	}
	
	public String selectReplyQna(ComplainVO complainVo) {
		return complainMapper.selectReplyQna(complainVo);
	}
	
	public List<UserVO> selectBlackList(){
		return complainMapper.selectBlackList();
	}
	
	public int insertBlackList(UserVO userVo) {
		return complainMapper.insertBlackList(userVo);
	}
}
