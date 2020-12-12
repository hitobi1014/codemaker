package kr.co.codemaker.admin.chart.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.admin.chart.vo.LessonChartVO;
import kr.co.codemaker.admin.chart.vo.PayVO;
import kr.co.codemaker.common.vo.PageVo;


@Mapper("chartMapper")
public interface ChartMapper {

	List<PayVO> selectLessonPay(PageVo pageVo)throws Exception;

	int selectTotalCnt(PageVo pageVo)throws Exception;

	List<PayVO> lessonPayExcel()throws Exception;

	List<LessonChartVO> lessonPayTotal()throws Exception;

}
