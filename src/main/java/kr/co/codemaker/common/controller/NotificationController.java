package kr.co.codemaker.common.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.codemaker.admin.vo.AdminVO;
import kr.co.codemaker.common.service.NotificationService;
import kr.co.codemaker.common.vo.NotificationVO;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.teacher.signup.vo.TeacherVO;

@Controller
public class NotificationController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(NotificationController.class);
	
	@Resource(name="notificationService")
	private NotificationService notificationService;
	
	@RequestMapping(path="/readNotification")
	public String readNotification(NotificationVO notificationVo, HttpSession session) {
	
		String recipientId = "";
		
		if(session.getAttribute("MEMBER_INFO") != null) {
			UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
			recipientId = userVo.getUserId();
			
		}else if(session.getAttribute("S_TEACHER") != null) {
			TeacherVO teacherVo = (TeacherVO) session.getAttribute("S_TEACHER");
			recipientId = teacherVo.getTchId();
			
		}else if(session.getAttribute("S_ADMIN") != null) {
			AdminVO adminVo = (AdminVO) session.getAttribute("S_ADMIN");
			recipientId = adminVo.getAdminId();
		}
		
		logger.debug("----------------------{}", recipientId);
		
		try {
			notificationService.readNotification(notificationVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		notificationVo.setRecipientId(recipientId);
		
		List<NotificationVO> notifyList = new ArrayList<NotificationVO>();
		int notifyCnt = 0;
		
		try {
			notifyList = notificationService.selectAllNotification(notificationVo);
			notifyCnt = notificationService.selectNotReadCount(notificationVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("notifyList", notifyList);
		session.setAttribute("notifyCnt", notifyCnt);
		
		return "jsonView";
	}
	
	
}
