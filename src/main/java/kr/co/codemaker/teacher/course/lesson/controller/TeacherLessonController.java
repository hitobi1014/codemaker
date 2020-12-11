package kr.co.codemaker.teacher.course.lesson.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.bean.conf.loader.annotation.Validatable;

import kr.co.codemaker.common.vo.TeacherVO;
import kr.co.codemaker.teacher.course.lesson.service.LessonIndexService;
import kr.co.codemaker.teacher.course.lesson.service.LessonService;
import kr.co.codemaker.teacher.course.lesson.service.TeacherSubjectService;
import kr.co.codemaker.teacher.course.lesson.vo.LessonIndexVO;
import kr.co.codemaker.teacher.course.lesson.vo.LessonVO;
import kr.co.codemaker.teacher.course.lesson.vo.SubjectVO;

/**
 * 
 *
 * @author 박다미
 * @version 1.0
 * @since 2020. 12. 1.
 *
 *        수정자 수정내용 ------ ------------------------ 박다미 최초 생성
 *
 */
@Controller
public class TeacherLessonController {

	private static final Logger logger = LoggerFactory.getLogger(TeacherLessonController.class);

	@Resource(name = "lessonService")
	private LessonService lessonService;

	@Resource(name = "TeacherSubjectService")
	private TeacherSubjectService subjectService;

	@Resource(name = "lessonIndexService")
	private LessonIndexService lessonIndexService;

	/**
	 * 선생님 - 강의조회
	 */
	@RequestMapping(path = "/teacherL/selectSubject", method = RequestMethod.GET)
	public String selecSubject(Model model, HttpSession session) {
		TeacherVO teacherVO = (TeacherVO) session.getAttribute("S_TEACHER");
		String tchId = teacherVO.getTchId();

		List<LessonVO> noLessonList;
		try {
			noLessonList = lessonService.selectNoLesson(tchId);
			model.addAttribute("noLessonList", noLessonList);

			logger.debug("개설안된강의!!:{}", noLessonList);
			return "teacherPage/teacher/lesson/lessonAllSelect";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 선생님 - 과목명-> 강의 조회
	 */
	@ResponseBody
	@RequestMapping(path = "/teacherL/selectSubject", method = RequestMethod.POST)
	public List<LessonVO> selectLesson(Model model, String subId, HttpSession session) {
		logger.debug("과제아디!!:{}", subId);

		TeacherVO teacherVO = (TeacherVO) session.getAttribute("S_TEACHER");
		logger.debug("로그인한 선생님VO:{}", teacherVO);

		String tchId = teacherVO.getTchId();
		LessonVO lessonVO = new LessonVO();
		lessonVO.setTchId(tchId);
		lessonVO.setSubId(subId);
		List<LessonVO> leList;
		try {
			leList = lessonService.selectLesson(lessonVO);
			model.addAttribute("lessonList", leList);
			logger.debug("리스트!!:{}", leList);
			return leList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 선생님 - 강의선택 -> 강의목차조회
	 */
	@ResponseBody
	@RequestMapping(path = "/teacherL/selectAllLessonIndex")
	public List<LessonIndexVO> selectLessonPage(Model model, String lesId) {
		LessonIndexVO lesIdxVO = new LessonIndexVO();
		lesIdxVO.setLesId(lesId);

		logger.debug("강의번호:{}", lesId);
		List<LessonIndexVO> lesIdxList;
		try {
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
			logger.debug("강의목차:{}", lesIdxList);
			model.addAttribute("lesIdxList", lesIdxList);
			return lesIdxList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	

	/**
	 * 선생님 - 강의 삭제
	 */
	@RequestMapping(path = "/teacherL/deleteLesson", method = RequestMethod.GET)
	public String deleteLesson(Model model, String lesId, HttpSession session) {
		TeacherVO teacherVO = (TeacherVO) session.getAttribute("S_TEACHER");
		String tchId = teacherVO.getTchId();
		logger.debug("lesId값!!!:{}", lesId);
		logger.debug("로그인한 선생님VO:{}", teacherVO);

		int lesIdxCnt;
		try {
			lesIdxCnt = lessonService.deleteLesson(lesId);
			if (lesIdxCnt == 1) {
				// 1일때 정상 => 강의가 삭제되면서 강의목차 부분만 내용이 바뀜
				List<LessonVO> noLessonList = lessonService.selectNoLesson(tchId);
				model.addAttribute("noLessonList", noLessonList);
				return "teacher/lesson/lessonDeleteHTML";
			} else {
				// 1이 아닐때 비정상 => 조회페이지 redirect
				return "redirect;/teacherL/selectSubject";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	/**
	 * 선생님 - 임시저장된 강의 조회(삭제했을때 다시불러오기용)
	 */
	@RequestMapping(path = "/teacherL/selectloadSubject", method = RequestMethod.GET)
	public String selecLoadSubject(Model model, HttpSession session) {
		TeacherVO teacherVO = (TeacherVO) session.getAttribute("S_TEACHER");
		String tchId = teacherVO.getTchId();
		List<LessonVO> noLessonList;
		try {
			noLessonList = lessonService.selectNoLesson(tchId);
			model.addAttribute("noLessonList", noLessonList);

			logger.debug("개설안된강의!!:{}", noLessonList);
			return "teacher/lesson/lessonDeleteHTML";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 선생님 - 강의 등록(페이지만 띄우기)
	 */
	@RequestMapping(path = "/teacherL/insertViewLesson")
	public String insertViewLesson() {
		return "teacherPage/teacher/lesson/lessonInsert";
	}

	/**
	 * 선생님 - 강의등록(값 받고 넘겨서 데이터 입력)
	 */
	@RequestMapping(path = "/teacherL/insertLesson", method = RequestMethod.POST)
	public String insertLesson(LessonIndexVO lessonIndexVO, LessonVO lessonVO, HttpSession session) {
		TeacherVO teacherVO = (TeacherVO) session.getAttribute("S_TEACHER");
		String tchId = teacherVO.getTchId();

		logger.debug("과목,선생:{}", tchId);
		lessonVO.setTchId(tchId);
		// lessonVO.setSubId(subId);

		int lesCnt = 0;
		int lesIdxCnt = 0;

		try {
			lesCnt = lessonService.insertLesson(lessonVO);
			logger.debug("강의 추가됐니?:{}", lessonVO);
			String lesId = lessonVO.getLesId();
			List<LessonIndexVO> lesIdxList = lessonIndexVO.getLesIdxList();
			for (LessonIndexVO lesIdxVO : lesIdxList) {
				lesIdxVO.setLesId(lesId);
				lesIdxCnt = lessonIndexService.insertLessonIndex(lesIdxVO);
				logger.debug("강의목차!!!!:{}", lesIdxVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (lesCnt == 1 && lesIdxCnt == 1) {
			return "redirect:/teacherL/selectSubject";
		} else {
			return "teacherPage/teacher/lesson/lessonInsert";
		}
	}

	/**
	 * 선생님 - 강의수정화면
	 */
	@RequestMapping(path = "/teacherL/updateLesson")
	public String updateViewLesson(LessonVO lessonVO, Model model, String lesId, String subId) {
		// 1. 강의, 강의목차 조회하기
		// 2. 강의목차 옆에 삭제버튼달기 - 삭제시 화면이 load되어야함
		// 3. 강의목차 옆에 수정버튼 달기
		// 3. 강의목차 추가하기 버튼달기
		// 4. 등록버튼

		logger.debug("강의아디랑 과목아디!!!:{},{}", lesId, subId);
		List<LessonIndexVO> lesIdxList = new ArrayList<>();
		lessonVO.setLesId(lesId);
		try {
			lessonVO = lessonService.selectDetailLesson(lessonVO);
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.debug("강의객체!!:{}", lessonVO);
		logger.debug("강의목차는???:{C}", lesIdxList);
		model.addAttribute("lessonVO", lessonVO);
		model.addAttribute("lesIdxList", lesIdxList);
		return "teacherPage/teacher/lesson/lessonUpdate";
	}

	/**
	 * 선생님 - 강의목차 삭제
	 */
	@RequestMapping(path = "/teacherL/deleteLessonIndex")
	public String deleteViewLessonIndex(String lidxId, Model model, String lesId, LessonIndexVO lesIdxVO) {
		List<LessonIndexVO> lesIdxList = new ArrayList<>();
		int delCnt = 0;
		int upCnt = 0;
		logger.debug("넘어온 값:{},{}", lidxId, lesId);
		logger.debug("lesIdxVO!!!:{}", lesIdxVO);
		try {
			// 강의목차 삭제
			delCnt = lessonIndexService.deleteLessonIndex(lidxId);
			// 삭제한거 제외한 강의목차 조회
			logger.debug("delCnt값,delCnt값:{},{}", delCnt, upCnt);
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
			if (delCnt == 1) {
				model.addAttribute("lesIdxList", lesIdxList);
				return "teacher/lesson/lessonIndexUpdateHTML";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 선생님 - 강의목차 삭제,수정하고 난뒤 load
	 * 
	 * @param lesId
	 *            강의아이디
	 * @param model
	 *            강의목차 리스트
	 * @return
	 */
	@RequestMapping(path = "/teacherL/updateLoadLesIdx")
	public String deleteLessonIndex(String lesId, Model model) {
		List<LessonIndexVO> lesIdxList = new ArrayList<>();
		try {
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
			logger.debug("두번째 컨트롤러어어어:{}", lesIdxList);
			model.addAttribute("lesIdxList", lesIdxList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "teacher/lesson/lessonIndexUpdateHTML";
	}

	/**
	 * 선생님 - 강의목차 수정
	 */
	@RequestMapping(path = "/teacherL/updateLessonIndex")
	public String updateViewLessonIndex(String lidxId, Model model, String lesId, LessonIndexVO lesIdxVO,
			String lidxCont, int lidxNum) {
		List<LessonIndexVO> lesIdxList = new ArrayList<>();
		int delCnt = 0;
		int upCnt = 0;
		logger.debug("넘어온 값:{},{}", lidxId, lesId);
		logger.debug("넘어온 강의넘버,강의내용:{},{}", lidxNum, lidxCont);
		logger.debug("lidxId넣은 VO:{}", lesIdxVO);
		lesIdxVO.setLidxNum(lidxNum);
		lesIdxVO.setLidxCont(lidxCont);
		logger.debug("셋!!!!넣은 VO:{}", lesIdxVO);
		try {
			// 강의목차 수정
			upCnt = lessonIndexService.updateLessonIndex(lesIdxVO);
			logger.debug("delCnt값,delCnt값:{},{}", delCnt, upCnt);
			lesIdxList = lessonIndexService.selectLessonIndex(lesId);
			logger.debug("레슨인덱스 리스트:{}", lesIdxList);
			if (upCnt == 1) {
				model.addAttribute("lesIdxList", lesIdxList);
				return "teacher/lesson/lessonIndexUpdateHTML";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 선생님 - 강의 수정 & 강의목차 추가
	 */
	@RequestMapping(path = "/teacherL/updateLesson", method = RequestMethod.POST)
	public String updateLesson(LessonIndexVO lessonIndexVO, LessonVO lessonVO, String lesId) {
		logger.debug("강의아이디:{}", lesId);
		logger.debug("강의VO:{}", lessonVO);
		logger.debug("강의인덱스VO:{}", lessonIndexVO);
		int upCnt = 0;
		int upTempoCnt = 0;
		int lesIdxCnt = 0;
		try {
			// upCnt = lessonService.updateLesson(lessonVO);
			upTempoCnt = lessonService.updateTempoLesson(lessonVO);
			List<LessonIndexVO> List = lessonIndexVO.getLesIdxList();
			logger.debug("강의 리스트 수:{}", List.size());

			for (LessonIndexVO lesIdxVO : List) {
				if (lesIdxVO != null) {
					lesIdxVO.setLesId(lesId);
					lesIdxCnt = lessonIndexService.insertLessonIndex(lesIdxVO);
					logger.debug("강의목차!!!!:{}", lesIdxVO);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (upCnt == 1 || lesIdxCnt == 1 || upTempoCnt == 1) {
			return "redirect:/teacherL/selectSubject";
		}
		return "";
	}

}
