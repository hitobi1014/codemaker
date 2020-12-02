package kr.co.codemaker.user.course.note.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

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
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
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
		
		String userId = "a001@naver.com";
		userVo.setUserId(userId);

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
		
		logger.debug("dddd");

//		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		
		String userId = "a001@naver.com";
//		userVo.setUserId(userId);

//		noteRequestVo.setUserId(userVo.getUserId());
		noteRequestVo.setUserId(userId);
		if (noteRequestVo.getPage() == 0) {
			noteRequestVo.setPage(1);
		}

		List<NoteVO> noteList = noteService.selectPageNote(noteRequestVo);
		logger.debug("note : {}" , noteList.size());
		int totalCnt = noteService.selecTotalCntNote(noteRequestVo);

		int pages = (int) Math.ceil((double) totalCnt / 5);

		noteRequestVo.setEndPage(pages);
		noteRequestVo.setStartPage(1);

		model.addAttribute("noteList", noteList);
		model.addAttribute("pages", pages);
		model.addAttribute("noteRequestVo", noteRequestVo);

		return "mypageT/user/note/noteAllSelect";
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

		return "mypageT/user/note/noteSelect";
	}

	/**
	 * 노트를 등록하는 화면을 요청하는 메소드
	 * 
	 * @author 김미연
	 * @return
	 */
	@RequestMapping(path = "/note/insertNote", method = { RequestMethod.GET })
	public String insertViewNote() {

		return "user/note/noteInsert";
	}

	/**
	 * 노트를 등록하는 메소드
	 * 
	 * @author 김미연
	 * @param noteVo
	 * @return
	 */
	@RequestMapping(path = "/note/insertNote", method = { RequestMethod.POST })
	public String insertNote(NoteVO noteVo, HttpSession session) {
		UserVO userVo = (UserVO) session.getAttribute("MEMBER_INFO");
		// noteVo.setUserId(userVo.getUserId());
		noteVo.setUserId("a001@naver.com");

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
	 * @param session
	 * @param response
	 */
	@RequestMapping(value = "/note/noteDownload")
	public void downloadPdf(ArrayList<NoteVO> noteList, HttpSession session, HttpServletResponse response) {
		String result = ""; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정

		List<NoteVO> noteLists = new ArrayList<NoteVO>();

		NoteVO n = new NoteVO();
		n.setNoteId("NOTE0010");

		NoteVO n2 = new NoteVO();
		n2.setNoteId("NOTE0009");

		noteList.add(n);
		noteList.add(n2);

		// DB에서 정보 가져오기
		for (NoteVO noteVo : noteList) {
			NoteVO nv = noteService.selectNote(noteVo);
			noteLists.add(nv);
		}

		// ------------------------------ pdf 파일 생성
		List<File> files = new ArrayList<>();
		for (NoteVO noteVo : noteLists) {
			// PDF를 작성하는 html
			String html2 = noteVo.getNoteCont().replaceAll("<br>", "<br/>");
			String html = "<html><head></head><body>"+ html2 +"</body></html>";
			
//			logger.debug("html : {} ", html);

			File downloadFile = new File(noteVo.getNoteTitle() + ".pdf");
			files.add(downloadFile);
			
			// 파일 IO 스트림을 취득한다.
			try (FileOutputStream os = new FileOutputStream(noteVo.getNoteTitle() + ".pdf")) {
				// Pdf형식의 document를 생성한다.
				Document document = new Document(PageSize.A4, 10, 10, 10, 10);
				// PdfWriter를 취득한다.
				PdfWriter writer = PdfWriter.getInstance(document, os);
				// document Open한다.
				document.open();
				
				// css를 설정할 resolver 인스턴스 생성
				StyleAttrCSSResolver cssResolver = new StyleAttrCSSResolver();

				// 폰트 설정
				XMLWorkerFontProvider font = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
				// window 폰트 설정
				font.register("c:/windows/fonts/malgun.ttf", "MalgunGothic");
				// 폰트 인스턴스를 생성한다.
				CssAppliersImpl cssAppliers = new CssAppliersImpl(font);
				// htmlContext의 pipeline 생성. (폰트 인스턴스 생성)
				HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
				htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());

				// pdf의 pipeline 생성.
				PdfWriterPipeline pdfPipeline = new PdfWriterPipeline(document, writer);
				// Html의pipeline을 생성 (html 태그, pdf의 pipeline설정)
				HtmlPipeline htmlPipeline = new HtmlPipeline(htmlContext, pdfPipeline);
				// css의pipeline을 합친다.
				CssResolverPipeline cssResolverPipeline = new CssResolverPipeline(cssResolver, htmlPipeline);
				// Work 생성 pipeline 연결
				XMLWorker worker = new XMLWorker(cssResolverPipeline, true);
				// Xml 파서 생성(Html를 pdf로 변환)
				XMLParser xmlParser = new XMLParser(true, worker, Charset.forName("UTF-8"));
				// 출력한다.
				try (StringReader strReader = new StringReader(html)) {
					xmlParser.parse(strReader);
				}
				// document의 리소스 반환
				document.close();

			} catch (Throwable e) {
				e.printStackTrace();
			}
		}

		// -------------------------- zip 파일 생성
		ZipOutputStream zout = null;
		String zipName = "codemakerNote.zip";
		
		byte[] buffer = new byte[1024];

		if (files.size() > 0) {
			try {
				zout = new ZipOutputStream(new FileOutputStream(zipName));
				FileInputStream in = null;

				for (int i = 0; i < files.size(); i++) {
					in = new FileInputStream(files.get(i));
					zout.putNextEntry(new ZipEntry(files.get(i).getName()));

					int len;
					while ((len = in.read(buffer)) > 0) {
						zout.write(buffer, 0, len);
					}
					zout.closeEntry();
					in.close();
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if (zout != null)
						zout.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		// -------------------------- 파일 다운로드
		// response content-type 설정
		response.setHeader("Content-Disposition", "attachment; filename=" + zipName);
		response.setContentType("application/octet-stream");

		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			bis = new BufferedInputStream(new FileInputStream(zipName));

			bos = new BufferedOutputStream(response.getOutputStream());

			int nn = 0;
			while ((nn = bis.read(buffer)) > 0) {
				bos.write(buffer, 0, nn);
				bos.flush();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bis != null)
					bis.close();
				if (bos != null)
					bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
