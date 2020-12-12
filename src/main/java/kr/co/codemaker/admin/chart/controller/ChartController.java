package kr.co.codemaker.admin.chart.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.hsqldb.auth.AuthUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.codemaker.admin.chart.service.ChartService;
import kr.co.codemaker.admin.chart.vo.LessonChartVO;
import kr.co.codemaker.admin.chart.vo.LessonVO;
import kr.co.codemaker.admin.chart.vo.PayVO;
import kr.co.codemaker.admin.course.schedule.vo.ScheduleVO;
import kr.co.codemaker.common.vo.PageVo;

@Controller
public class ChartController {
	private static final Logger logger = LoggerFactory.getLogger(ChartController.class);
	
	@Resource(name="chartService")
	private ChartService chartService;
	
	@RequestMapping("/admin/selectLessonPay")
	public String selectLessonPay(PayVO payVo, Model model,
			@RequestParam(name="page",required = false, defaultValue = "1")int page,
			@RequestParam(name="pageSize", required = false, defaultValue = "5")int pageSize) {
		
		model.addAttribute("page",page);
		model.addAttribute("pageSize", pageSize);
	
		PageVo pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		model.addAttribute("pageVo", pageVo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = chartService.selectLessonPay(pageVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//강의별 매출 통계 select
		List<LessonChartVO> lessonPayTotal= new ArrayList<>();
		try {
			lessonPayTotal = chartService.lessonPayTotal();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("lesPayList", map.get("lesPayList"));
		model.addAttribute("pages", map.get("pages"));
		model.addAttribute("lessonPayTotal", lessonPayTotal);
		
//		LessonChartVO Vo = new LessonChartVO();
//		LessonChartVO aa = lessonPayTotal.get(0);
//		
//		int i = 30;
//		int j = 20;
//		
//		JSONArray jarray = new JSONArray();
//		for(LessonChartVO lessonChartVO : lessonPayTotal) {
//			JSONObject sobj = new JSONObject();
//			
//			sobj.put("label", lessonChartVO.getLesId());
//			sobj.put("backgroundColor", "rgb(255,"+ j + ", "+ i +")");
//			sobj.put("borderColor", "rgb(255, "+ j + ", "+ i + ")");
//			sobj.put("fill", "false");
//			sobj.put("data", lessonChartVO.toString()); //data만 문자열로 인식
//			sobj.put("data", lessonChartVO.getResult());
//			
//			i = i + 40;
//			j = j + 90;
//			
//			jarray.add(sobj);
//		}
		
		//json으로 보냈더니 =>"",  replace 사용해서 "[를 =>[로 바꾸기
		
//		String a = jarray.toJSONString(); 
//		logger.debug("aa : {}", a.replace("\"[", "[").replace("]\"", "]"));
		
//		model.addAttribute("jarray", a.replace("\"[", "[").replace("]\"", "]"));
//		model.addAttribute("jarray", a.replace("\"", ""));
//		model.addAttribute("jarray", jarray);

		

		return "adminPage/admin/chart/paychart";
	}
	
	

	@RequestMapping("/admin/downExcel")
	public void excelList(HttpServletRequest request 
	                          ,HttpServletResponse response, Model model ) throws Exception  {

//	    if( !AuthUtil.isAdmin()) {
//	        param.put("account", AuthUtil.getCurrentUserAccount());
//	    }
	    
		// 평소에 마이바티스에서 데이터 뽑는 방법으로 데이터를 가져온다.
		List<PayVO> lesPayList = chartService.lessonPayExcel();
		
		
		// 받은 데이터를 맵에 담는다.
	    Map<String , Object> beans = new HashMap<String , Object>();
	    beans.put("lesPayList", lesPayList);
	    logger.debug("lesPayList : {} " , lesPayList.get(1));

	    //FIX: 한글 NAME 안되는 현상 해결하기
	    ExcelUtil excelUtil = new ExcelUtil();
	    excelUtil.download(request, response, beans, "excel",  "ExcelTemplate.xlsx");
	}

}
