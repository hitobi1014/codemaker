package kr.co.codemaker.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.codemaker.common.dao.FilesMapper;
import kr.co.codemaker.common.vo.FilesVO;

@Service("filesService")
public class FilesService  {

	@Resource(name="filesMapper")
	private FilesMapper filesMapper;
	
	
	public int insertFiles(FilesVO filesVo) {
		return filesMapper.insertFiles(filesVo);
	}

	
	public List<FilesVO> selectAllFiles(String files_gn) {
		return filesMapper.selectAllFiles(files_gn);
	}

	
	public int deleteFiles(String files_id) {
		return filesMapper.deleteFiles(files_id);
	}

	
	public FilesVO selectFiles(String files_id) {
		return filesMapper.selectFiles(files_id);
	}
	
	
}
