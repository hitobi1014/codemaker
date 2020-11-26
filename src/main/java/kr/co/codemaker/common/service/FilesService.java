package kr.co.codemaker.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.common.dao.FilesDaoI;
import kr.co.codemaker.model.FilesVO;

@Service("filesService")
public class FilesService implements FilesServiceI {

	@Resource(name="filesDao")
	private FilesDaoI filesDao;
	
	@Override
	public int insertFiles(FilesVO filesVo) {
		return filesDao.insertFiles(filesVo);
	}

	@Override
	public List<FilesVO> selectAllFiles(String files_gn) {
		return filesDao.selectAllFiles(files_gn);
	}

	@Override
	public int deleteFiles(String files_id) {
		return filesDao.deleteFiles(files_id);
	}

	@Override
	public FilesVO selectFiles(String files_id) {
		return filesDao.selectFiles(files_id);
	}
	
	
}
