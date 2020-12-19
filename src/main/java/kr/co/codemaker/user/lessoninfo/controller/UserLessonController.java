package kr.co.codemaker.user.lessoninfo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.lessoninfo.service.LessonIndexService;
import kr.co.codemaker.user.lessoninfo.service.LessonService;
import kr.co.codemaker.user.lessoninfo.service.UesrSubjectService;
import kr.co.codemaker.user.lessoninfo.vo.IndexTimeVO;
import kr.co.codemaker.user.lessoninfo.vo.LessonIndexVO;
import kr.co.codemaker.user.lessoninfo.vo.LessonVO;
import kr.co.codemaker.user.lessoninfo.vo.SubjectVO;


/**
 * UserLessonController.java
*
* @author 박다미
* @version 1.0
* @since 2020. 12. 8. ???????언제지?
*
* 수정자 수정내용
* ------ ------------------------
* 박다미 최초 생성
*
 */
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
	
	/**
	 * 회원 - 강의목차 조회페이지(로그인했을시)
	 * @param model
	 * @param lessonIndexVO
	 * @return
	 */
	@RequestMapping(path="/user/selectLessonPageLogin")
	public String selectLessonPageLogin(Model model,HttpSession session,String lesId ) {
		// 1. 파라미터 lesId -> VO객체로 받기
		// 2. lidxId , lidxCurtime(int타입) 값 가져오기
		LessonIndexVO lessonIndexVO = new LessonIndexVO();
		
		// 로그인세션 가져오기
		UserVO userVO = new UserVO();
		userVO = (UserVO) session.getAttribute("MEMBER_INFO");
		logger.debug("userVO:{}",userVO);
		
		List<LessonIndexVO> lesIdxList =  new ArrayList<LessonIndexVO>();
		
		try {
//			lessonIndexVO.setUserId(userVO.getUserId());
			lessonIndexVO.setLesId(lesId);
			// lessonIndexVO에다가 curTime 집어넣기
			// 쿼리 조인문 해서 값 가져오기
			lesIdxList = lessonIndexService.selectLessonIndex_login(lessonIndexVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.debug("강의번호:{}",lessonIndexVO.getLesId());
		logger.debug("강의목차:{}",lesIdxList);
		model.addAttribute("lesIdxList", lesIdxList);
		model.addAttribute("lesId", lessonIndexVO.getLesId());
		return "mainT/user/lesson/lessonSelect";
		
	}
	/**
	 * 회원 - 강의목차 조회페이지
	 * @param model
	 * @param lessonIndexVO
	 * @return
	 */
	@RequestMapping(path="/user/selectLessonPage")
	public String selectLessonPage(Model model,HttpSession session,String lesId ) {
		// 1. 파라미터 lesId -> VO객체로 받기
		// 2. lidxId , lidxCurtime(int타입) 값 가져오기
		LessonIndexVO lessonIndexVO = new LessonIndexVO();
		
		
		List<LessonIndexVO> lesIdxList =  new ArrayList<LessonIndexVO>();
		
			try {
				lessonIndexVO.setLesId(lesId);
				logger.debug("lessonIndexVO:{}",lessonIndexVO);
				lesIdxList = lessonIndexService.selectLesonIndex(lessonIndexVO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		logger.debug("강의번호:{}",lessonIndexVO.getLesId());
		logger.debug("강의목차:{}",lesIdxList);
		model.addAttribute("lesIdxList", lesIdxList);
		model.addAttribute("lesId", lessonIndexVO.getLesId());
		return "mainT/user/lesson/lessonSelect";
		
	}
	
	/**
	 * 회원 - 강의목차 진행률 수정
	 * @param model
	 * @param lidxId
	 * @param curTime
	 */
	@ResponseBody
	@RequestMapping(path="/user/updateLessonPage")
	public void updateLessonPage(Model model,String lidxId,@RequestParam(required=false)String curTime,HttpSession session ) {
		LessonIndexVO lesIdxVO = new LessonIndexVO();
		// 1. 파라미터 lesId -> VO객체로 받기
		// 2. lidxId , lidxCurtime(int타입) 값 가져오기
		// 3. 진행률 업데이트
		
		// 로그인세션 가져오기
		UserVO userVO = new UserVO();
		userVO = (UserVO) session.getAttribute("MEMBER_INFO");
		int cnt=0;
		
		
		logger.debug("userVO : {}", userVO);
		logger.debug("재생시간 : {}", curTime);
		
		int time = ((int)Double.parseDouble(curTime)/60);
		
		logger.debug("curArray: {}", time);
		
		IndexTimeVO indexTimeVO = new IndexTimeVO();
		indexTimeVO.setUserId(userVO.getUserId());
		indexTimeVO.setLidxId(lidxId);
		indexTimeVO.setLidxCurtime(time);
		
		logger.debug("indexTimeVO: {}", indexTimeVO);
		try {
			cnt = lessonIndexService.updateIndexTime(indexTimeVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		return null;
		
	}
	
	/**
	 * 회원 - 강의 동영상 보기
	 * @param lidxPath
	 * @param model
	 * @param lidxId
	 * @return
	 */
	@RequestMapping(path="/user/selectYoutube")
	public String selectYou(String lidxPath, Model model,String lidxId) {
		model.addAttribute("lidxPath",lidxPath);
		model.addAttribute("lidxId", lidxId);
		return "user/lesson/lessonYoutube";
	}
	
	// 강의 동영상 값 넘겨오는지 
	@RequestMapping(path="/user/time")
	public String timeTest(String curTime,String durTime) {
		logger.debug("재생시간, 전체시간 :{},{}",curTime, durTime);
		return "";
	}
	
	
	
	
}
