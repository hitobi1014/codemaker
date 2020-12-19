package kr.co.codemaker.user.lessoninfo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.user.lessoninfo.dao.LessonIndexMapper;
import kr.co.codemaker.user.lessoninfo.vo.IndexTimeVO;
import kr.co.codemaker.user.lessoninfo.vo.LessonIndexVO;

@Service("userLessonIndexService")
public class LessonIndexService {
	
	@Resource(name="userLessonIndexMapper")
	private LessonIndexMapper lessonIndexMapper;
	
	public List<LessonIndexVO> selectLessonIndex(LessonIndexVO lessonIndexVO) throws Exception {
		return lessonIndexMapper.selectLessonIndex(lessonIndexVO);
	}
	
	public int updateLessonIndex(LessonIndexVO lessonIndexVO) throws Exception{
		return lessonIndexMapper.updateLessonIndex(lessonIndexVO); 
	}
	
	public int insertIndexTime(IndexTimeVO indexTimeVO) throws Exception{
		return lessonIndexMapper.insertIndexTime(indexTimeVO);
	}
	
	public IndexTimeVO selectCurTime(IndexTimeVO indexTimeVO) throws Exception{
		return lessonIndexMapper.selectCurTime(indexTimeVO);
	}
	
	public List<IndexTimeVO> selectLidxId(String userId) throws Exception{
		return lessonIndexMapper.selectLidxId(userId);
	}

}
