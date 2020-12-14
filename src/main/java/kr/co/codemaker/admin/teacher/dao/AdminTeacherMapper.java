package kr.co.codemaker.admin.teacher.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.codemaker.admin.teacher.vo.TeacherVO;

/**
* AdminTeacherMapper.java
*
* @author 최민준
* @version 1.0
* @since 2020. 12. 14.
*
* 수정자 수정내용
* ------ ------------------------
* 최민준 선생님 전체 조회
*
 */
@Mapper("adminTeacherMapper")
public interface AdminTeacherMapper {

	public List<TeacherVO> selectAllTeacher() throws Exception;
}
