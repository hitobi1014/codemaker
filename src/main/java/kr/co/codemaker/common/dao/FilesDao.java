package kr.co.codemaker.common.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.codemaker.model.FilesVO;

@Repository("filesDao")
public class FilesDao implements FilesDaoI {

	
	private static final Logger logger = LoggerFactory.getLogger(FilesDao.class);
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertFiles(FilesVO filesVo) {
		logger.debug("다오까지 오냐?");
		return sqlSession.insert("files.insertFiles", filesVo);
	}

	@Override
	public List<FilesVO> selectAllFiles(String files_gn) {
		return sqlSession.selectList("files.selectAllFiles", files_gn);
	}

	@Override
	public int deleteFiles(String files_id) {
		return sqlSession.delete("files.deleteFiles", files_id);
	}

	@Override
	public FilesVO selectFiles(String files_id) {
		return sqlSession.selectOne("files.selectFiles", files_id);
	}

}
