package kr.co.codemaker.user.board.chat.vo;

import kr.co.codemaker.common.vo.BaseVO;

public class ChatRoomVO extends BaseVO{

	private String chatroomId;

	public void setChatroomId(String chatroomId) {
		this.chatroomId = chatroomId; 
	}

	public String getChatroomId() {
		return chatroomId; 
	}

}
