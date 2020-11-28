package kr.co.codemaker.common.notice.dao;

import java.util.List;
import java.util.Map;

import kr.co.codemaker.model.NoticeVO;



/**
* NoticeDaoI.java
*
* @author 박경호
* @version 1.0
* @since 2020. 11. 24.
*
* 수정자 수정내용
* ------ ------------------------
* 박경호 최초 생성
*
 */
public interface NoticeDaoI {

	/**
	 * 조건 별 공지사항을 조회하는 메서드
	 * @author 박경호
	 * @param map 가져갈 객체
	 * @return 조건별 공지사항 리스트
	 */
	public List<NoticeVO> selectAllNotice(Map<String, Object> map);
	
	/**
	 * 공지사항의 총 수를 구하는 메서드
	 * @author 박경호
	 * @param map 가져갈 객체
	 * @return 공지사항의 총 갯수
	 */
	public int noticeTotalCnt(Map<String, Object> map);
	
	/**
	 * 하나의 공지사항을 조회하는 메서드
	 * @author 박경호
	 * @param notice_id 공지사항 아이디
	 * @return 선택한 공지사항
	 */
	public NoticeVO selectNotice(String noticeId);
	
	/**
	 * 공지사항을 추가하기 위한 메서드
	 * @author 박경호
	 * @param noticeVo 추가하려는 공지사항 객체
	 * @return 추가된 공지사항 갯수
	 */
	public int insertNotice(NoticeVO noticeVo);
	
	/**
	 * 공지사항을 수정하기 위한 메서드
	 * @author 박경호
	 * @param noticeVo 수정하려는 공지사항 객체
	 * @return 수정된 공지사항 갯수
	 */
	public int updateNotice(NoticeVO noticeVo);
	
	/**
	 * 공지사항을 삭제하기 위한 메서드
	 * @author 박경호
	 * @param noticeVo 삭제하려는 공지사항 객체
	 * @return 삭제된 공지사항 갯수
	 */
	public int deleteNotice(String notice_id);
	
	
}
