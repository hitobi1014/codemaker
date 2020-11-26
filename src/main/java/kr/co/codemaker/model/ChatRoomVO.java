package kr.co.codemaker.model;

/**
 * 채팅방VO
* ChatRoomVO.java
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
public class ChatRoomVO {
	
	private String charroom_id;	// 채팅방 아이디

	public String getCharroom_id() {
		return charroom_id;
	}
	public void setCharroom_id(String charroom_id) {
		this.charroom_id = charroom_id;
	}

	@Override
	public String toString() {
		return "ChatRoomVO [charroom_id=" + charroom_id + "]";
	}
	
}
