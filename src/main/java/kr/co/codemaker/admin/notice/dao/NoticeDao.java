package kr.co.codemaker.admin.notice.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import kr.co.codemaker.admin.notice.model.NoticeVO;

@Repository("noticeDao")
public class NoticeDao extends EgovAbstractMapper implements NoticeDaoI {

	private static final Logger log = LoggerFactory.getLogger(NoticeDao.class);
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<NoticeVO> selectAllNotice(Map<String, Object> map) {
		log.debug("탐탐탐?3");
		return sqlSession.selectList("notice.selectAllNotice", map) ;
	}

	@Override
	public int noticeTotalCnt() {
		return sqlSession.selectOne("notice.noticeTotalCnt");
	}

	@Override
	public NoticeVO selectNotice(String notice_id) {
		
		return sqlSession.selectOne("notice.selectNotice", notice_id);
	}

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		return sqlSession.insert("notice.insertNotice", noticeVo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		return sqlSession.update("notice.updateNotice", noticeVo);
	}

	@Override
	public int deleteNotice(String notice_id) {
		return sqlSession.delete("notice.deleteNotice", notice_id);
	}

}
