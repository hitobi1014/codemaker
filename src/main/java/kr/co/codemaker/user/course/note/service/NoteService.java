package kr.co.codemaker.user.course.note.service;

import java.io.FileOutputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.html.simpleparser.HTMLWorker;
import com.itextpdf.text.html.simpleparser.StyleSheet;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import kr.co.codemaker.common.vo.UserVO;
import kr.co.codemaker.user.course.note.dao.NoteMapper;
import kr.co.codemaker.user.course.note.vo.NoteRequestVO;
import kr.co.codemaker.user.course.note.vo.NoteVO;

/**
 * 
 * NoteService.java
 *
 * @author 김미연
 * @version 1.0
 * @since 2020. 12. 1.
 *
 *        수정자 수정내용 ------ ------------------------ 김미연 최초 생성
 *
 */
@Service("noteService")
public class NoteService {

	@Resource(name = "noteMapper")
	private NoteMapper noteMapper;

	/**
	 * 회원의 노트 목록 전체를 가져오는 메서드
	 * 
	 * @author 김미연
	 * @param userVo
	 * @return
	 */
	public List<NoteVO> selectAllNote(UserVO userVo) {

		try {
			return noteMapper.selectAllNote(userVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 회원의 노트 목록을 페이징 처리하여 가져오는 메서드
	 * 
	 * @author 김미연
	 * @param noteRequestVo
	 * @return
	 */
	public List<NoteVO> selectPageNote(NoteRequestVO noteRequestVo) {
		try {
			return noteMapper.selectPageNote(noteRequestVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 회원의 노트 목록의 총 개수를 가져오는 메소드
	 * 
	 * @author 김미연
	 * @param noteRequestVo
	 * @return
	 */
	public int selecTotalCntNote(NoteRequestVO noteRequestVo) {

		try {
			return noteMapper.selecTotalCntNote(noteRequestVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 회원 노트 1개의 정보를 가져오는 메소드
	 * 
	 * @author 김미연
	 * @param noteId
	 * @return
	 */
	public NoteVO selectNote(String noteId) {

		try {
			return noteMapper.selectNote(noteId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 노트를 등록하는 메소드
	 * 
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	public int insertNote(NoteVO noteVo) {

		try {
			return noteMapper.insertNote(noteVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 노트를 수정하는 메소드
	 * 
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	public int updateNote(NoteVO noteVo) {

		try {
			return noteMapper.updateNote(noteVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 노트를 삭제하는 메소드
	 * 
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	public int deleteNote(NoteVO noteVo) {

		try {
			return noteMapper.deleteNote(noteVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
