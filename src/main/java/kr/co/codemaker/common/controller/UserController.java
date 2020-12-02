package kr.co.codemaker.common.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.codemaker.common.service.UserService;
import kr.co.codemaker.common.vo.UserVO;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Resource(name="userService")
	private UserService userService;
	
	
	@RequestMapping("/join/insertUserView")
	public String insertUserView() {
		
		return "user/signup/signup";
	}
	
	
	@RequestMapping("/join/insertUser")
	public String insertUser(UserVO userVo, MultipartFile file) {
		
		logger.debug("로거로거로거");
		
		String fileName = UUID.randomUUID().toString();

		File uploadFile = new File("d:\\upload\\" + file.getOriginalFilename());
		if (file.getSize() > 0) {
			try {
				file.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 사용자정보등록
//		userVo.setRealFilename(file.getOriginalFilename());
//		userVo.setFilename("d:\\upload\\" + file.getOriginalFilename());
		userVo.setUserProfile("d:\\upload\\" + file.getOriginalFilename());
		
		
		int insertCnt = 0;
		

		try {
			insertCnt = userService.insertUser(userVo);

			logger.debug("insertCnt!!! : {}",insertCnt);
			logger.debug("Uservo : {}",userVo);
			// 1건이 입력되었을때 :정상 ->memberList 페이지로 이동
			// 1건이 아닐때: 비정상
			if (insertCnt == 1) {
				// 서버의 상태가 바뀔때는 중복이 되지 않게 redirect요청을 해준다.
				// redirect한다는것은 메소드 인자를 웹 브라우저 주소창에 넣으라는 것이기 떄문에 정상동작이 안될수 있으므로 contextpath넣어주기
//				return "redirect:/member/memberSelect?userid="+user_id;
				return "test";
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		
		return "signup/signup";
	}
	
    @ResponseBody
    @RequestMapping("/join/idchk")
    public String idchk(UserVO userVo) {
        logger.debug("타긴타는곤가?");
        int result = userService.idchk(userVo);
        logger.debug("result:{}",result);
        if(result ==1) {//결과 값이 있으면 아이디 존재    
            return "1";
        } else {        //없으면 아이디 존재 X
            return "0";
        }
    }
}
