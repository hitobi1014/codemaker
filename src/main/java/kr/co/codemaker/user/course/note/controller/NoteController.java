package kr.co.codemaker.user.course.note.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.compiler.ServletWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.course.note.service.NoteService;
import kr.co.codemaker.user.course.note.vo.NoteRequestVO;
import kr.co.codemaker.user.course.note.vo.NoteVO;

/**
 * 
 * NoteController.java
 *
 * @author 김미연
 * @version 1.0
 * @since 2020. 12. 1.
 *
 *        수정자 수정내용 ------ ------------------------ 김미연 최초 생성
 *
 */
@Controller
public class NoteController {

	@Resource(name = "noteService")
	private NoteService noteService;

	private static final Logger logger = LoggerFactory.getLogger(NoteController.class);

	/**
	 * 회원의 노트 목록 전체를 가져오는 메서드
	 * 
	 * @author 김미연
	 * @param userVo
	 * @return
	 */
	@RequestMapping(path = "/note/selectAllNote")
	public String selectAllNote(HttpSession session) {

		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");

		noteService.selectAllNote(userVo);

		return "";

	}

	/**
	 * 회원의 노트 목록을 페이징 처리하여 가져오는 메서드
	 * 
	 * @author 김미연
	 * @param noteRequestVo
	 * @return
	 */
	@RequestMapping(path = "/note/selectPageNote")
	public String selectPageNote(NoteRequestVO noteRequestVo, HttpSession session, Model model) {

		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");

		noteRequestVo.setUserId(userVo.getUserId());
		if (noteRequestVo.getPage() == 0) {
			noteRequestVo.setPage(1);
		}

		List<NoteVO> noteList = noteService.selectPageNote(noteRequestVo);
		int totalCnt = noteService.selecTotalCntNote(noteRequestVo);

		int pages = (int) Math.ceil((double) totalCnt / 5);

		noteRequestVo.setEndPage(pages);
		noteRequestVo.setStartPage(1);

		model.addAttribute("noteList", noteList);
		model.addAttribute("pages", pages);
		model.addAttribute("noteRequestVo", noteRequestVo);

		return "";
	}

	/**
	 * 회원 노트 1개의 정보를 가져오는 메소드
	 * 
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	@RequestMapping(path = "/note/selectNote")
	public String selectNote(NoteVO noteVo, Model model) {

		NoteVO nv = noteService.selectNote(noteVo);

		model.addAttribute("noteVo", nv);

		return "";
	}

	/**
	 * 노트를 등록하는 화면을 요청하는 메소드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping(path = "/note/insertNote", method = { RequestMethod.GET })
	public String insertViewNote() {

		return "";
	}

	/**
	 * 노트를 등록하는 메소드
	 * 
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	@RequestMapping(path = "/note/insertNote", method = { RequestMethod.POST })
	public String insertNote(NoteVO noteVo) {

		noteService.insertNote(noteVo);

		return "";
	}

	/**
	 * 노트를 수정하는 화면을 요청하는 메소드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping(path = "/note/updateNote", method = { RequestMethod.GET })
	public String updateViewNote() {

		return "";
	}

	/**
	 * 노트를 수정하는 메소드
	 * 
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	@RequestMapping(path = "/note/updateNote", method = { RequestMethod.POST })
	public String updateNote(NoteVO noteVo) {

		noteService.updateNote(noteVo);

		return "";
	}

	/**
	 * 노트를 삭제하는 메소드
	 * 
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	@RequestMapping(path = "/note/deleteNote")
	public String deleteNote(NoteVO noteVo) {

		noteService.deleteNote(noteVo);

		return "";
	}

	/**
	 * 노트를 압축파일로 저장하는 메소드
	 * 
	 * @author 김미연
	 * @param noteList
	 */
	@RequestMapping(path = "/note/noteDownload")
	public void noteDownload(ArrayList<NoteVO> noteList, HttpServletResponse response) throws Exception {

		List<NoteVO> noteLists = new ArrayList<NoteVO>();

		// NOTE0001
		// NOTE0002
		// NOTE0003
		// NOTE0004
		// NOTE0005

		NoteVO n = new NoteVO();
		n.setNoteId("NOTE0001");

		NoteVO n2 = new NoteVO();
		n2.setNoteId("NOTE0002");

		noteList.add(n);
		noteList.add(n2);

		// db에서 정보 가져오기
		for (NoteVO noteVo : noteList) {
			NoteVO nv = noteService.selectNote(noteVo);
			noteLists.add(nv);
		}

		for (NoteVO noteVo : noteLists) {
			logger.debug("bbb");

			String texts = noteVo.getNoteCont().replaceAll("<br>", "\r\n").replace("<p>", "").replace("</p>", "");

			logger.debug(texts);

			File downloadFile = new File(noteVo.getNoteTitle() + ".txt");
			
			// BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
			BufferedWriter fw = new BufferedWriter(new FileWriter(downloadFile));

			// 파일안에 문자열 쓰기
			fw.write(texts);
			fw.flush();

			// 객체 닫기
			fw.close();

			// response content-type 설정
			response.setHeader("Content-Disposition", "attachment; filename=" + noteVo.getNoteTitle() + ".txt");
			response.setContentType("text/plain");

			FileInputStream fis = new FileInputStream(downloadFile);

			// file -> 문자열(text) : write , 이진파일 : outputStream
			ServletOutputStream sos = response.getOutputStream();

			byte[] buffer = new byte[1024];

			while (fis.read(buffer) != -1) {
				sos.write(buffer);
			}

			fis.close();
			sos.flush(); // 응답이 안간 부분이 있으면 처리한다.
			sos.close();
		}
	}

}
