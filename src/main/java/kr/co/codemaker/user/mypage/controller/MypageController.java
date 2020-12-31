package kr.co.codemaker.user.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jxl.biff.formula.ParseContext;
import kr.co.codemaker.common.vo.PageVo;
import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.mypage.service.MypageService;
import kr.co.codemaker.user.mypage.vo.PointVO;
/**
* MypageController.java
*
* @author 우송이
* @version 1.0
* @Since 2020. 12.
*
* 수정자 수정내용
* ------ ------------------------
* 우송이 마이페이지
*
 */
@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Resource(name="mypageService")
	private MypageService mypageService;
	

	/**
	 * 회원정보 조회
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/mypage/myinfoSelect")
	public String myinfoSelect(Model model,HttpSession session,HttpServletRequest request) {
		
		UserVO userVo = new UserVO();

        userVo =  (UserVO) session.getAttribute("MEMBER_INFO");
        
        String userId = userVo.getUserId();
		userVo.setUserId(userId);
		
		try {
			userVo = mypageService.myinfoSelect(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//전화번호 "-"출력
		String userTel = userVo.getUserTel().substring(0, 3)+" - "+userVo.getUserTel().substring(3, 7)+" - "+userVo.getUserTel().substring(7, 11);
		userVo.setUserTel(userTel);
		
		model.addAttribute("userVo", userVo);
		
		return "mypageT/user/mypage/mypage_myinfo";
	}
	
	/**
	 * 회원정보조회-회원 프로필사진
	 * @param model
	 * @param response
	 * @param session
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/mypage/profileImg")
	public void profileImg(Model model, HttpServletResponse response,HttpSession session,HttpServletRequest request) throws Exception {

		UserVO userVo = new UserVO();
        userVo =  (UserVO) session.getAttribute("MEMBER_INFO");
        
        String userId = userVo.getUserId();
		userVo.setUserId(userId);
		
		userVo = mypageService.myinfoSelect(userId);
		
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

	/**
	 * 회원탈퇴 View
	 * @return
	 */
    @RequestMapping(path="/mypage/deleteUserView")
    public String deleteUserView() {
    	
    	return "mypageT/user/mypage/mypage_deleteUser";
    }
    
    /**
     * 회원탈퇴
     * @param userVo
     * @return
     */
    @ResponseBody
    @RequestMapping(path="/mypage/deleteUser")
    public String deleteUser(UserVO userVo,HttpSession session) {

    	String userId= userVo.getUserId(); 
    	String userPass=userVo.getUserPass();
    	
    	userVo.setUserId(userId);
    	userVo.setUserPass(userPass);
		
		int deleteCnt=0;
		try {
			deleteCnt = mypageService.deleteUser(userVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(deleteCnt == 1) {
			session.invalidate();
			return "1";
		}else {
			return "0";
		}
    	
    }

    /**
     * 회원정보수정 View
     * @param model
     * @param userVo
     * @param session
     * @param request
     * @return
     */
	@RequestMapping(path="/mypage/updateUserView")
	public String updateUserView(Model model,UserVO userVo,HttpSession session,HttpServletRequest request) {
		
		//세션에서아이디가져온다.
        userVo =  (UserVO) session.getAttribute("MEMBER_INFO");
        
        String userId = userVo.getUserId();
		userVo.setUserId(userId);
		
		try {
			userVo = mypageService.myinfoSelect(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("userVo", userVo);
		
		return "mypageT/user/mypage/mypage_update";
	}
	
	/**
	 * 회원정보수정
	 * @param session
	 * @param userVo
	 * @param file
	 * @return
	 */
	@RequestMapping(path="/mypage/updateUser")
	public String updateUser(HttpSession session, UserVO userVo, @RequestParam("file")MultipartFile file){
		
		
		String userId = userVo.getUserId();
		
		int updateCnt=0;
		try {
			updateCnt = mypageService.updateUser(userVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
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
	

	/**
	 * 회원 포인트 조회
	 * @param session
	 * @param request
	 * @param pointVo
	 * @param model
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(path="/mypage/selectPoint")
	public String selectPoint(HttpSession session, HttpServletRequest request, PointVO pointVo, Model model,
								@RequestParam(name="page",required = false, defaultValue = "1")int page,
								@RequestParam(name="pageSize", required = false, defaultValue = "5")int pageSize) {

		//세션에서아이디가져온다.
        UserVO userVo =  (UserVO) session.getAttribute("MEMBER_INFO");
        
        String pointUser = userVo.getUserId();
        String userId = pointUser;
		
		model.addAttribute("page",page);
		model.addAttribute("pageSize", pageSize);
	
		PageVo pageVo = new PageVo();
		pageVo.setUserId(userId);
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		model.addAttribute("pageVo", pageVo);
		
		Map<String, Object> map = mypageService.selectPoint(pageVo);
		
		//회원현재 보유포인트 조회
		int totalPoint = 0;
		
		try {
			totalPoint = mypageService.deletePointCompare(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("pointList", map.get("pointList"));
		model.addAttribute("pages", map.get("pages"));
		model.addAttribute("totalPoint", totalPoint);
		
		
		return "mypageT/user/mypage/pointTest";
	}
	

	/**
	 * 회원 포인트 적립 
	 * @param pointVo
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(path="/mypage/insertPoint")
	public String insertPoint(PointVO pointVo,HttpSession session, HttpServletRequest request) {
		
		//세션에서아이디가져온다.
        UserVO userVo =  (UserVO) session.getAttribute("MEMBER_INFO");
        
        String pointUser = userVo.getUserId();
        String userId = pointUser;
		
		pointVo.setUserId(userId);
		
		int insertCnt=0;
		
		try {
			insertCnt=mypageService.insertPoint(pointVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mypage/selectPoint";
	}
	
	
	/**
	 * 회원 포인트 환불
	 * @param pointVo
	 * @param session
	 * @return
	 */
	@RequestMapping(path="/mypage/deletePoint" ,method=RequestMethod.POST)
	@ResponseBody
	public String deletePoint(PointVO pointVo, HttpSession session) {
		
        UserVO userVo =  (UserVO) session.getAttribute("MEMBER_INFO");
        
        String pointUser = userVo.getUserId();
        String userId = pointUser;
        
		int pointSum=pointVo.getPointSum();
		int pointUpdate=pointVo.getPointUpdate();
				
		pointVo.setUserId(userId);
		pointVo.setPointSum(pointSum);
		
		//생각을 해보자
		//만약. 한 회원의 환불총합계(pointSum)보다 환불하려는 금액(pointUpdate)이 더 큰 경우
		//환불할 수 없다.
		//DB에서 환불총합계(pointSum)최근 데이터 중 하나만 불러오기 
		//회원이 입력한 환불하려는 금액(pointUpdate)이 쿼리에서 불러온 최근데이터 합계(point)보다 작으면
		//환불 실행 => redirect
		//회원이 입력한 환불하려는 금액(pointUpdate)이 쿼리에서 불러온 최근데이터 합계(point)보다 크면
		//포인트 환불 노노!!! 환불 실패시 => 어디로 리턴할 것인가? 이제 생각해보자.. 
		
		int point = 0;
		try {
			//환불시 회원이 환불하려는 금액과 회원의 포인트 잔액과 조회
			point = mypageService.deletePointCompare(userId);
		} catch (Exception e1) {
			e1.printStackTrace();
		}  
		if(point < pointUpdate){
			
			String pp = "1";
			return pp;
		}else {
			int deleteCnt=0;
			try {
				deleteCnt=mypageService.deletePoint(pointVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "0";
		}
//		return "redirect:/mypage/selectPoint";
	}
	
	
    
}
