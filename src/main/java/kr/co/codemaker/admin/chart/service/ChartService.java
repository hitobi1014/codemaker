package kr.co.codemaker.admin.chart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.admin.chart.dao.ChartMapper;
import kr.co.codemaker.admin.chart.vo.PayVO;
import kr.co.codemaker.common.vo.PageVo;

@Service("chartService")
public class ChartService {

	@Resource(name="chartMapper")
	private ChartMapper chartMapper;

	public Map<String, Object> selectLessonPay(PageVo pageVo) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lesPayList", chartMapper.selectLessonPay(pageVo));
		
		int totalCnt = 0;
		
		totalCnt = chartMapper.selectTotalCnt(pageVo);
		
		
		int pages = (int)Math.ceil((double)totalCnt/5); 
		map.put("pages", pages);
		
		return map;
	}

	public List<PayVO> lessonPayExcel() throws Exception{
		return chartMapper.lessonPayExcel();
	}



}
