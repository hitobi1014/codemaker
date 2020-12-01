package kr.co.codemaker.user.course.note.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.course.note.vo.NoteRequestVO;
import kr.co.codemaker.user.course.note.vo.NoteVO;

/**
 * 
* NoteMapper.java
*
* @author 김미연
* @version 1.0
* @since 2020. 12. 1.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
@Mapper("noteMapper")
public interface NoteMapper {
	
	/**
	 * 회원의 노트 목록 전체를 가져오는 메소드
	 * @author 김미연
	 * @param userVo
	 * @return
	 */
	public List<NoteVO> selectAllNote(UserVO userVo) throws Exception;
	
	/**
	 * 회원의 노트 목록을 페이징 처리하여 가져오는 메소드
	 * @author 김미연
	 * @param noteRequestVo
	 * @return
	 */
	public List<NoteVO> selectPageNote(NoteRequestVO noteRequestVo) throws Exception;
	
	/**
	 * 회원의 노트 목록의 총 개수를 가져오는 메소드
	 * @author 김미연
	 * @param noteRequestVo
	 * @return
	 */
	public int selecTotalCntNote(NoteRequestVO noteRequestVo) throws Exception;
	
	/**
	 * 회원 노트 1개의 정보를 가져오는 메소드
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	public NoteVO selectNote(NoteVO noteVo) throws Exception;
	
	/**
	 * 노트를 등록하는 메소드
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	public int insertNote(NoteVO noteVo) throws Exception;
	
	/**
	 * 노트를 수정하는 메소드
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	public int updateNote(NoteVO noteVo) throws Exception;
	
	/**
	 * 노트를 삭제하는 메소드
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	public int deleteNote(NoteVO noteVo) throws Exception;

}
