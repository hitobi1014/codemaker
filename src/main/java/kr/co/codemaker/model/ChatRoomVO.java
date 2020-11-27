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
	
	private String chatroom_id;	// 채팅방 아이디

	public String getChatroom_id() {
		return chatroom_id;
	}
	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}

	@Override
	public String toString() {
		return "ChatRoomVO [chatroom_id=" + chatroom_id + "]";
	}

	
}
