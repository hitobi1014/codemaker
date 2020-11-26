package kr.co.codemaker.model;

/**
 * 장바구니VO
* CartVO.java
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
public class CartVO {
	
	private String cart_id;		// 장바구니 아이디
	private String user_id;     // 회원 아이디
	private String cur_id;      // 커리큘럼 아이디
	
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCur_id() {
		return cur_id;
	}
	public void setCur_id(String cur_id) {
		this.cur_id = cur_id;
	}
	
	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", user_id=" + user_id + ", cur_id=" + cur_id + "]";
	}

}
