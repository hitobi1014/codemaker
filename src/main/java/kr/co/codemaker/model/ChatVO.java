package kr.co.codemaker.model;

import java.util.Date;

/**
 * 채팅VO
* ChatVO.java
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
public class ChatVO {
	
	private String chat_id;		// 채팅 아이디 
	private Date chat_time;  	// 채팅 시간
	private String chat_cont;   // 채팅 내용
	private String charroom_id; // 채팅방 아이디
	private String user_id;     // 회원 아이디
	
	public String getChat_id() {
		return chat_id;
	}
	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}
	public Date getChat_time() {
		return chat_time;
	}
	public void setChat_time(Date chat_time) {
		this.chat_time = chat_time;
	}
	public String getChat_cont() {
		return chat_cont;
	}
	public void setChat_cont(String chat_cont) {
		this.chat_cont = chat_cont;
	}
	public String getCharroom_id() {
		return charroom_id;
	}
	public void setCharroom_id(String charroom_id) {
		this.charroom_id = charroom_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "ChatVO [chat_id=" + chat_id + ", chat_time=" + chat_time + ", chat_cont=" + chat_cont + ", charroom_id="
				+ charroom_id + ", user_id=" + user_id + "]";
	}
	
}
