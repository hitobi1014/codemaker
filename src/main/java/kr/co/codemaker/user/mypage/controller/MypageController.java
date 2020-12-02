package kr.co.codemaker.user.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.codemaker.common.vo.PageVo;
import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.mypage.service.MypageService;
import kr.co.codemaker.user.mypage.vo.PointVO;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Resource(name="mypageService")
	private MypageService mypageService;
	

	@RequestMapping("/mypage/myinfoSelect")
	public String myinfoSelect(Model model,HttpSession session) {
		String userId = "mem001@naver.com";
		
		UserVO userVo = new UserVO();
		try {
			userVo = mypageService.myinfoSelect(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.debug("유저 {}",userVo);
		
		String userTel = userVo.getUserTel().substring(0, 3)+" - "+userVo.getUserTel().substring(3, 7)+" - "+userVo.getUserTel().substring(7, 11);
		
		userVo.setUserTel(userTel);
		
		model.addAttribute("userVo", userVo);
		
		return "mypageT/user/mypage/mypage_myinfo";
	}
	
	@RequestMapping("/mypage/profileImg")
	public void profileImg(Model model, HttpServletResponse response) throws Exception {
		
		
		String userId = "mem001@naver.com";
		
//		model.addAttribute("user_profile", userVo.getUser_profile());
		
		UserVO userVo = mypageService.myinfoSelect(userId);
//		logger.debug("userVo:{}",userVo);
		
		//경로확인 후 파일 입출력을 통해 응답생성
		//파일을 읽고 응답생성

		FileInputStream fis = new FileInputStream(userVo.getUserProfile());
		ServletOutputStream sos =  response.getOutputStream();
		
		byte[] buffer = new byte[512];
		
		while (fis.read(buffer) != -1) {
			sos.write(buffer);
		}
		
		fis.close();
		sos.flush(); 
		sos.close();
		
	}
	
	@RequestMapping("/mypage/deleteUser")
	public String deleteUser(HttpSession session) {
		
		String userId = "mem001@naver.com";
//		String user_id = session.getAttribute("user_id");
		
		try {
			int deleteCnt = mypageService.deleteUser(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/user/login";
	}
	
	@RequestMapping(path="/mypage/updateUser", method=RequestMethod.GET)
	public String updateUser(Model model,UserVO userVo) {
//		String user_id = session.getAttribute("user_id");
		
		//세션에서아이디가져온다.
		String userId = "mem001@naver.com";
		
		userVo.setUserId(userId);
		
		try {
			userVo = mypageService.myinfoSelect(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("userVo", userVo);
		
		logger.debug("userVO get~!~! : {} ",userVo);
		return "mypageT/user/mypage/mypage_update";
	}
	
	@RequestMapping(path="/mypage/updateUser", method=RequestMethod.POST)
	public String updateUser(HttpSession session, UserVO userVo, @RequestParam("file")MultipartFile file){
		
//		String user_id = session.getAttribute("user_id");
		
		//세션에서아이디가져온다.
		String userId = "mem001@naver.com";
		
		int updateCnt=0;
		try {
			updateCnt = mypageService.updateUser(userVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("업데이트 후 : {}",userVo);
		
		
		//파일을 체크하는 방법. 사이즈가 0보다 크다. 새로운파일로 바뀌었다.//기존파일이다? 0임. 안담겨있음. 그래서구분이되기때문에. 0보다크다는것은
		//파일이 새로 들어왔다!!
		if (file.getSize() > 0) {
			
			try {
				File uploadFile = new File("d:\\upload\\" + file.getOriginalFilename());
				String fileName = UUID.randomUUID().toString();
				file.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			userVo.setUserProfile("d:\\upload\\" + file.getOriginalFilename());
			
			try {
				updateCnt = mypageService.updateUser(userVo);
				logger.debug("파일을 새로 업데이트 했을 경우 : {}",userVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else {
			try {
				userVo =mypageService.myinfoSelect(userId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			userVo.setUserProfile(userVo.getUserProfile());
		}
		
		if(updateCnt==1) {
			return "redirect:/mypage/myinfoSelect?user_id="+userId;
		}else {
			return "mypageT/user/mypage/mypage_update";
		}

	}

//------------------------------------------POINT CONTROLLER----------------------------------------------------
	
	
	
	@RequestMapping(path="/mypage/selectPoint")
	public String selectPoint(HttpSession session, PointVO pointVo, Model model,
								@RequestParam(name="page",required = false, defaultValue = "1")int page,
								@RequestParam(name="pageSize", required = false, defaultValue = "5")int pageSize) {
		
		logger.debug("시작입니다!!!!!!!: {}");
		String userId= "mem001@naver.com";
		
		logger.debug("브이오 !!!!!!: {}" ,pointVo);
		model.addAttribute("page",page);
		model.addAttribute("pageSize", pageSize);
	
		PageVo pageVo = new PageVo();
		pageVo.setUserId(userId);
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		model.addAttribute("pageVo", pageVo);
		
		Map<String, Object> map = mypageService.selectPoint(pageVo);
		
		model.addAttribute("pointList", map.get("pointList"));
		model.addAttribute("pages", map.get("pages"));
		
		
		return "mypageT/user/mypage/mypage_selectPoint";
	}
	

	@RequestMapping(path="/mypage/insertPoint" ,method=RequestMethod.POST)
	public String insertPoint(PointVO pointVo) {
		
		logger.debug("충전 인서트~!!!!!!");
		logger.debug("ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ : {}", pointVo.getPointUpdate());
		
		String userId= "mem001@naver.com";
		String pointSum=pointVo.getPointUpdate();
		
		pointVo.setUserId(userId);
		pointVo.setPointSum(pointSum);
		
		int insertCnt=0;
		
		logger.debug("pointVo:{}",pointVo);
		
		
		try {
			insertCnt=mypageService.insertPoint(pointVo);
			logger.debug("pointVo:{}",pointVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/mypage/selectPoint";
	}
	
	
	@RequestMapping(path="/mypage/deletePoint" ,method=RequestMethod.POST)
	public String deletePoint(PointVO pointVo) {
		
		logger.debug("환불 인서트~!!!!!!");
		logger.debug("ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ : {}", pointVo.getPointUpdate());
		
		String userId= "mem001@naver.com";
		String pointSum=pointVo.getPointUpdate();
		
		pointVo.setUserId(userId);
		pointVo.setPointSum(pointSum);
		
		int deleteCnt=0;
		
		logger.debug("pointVo:{}",pointVo);
		
		
		try {
			deleteCnt=mypageService.deletePoint(pointVo);
			logger.debug("pointVo:{}",pointVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/mypage/selectPoint";
	}
	
	

	
}
