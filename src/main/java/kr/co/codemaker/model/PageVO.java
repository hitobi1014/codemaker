package kr.co.codemaker.model;

/**
 * 페이징 처리를 위한 VO
* PageVO.java
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
public class PageVO {

	private int page; 		// 현재 보여주는 페이지 번호
	private int pageSize; 	// 한번에 보여줄 페이지 수
	private int startPage; 	// 시작 페이지
	private int endPage; 	// 마지막 페이지

	public PageVO() {

	}
	public PageVO(int page, int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	@Override
	public String toString() {
		return "PageVO [page=" + page + ", pageSize=" + pageSize + ", startPage=" + startPage + ", endPage=" + endPage
				+ "]";
	}
	

}
