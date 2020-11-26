package kr.co.codemaker.teacher.course.exam.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.codemaker.teacher.course.exam.model.AnswersheetVO;
import kr.co.codemaker.teacher.course.exam.model.ExamRequestVO;
import kr.co.codemaker.teacher.course.exam.model.ExamVO;
import kr.co.codemaker.teacher.course.exam.model.QuestionVO;

/**
 * 
* ExamDao.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 24.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
@Repository("examDao")
public class ExamDao implements ExamDaoI{
	
//	@Resource(name = "sqlSessionTemplate")
//	private SqlSessionTemplate sqlSession;

	@Override
	public String insertExam(ExamVO examVo) {
//		sqlSession.insert("exam.insertExam", examVo);
		
		examVo.setExam_id("exam1");
		
		return examVo.getExam_id();
	}
	
	@Override
	public String insertQuestion(QuestionVO questionVo) {
//		sqlSession.insert("exam.insertQuestion", questionVo);
		
		questionVo.setQue_id("question1");
		
		return questionVo.getQue_id();
	}

	@Override
	public int insertAnswersheet(AnswersheetVO answersheetVo) {
//		return sqlSession.insert("exam.insertAnswersheet",answersheetVo);
		
		return 1;
	}

	@Override
	public int updateExam(ExamVO examVo) {
//		return sqlSession.update("exam.updateExam", examVo);
		return 1;
	}
	
	@Override
	public int updateQuestion(QuestionVO questionVo) {
//		return sqlSession.update("exam.updateQuestion", questionVo);
		return 1;
	}

	@Override
	public int updateAnswersheet(AnswersheetVO answersheetVo) {
//		return sqlSession.update("exam.updateAnswersheet", answersheetVo);
		return 1;
	}

	@Override
	public List<ExamVO> selectAllExam(ExamRequestVO examRequestVo) {
//		return sqlSession.selectList("exam.selectAllExam", examRequestVo);
		List<ExamVO> examList = new ArrayList<ExamVO>();
		
		Date date = new Date();
		
		ExamVO ex1 = new ExamVO("exam1","test시험","수정중",date, "cur1", "les1");
		ExamVO ex2 = new ExamVO("exam1","test시험","수정중",date, "cur1", "les1");
		
		examList.add(ex1);
		examList.add(ex2);
		
		return examList;
	}
	
	@Override
	public int selectTotalCntExam(ExamRequestVO examRequestVo) {
//		return sqlSession.selectOne("exam.selectTotalCntExam", examRequestVo);
		return 2;
	}
	
	@Override
	public ExamVO selectExam(ExamVO examVo) {
//		return sqlSession.selectOne("exam.selectExam", examVo);
		Date date = new Date();
		ExamVO ex1 = new ExamVO("exam1","test시험","수정중",date, "cur1", "les1");
		
		return ex1;
	}
	
	@Override
	public List<QuestionVO> selectQuestion(ExamVO examVo) {
//		return sqlSession.selectList("exam.selectQuestion", examVo);
		List<QuestionVO> queList = new ArrayList<>();
		
		QuestionVO qu1 = new QuestionVO("qu1","문제1","1","문제1해설","exam1");
		QuestionVO qu2 = new QuestionVO("qu2","문제2","2","문제2해설","exam1");
		
		queList.add(qu1);
		queList.add(qu2);
		
		return queList;
	}
	
	@Override
	public List<AnswersheetVO> selectAnswersheet(QuestionVO questionVo) {
//		return sqlSession.selectList("exam.selectAnswersheet", questionVo);
		List<AnswersheetVO> anList = new ArrayList<>();
		
		AnswersheetVO an1 = new AnswersheetVO("an1", "an11","qu1");
		AnswersheetVO an2 = new AnswersheetVO("an2", "an12","qu1");
		AnswersheetVO an3 = new AnswersheetVO("an3", "an13","qu1");
		AnswersheetVO an4 = new AnswersheetVO("an4", "an14","qu1");
		
		AnswersheetVO an5 = new AnswersheetVO("an5", "an21","qu2");
		AnswersheetVO an6 = new AnswersheetVO("an6", "an22","qu2");
		AnswersheetVO an7 = new AnswersheetVO("an7", "an23","qu2");
		AnswersheetVO an8 = new AnswersheetVO("an8", "an24","qu2");
		
		anList.add(an1);
		anList.add(an2);
		anList.add(an3);
		anList.add(an4);
		anList.add(an5);
		anList.add(an6);
		anList.add(an7);
		anList.add(an8);
		
		return anList;
	}

	@Override
	public int deleteExam(ExamVO examVo) {
//		return sqlSession.delete("exam.deleteExam", examVo);
		return 1;
	}

	@Override
	public int deleteQuestion(ExamVO examVo) {
//		return sqlSession.delete("exam.deleteQuestion", examVo);
		return 1;
	}

	@Override
	public int deleteAnswersheet(QuestionVO questionVo) {
//		return sqlSession.delete("exam.deleteExam", questionVo);
		return 1;
	}


}
