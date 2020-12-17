package kr.co.codemaker.admin.company.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

import kr.co.codemaker.admin.company.service.CompanyService;
import kr.co.codemaker.admin.company.vo.CompanyVO;
import kr.co.codemaker.admin.jobinfo.controller.AdminJobInfoController;

/**
* CompanyController.java
*
* @author 박다미
* @version 1.0
* @since 2020. 12. 15.
*
* 수정자 수정내용
* ------ ------------------------
* 박다미 최초 생성
*
 */

@Controller
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminJobInfoController.class);
	
	@Resource(name="companyService")
	private CompanyService companyService;
	
	
	
	/**
	 * 관리자 - 기업리스트 조회
	 * @param page
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping(path="/admin/selectAllCompany")
	public String selectAllCompany(@RequestParam(name="page", required = false, defaultValue = "1") int page, 
			@RequestParam(name="pageSize", required = false, defaultValue = "3")int pageSize,Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("pageSize", pageSize);
		
		logger.debug("map {}", map);
		
		try {
			map = companyService.selectAllCompany(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("companyList",map.get("companyList"));
		model.addAttribute("page",page);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pages", map.get("pages"));
		return "adminPage/admin/company/companyAllSelect";
	}
	
	
	/**
	 * 관리자 - 기업 계약서 조회
	 * @param comId
	 * @param model
	 * @return
	 */
	@RequestMapping(path="/admin/companyContract")
	public String contractTest(String comId, Model model) {
		CompanyVO companyVO = new CompanyVO();
		companyVO.setComId(comId);
		
		try {
			companyVO = companyService.selectCompany(companyVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("companyVO", companyVO);
		return "admin/company/companyContract";
	}

	/**
	 * html태그를 pdf파일로 변환 테스트
	 * @param comId
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(path="/pdfTest" ,method=RequestMethod.POST)
	public void contractTest(String imgData,HttpServletResponse response, HttpServletRequest request) {
		//1. comId넘어오는지?
//		logger.debug("회사아이디!!:{}",comId);
//		CompanyVO companyVO = new CompanyVO();
//		companyVO.setComId(comId);
		
		//2. html태그 넘어오는지?
		logger.debug("이미지 url:{}",imgData);
		
		String filePath ="C:\\pdf\\";
		String FileName = "test.pdf";
		
		// base64 -> pdf로 만들기
		try {
			byte[] input_file = Files.readAllBytes(Paths.get(filePath+FileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
}
