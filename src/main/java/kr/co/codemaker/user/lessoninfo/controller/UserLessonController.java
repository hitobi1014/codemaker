package kr.co.codemaker.user.lessoninfo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codemaker.user.lessoninfo.service.LessonIndexService;
import kr.co.codemaker.user.lessoninfo.service.LessonService;
import kr.co.codemaker.user.lessoninfo.service.UesrSubjectService;
import kr.co.codemaker.user.lessoninfo.vo.LessonIndexVO;
import kr.co.codemaker.user.lessoninfo.vo.LessonVO;
import kr.co.codemaker.user.lessoninfo.vo.SubjectVO;


@Controller
public class UserLessonController {

	private static final Logger logger = LoggerFactory.getLogger(UserLessonController.class);

	@Resource(name="userLessonService")
	private LessonService lessonService;
	
	@Resource(name="userSubjectService")
	private UesrSubjectService subjectService;
	
	@Resource(name="userLessonIndexService")
	private LessonIndexService lessonIndexService;
	
	
	@RequestMapping(path="/user/selectSubject")
	public String selectLesson(Model model) {
		List<SubjectVO> subjectList = subjectService.selectSubject();
		List<LessonVO> lessonList= lessonService.selectLesson();
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("lessonList", lessonList);
		
		return "mainT/user/lesson/subjectSelect";
	}
	
	// 강의목차 조회페이지
	@RequestMapping(path="/user/selectLessonPage")
	public String selectLessonPage(Model model,LessonIndexVO lessonIndexVO ) {
		LessonIndexVO lesIdxVO = new LessonIndexVO();
		
		// 1. 파라미터 lesId -> VO객체로 받기
		// 2. lidxId , lidxCurtime(int타입) 값 가져오기
		
		List<LessonIndexVO> lesIdxList;
		try {
			lesIdxList = lessonIndexService.selectLessonIndex(lessonIndexVO);
			logger.debug("강의번호:{}",lessonIndexVO.getLesId());
			logger.debug("강의목차:{}",lesIdxList);
			model.addAttribute("lesIdxList", lesIdxList);
			model.addAttribute("lesId", lessonIndexVO.getLesId());
			return "mainT/user/lesson/lessonSelect";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	// 강의목차 진행률 수정
	@ResponseBody
	@RequestMapping(path="/user/updateLessonPage")
	public void updateLessonPage(Model model,String lidxId,@RequestParam(required=false)String curTime ) {
		LessonIndexVO lesIdxVO = new LessonIndexVO();
		// 1. 파라미터 lesId -> VO객체로 받기
		// 2. lidxId , lidxCurtime(int타입) 값 가져오기
		// 3. 진행률 업데이트
		
		logger.debug("lidxId : {}", lidxId);
		logger.debug("재생시간 : {}", curTime);
		
		int time = ((int)Double.parseDouble(curTime)/60);
		
		logger.debug("curArray: {}", time);
		lesIdxVO.setLidxId(lidxId);
		lesIdxVO.setLidxCurtime(time);
		logger.debug("lesIdxVO: {}", lesIdxVO);
		
		try {
			lessonIndexService.updateLessonIndex(lesIdxVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		return null;
		
	}
	
	// 강의 동영상
	@RequestMapping(path="/user/selectYou")
	public String selectYou(String lidxPath, Model model,String lidxId) {
		model.addAttribute("lidxPath",lidxPath);
		model.addAttribute("lidxId", lidxId);
		return "user/lesson/youtubeTest";
	}

	// 강의 동영상 테스트
	@RequestMapping(path="/user/testYou")
	public String testYou() {
		return "user/lesson/youtubeTest";
	}
	
	// 강의 동영상 값 넘겨오는지 
	@RequestMapping(path="/user/time")
	public String timeTest(String curTime,String durTime) {
		logger.debug("재생시간, 전체시간 :{},{}",curTime, durTime);
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
