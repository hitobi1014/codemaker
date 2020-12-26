package kr.co.codemaker.teacher.resume.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.codemaker.common.service.NotificationService;
import kr.co.codemaker.common.vo.NotificationVO;
import kr.co.codemaker.common.util.MkDir;
import kr.co.codemaker.teacher.resume.service.ResumeService;
import kr.co.codemaker.teacher.signup.vo.ResumeVO;

@Controller
public class ResumeController {
	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);
	
	@Resource(name="resumeService")
	private ResumeService resumeService;
	
	@Resource(name="notificationService")
	private NotificationService notificationService;
	
	
	@RequestMapping(path="/resume/view", method = RequestMethod.GET)
	public String resumeView() {
		
		return "mainT/teacher/resume/resumeInsert";
	}
	
	@RequestMapping(path="/resume/insert", method = RequestMethod.POST)
	public String insertResume(ResumeVO resumeVO, @RequestParam(name="profile")MultipartFile file) throws Exception {
		MkDir dir = new MkDir();
		dir.mkdirTeacher();	//아래 해당하는 경로에 폴더가 없을시 폴더 생성 하는 클래스
		Path path = Paths.get("C:","file","teacher","profile",file.getOriginalFilename());	//파일구분자를 운영체제에 맞게 잡아줌
		File fileUpload = path.toFile();
		if(file.getSize() > 0) {
			try {
				file.transferTo(fileUpload);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		resumeVO.setResProfile("d:/file/" + file.getOriginalFilename());
		
		NotificationVO notificationVo = new NotificationVO();
		notificationVo.setRecipientId("admin");
		notificationVo.setSenderId(resumeVO.getResNm());
		notificationVo.setNotifyCont(resumeVO.getResNm() + " 님이 이력서를 제출하였습니다.");
		
		resumeVO.setResProfile(path.toString());	//파일 경로 지정
		int insertCnt = 0;
		try {
			insertCnt = resumeService.insertResume(resumeVO);
			notificationService.insertNotification(notificationVo);
			
			logger.debug("insertCnt 뭐가 들었냐~!~!~! : {}", insertCnt );
			
			if(insertCnt == 1) {
				return "mainT/teacher/resume/success";
			}
		} catch (Exception e) {}
		return "mainT/teacher/resume/resumeInsert";
	}
	
	// 메인 강사 이미지 처리
	@RequestMapping(path="/teacher/teacherImg")
	public void imgView(String tchProfile, HttpServletResponse response) throws IOException {
		response.setContentType("image");
		FileInputStream fis = new FileInputStream(tchProfile);
		ServletOutputStream sos = response.getOutputStream();
		byte[] buffer = new byte[512];
		while(fis.read(buffer) != -1) {
			sos.write(buffer);
		}
		fis.close();
		sos.flush();
		sos.close();
	}	

	@RequestMapping(path="/success")
	public String success() {
		return "mainT/teacher/resume/success";
	}
	
}
