package kr.co.codemaker.admin.notice.model;


 
/**
* NoticeVO.java
*
* @author 박경호
* @version 1.0
* @since 2020. 11. 24.
*
* 수정자 수정내용
* ------ ------------------------
* 박경호 최초 생성
*
 */
public class NoticeVO {
	private String notice_id;		// 공지사항 아이디
	private String notice_title;	// 공지사항 제목
	private String notice_cont;		// 공지사항 내용
	private String notice_date;		// 공지사항 작성일			
	private String notice_out;		// 공지사항 삭제여부
	private String notice_head;		// 공지사항 구분자
	private String admin_id;		// 관리자아이디(FK)
	
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_cont() {
		return notice_cont;
	}
	public void setNotice_cont(String notice_cont) {
		this.notice_cont = notice_cont;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_out() {
		return notice_out;
	}
	public void setNotice_out(String notice_out) {
		this.notice_out = notice_out;
	}
	public String getNotice_head() {
		return notice_head;
	}
	public void setNotice_head(String notice_head) {
		this.notice_head = notice_head;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_id=" + notice_id + ", notice_title=" + notice_title + ", notice_cont=" + notice_cont
				+ ", notice_date=" + notice_date + ", notice_out=" + notice_out + ", notice_head=" + notice_head
				+ ", admin_id=" + admin_id + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((admin_id == null) ? 0 : admin_id.hashCode());
		result = prime * result + ((notice_cont == null) ? 0 : notice_cont.hashCode());
		result = prime * result + ((notice_date == null) ? 0 : notice_date.hashCode());
		result = prime * result + ((notice_head == null) ? 0 : notice_head.hashCode());
		result = prime * result + ((notice_id == null) ? 0 : notice_id.hashCode());
		result = prime * result + ((notice_out == null) ? 0 : notice_out.hashCode());
		result = prime * result + ((notice_title == null) ? 0 : notice_title.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NoticeVO other = (NoticeVO) obj;
		if (admin_id == null) {
			if (other.admin_id != null)
				return false;
		} else if (!admin_id.equals(other.admin_id))
			return false;
		if (notice_cont == null) {
			if (other.notice_cont != null)
				return false;
		} else if (!notice_cont.equals(other.notice_cont))
			return false;
		if (notice_date == null) {
			if (other.notice_date != null)
				return false;
		} else if (!notice_date.equals(other.notice_date))
			return false;
		if (notice_head == null) {
			if (other.notice_head != null)
				return false;
		} else if (!notice_head.equals(other.notice_head))
			return false;
		if (notice_id == null) {
			if (other.notice_id != null)
				return false;
		} else if (!notice_id.equals(other.notice_id))
			return false;
		if (notice_out == null) {
			if (other.notice_out != null)
				return false;
		} else if (!notice_out.equals(other.notice_out))
			return false;
		if (notice_title == null) {
			if (other.notice_title != null)
				return false;
		} else if (!notice_title.equals(other.notice_title))
			return false;
		return true;
	}
	public NoticeVO(String notice_id, String notice_title, String notice_cont, String notice_date, String notice_out,
			String notice_head, String admin_id) {
		super();
		this.notice_id = notice_id;
		this.notice_title = notice_title;
		this.notice_cont = notice_cont;
		this.notice_date = notice_date;
		this.notice_out = notice_out;
		this.notice_head = notice_head;
		this.admin_id = admin_id;
	}
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
}
