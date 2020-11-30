package kr.co.codemaker.model;

/**
 * 첨부파일VO
* FilesVO.java
*
* @author 김미연
* @version 1.0
* @since 2020. 11. 26.
*
* 수정자 수정내용
* ------ ------------------------
* 김미연 최초 생성
*
 */
public class FilesVO {
	
	private String files_id;    // 첨부파일 아이디
	private String files_nm;    // 첨부파일명
	private String files_path;  // 첨부파일 경로
	private String files_group;	// 첨부파일 구분(첨부파일을 올린 곳의 아이디)
	
	public String getFiles_id() {
		return files_id;
	}
	public void setFiles_id(String files_id) {
		this.files_id = files_id;
	}
	public String getFiles_nm() {
		return files_nm;
	}
	public void setFiles_nm(String files_nm) {
		this.files_nm = files_nm;
	}
	public String getFiles_path() {
		return files_path;
	}
	public void setFiles_path(String files_path) {
		this.files_path = files_path;
	}
	public String getFiles_gn() {
		return files_group;
	}
	public void setFiles_gn(String files_group) {
		this.files_group = files_group;
	}
	
	@Override
	public String toString() {
		return "FilesVO [files_id=" + files_id + ", files_nm=" + files_nm + ", files_path=" + files_path + ", files_group="
				+ files_group + "]";
	}
	
}
