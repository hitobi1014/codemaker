package kr.co.codemaker.admin.notice.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.codemaker.admin.notice.dao.NoticeDaoI;
import kr.co.codemaker.admin.notice.model.NoticeVO;

/**
* NoticeService.java
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
@Service("noticeService")
public class NoticeService implements NoticeServiceI {
	
	private static final Logger log = LoggerFactory.getLogger(NoticeService.class);
	
	@Resource(name="noticeDao")
	private NoticeDaoI noticeDao;

	@Override
	public Map<String, Object> selectAllNotice(Map<String, Object> map) {
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("noticeList", noticeDao.selectAllNotice(map));
		// 15건, 페이지사이즈를 7로 가정했을때 3개의 페이지가 나와야한다
		// 15/7 = 2.14... 올림을 하여 3개의 페이지가 필요
		
		int cnt = noticeDao.noticeTotalCnt();
		
		int pages =(int) Math.ceil((double)cnt/(int) map.get("pageSize"));
		map2.put("pages", pages);
		return map2;
	}

	@Override
	public NoticeVO selectNotice(String notice_id) {
		return noticeDao.selectNotice(notice_id);
	}

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		return noticeDao.insertNotice(noticeVo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		return noticeDao.updateNotice(noticeVo);
	}

	@Override
	public int deleteNotice(String notice_id) {
		return noticeDao.deleteNotice(notice_id);
	}

}
