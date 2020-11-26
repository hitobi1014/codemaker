package kr.co.codemaker.admin.notice.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.codemaker.ModelTestConfig;
import kr.co.codemaker.admin.notice.model.NoticeVO;
import kr.co.codemaker.admin.notice.service.NoticeServiceI;


public class NoticeServiceTest extends ModelTestConfig{

	
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceTest.class);
	
	@Resource(name="noticeService")
	private NoticeServiceI noticeService;
	
	@Test
	public void insertNoticeTest() {
		/***Given***/
		NoticeVO noticeVo = new NoticeVO();
		
		String notice_id = "notice99";
		String notice_title = "테스트공지입니다";	
		String notice_cont = "aaa 마이크 테슽";		
		String notice_head = "3";		
		String admin_id = "park";
		
		noticeVo.setNotice_id(notice_id);
		noticeVo.setNotice_title(notice_title);
		noticeVo.setNotice_cont(notice_cont);
		noticeVo.setNotice_head(notice_head);
		noticeVo.setAdmin_id(admin_id);
		
		/***When***/
		logger.debug("noticeVo {}", noticeVo);
		
		int cnt = noticeService.insertNotice(noticeVo);
		logger.debug("cnt {}", cnt);
		
		/***Then***/
		assertEquals(cnt, 1);
		
	}

}
