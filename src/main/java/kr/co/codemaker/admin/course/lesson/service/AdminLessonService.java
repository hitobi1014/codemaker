package kr.co.codemaker.admin.course.lesson.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.admin.course.lesson.dao.AdminLessonMapper;
import kr.co.codemaker.admin.course.lesson.vo.LessonIndexVO;
import kr.co.codemaker.admin.course.lesson.vo.LessonVO;
import kr.co.codemaker.admin.course.lesson.vo.SubjectVO;

/**
 * 
 * AdminLessonService.java
 *
 * @author 김미연
 * @version 1.0
 * @since 2020. 12. 4.
 *
 *        수정자 수정내용 ------ ------------------------ 김미연 최초 생성
 *
 */
@Service("adminLessonService")
public class AdminLessonService {

	@Resource(name = "adminLessonMapper")
	private AdminLessonMapper adminLessonMapper;

	/**
	 * 등록된 전체 과목을 조회하는 메서드
	 * 
	 * @author 김미연
	 * @return
	 */
	public List<SubjectVO> selectAllSubject() throws Exception{
		return adminLessonMapper.selectAllSubject();
	}

	/**
	 * 선택한 과목에 해당하는 강의를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param subjectVO
	 * @return
	 */
	public List<LessonVO> selectLesson(SubjectVO subjectVO) throws Exception{
		return adminLessonMapper.selectLesson(subjectVO);
	}
	
	/**
	 * 전체 강의를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	public List<LessonVO> selectAllLesson(LessonVO lessonVO) throws Exception{
		return adminLessonMapper.selectAllLesson(lessonVO);
	}
	
	/**
	 * 선택한 강의에 해당하는 강의 수를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	public int selectTotalCntLesson(LessonVO lessonVO) throws Exception{
		return adminLessonMapper.selectTotalCntLesson(lessonVO);
	}

	/**
	 * 선택한 강의에 해당하는 강의목차를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	public List<LessonIndexVO> selectLessonIndex(LessonVO lessonVO) throws Exception{
		return adminLessonMapper.selectLessonIndex(lessonVO);
	}
	
	/**
	 * 선택한 강의에 해당하는 강의목차의 수를 조회하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	public int selectTotalCntLesIdx(LessonVO lessonVO) throws Exception {
		return adminLessonMapper.selectTotalCntLesIdx(lessonVO);
	}

	/**
	 * 해당 강의의 상태를 변경하는 메서드
	 * 
	 * @author 김미연
	 * @param lessonVO
	 * @return
	 */
	public int updateLesson(LessonVO lessonVO) throws Exception{
		return adminLessonMapper.updateLesson(lessonVO);
	}

}
