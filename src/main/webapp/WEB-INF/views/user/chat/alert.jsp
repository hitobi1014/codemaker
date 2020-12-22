<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>

<script src="/vendor/user/main/jquery/jquery.min.js"></script>

<script type="text/javascript">
    
    // 웹소켓으로 쓸 변수 선언
    var wsocket;

    
    // 입장 버튼 클릭시 작동 함수
    function connect() {
        
        // 웹소켓 생성
        // 생성자에 관해서는 이전 포스팅 참고
        // 여기서는 이 페이지로 대화 내용을 보내는 것이므로 소켓 경로가 이 페이지(여기)이다
        wsocket = new WebSocket(
                "ws://localhost/web-notify");
        
        // 이렇듯 소켓을 생성하는 단계에서
        // .onopen, onmessage, onclose에 해당하는 함수를 정의
        wsocket.onopen = onOpen;
        wsocket.onmessage = onMessage;
        wsocket.onclose = onClose;
    }
    
    // 나가기 버튼 클릭시 작동 함수
    function disconnect() {
        wsocket.close();
    }
    
    /*
    위 connect()에서 wsocket.onopen을 이 함수로 이미 정의해뒀다는 것을 숙지.
    아래의 onMessage(), onClose()도 마찬가지로 connect()에서 정의해놨기 때문에
    작동되는 것이다.
    
    즉, wsocket.onopen = onOpen; => WebSocket 생성시 발동
        wsocket.onmessage = onMessage;  => 메시지 받으면 발동
        wsocket.onclose = onClose;  => WebSocket.close()시 발동
    
    ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  
    작동 시점은 "WebSocket 인터페이스의 연결 상태"가 변화했을 때이고
    리스너가 항상 기다리고 있다는 것을 숙지하자!!
    ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  ※  
    */
    
    function onOpen(evt) {
//         appendMessage("연결되었습니다.");
    }
    
    function onMessage(evt) {
        var data = evt.data;
        if (data.substring(0, 4) == "msg:") {
            appendMessage(data.substring(4));
        }
    }
    
    function onClose(evt) {
//         appendMessage("연결을 끊었습니다.");
    }
    
    function send() {
        var msg = $("#chat-input").val();
        if(msg != '' && msg != null){
       	 wsocket.send("msg:${MEMBER_INFO.userNm} : " + msg);
        }
    }
    
    var INDEX = 0;
    function appendMessage(msg, type) {
    	
    	if(msg.indexOf("${MEMBER_INFO.userNm}") != -1){
    		type="self";
    	}else{
    		type="user";
    	}
    	INDEX++;
        var str = "";
	    str += "<div id='cm-msg-"+INDEX+"' class='chat-msg "+type+"'>";
	    str += "    <div class='cm-msg-text'>";
	    str += msg;
	    str += "    </div>";
	    str += "</div>";
        
        $("#chatMessageArea").append(str);
        var chatAreaHeight = $("#chatArea").height();
        var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
        $("#chatArea").scrollTop(maxScroll);
    }

    $(function(){
        
		$('#message').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
            
			if(keycode == '13'){
				send(); 
			}
			event.stopPropagation();
        });
		
        $('#chat-submit').click(function() { 
        	send(); 
        });
        
        $('#exitBtn').click(function() { 
        	disconnect(); 
        });
    
	    $(document).on('click', ".chatBtn", function(){
			var chatroom = $(this).val();
			var chatVo = {
				chatroomId : chatroom
			}
			$.ajax({
				url : "/chat/realchat",
				type : "post",
				data : chatVo,
				dataType : 'json',
				success : function(res){
					
					connect();
					$("#boxhd").html(chatroom);
					$("#chat-box").css("display","block");
					$("#chatMessageArea").empty();
					$(".chat-input").css("display", "block");
					$("#golist").css("display", "block");
					
					values = res.chattingList; 
	                $.each(values, function(index, value) {
	                	var str = "";
	                	if("${MEMBER_INFO.userNm}" == value.userNm){
		            	    str += "<div id='cm-msg' class='chat-msg self'>";
		            	    str += "    <div class='cm-msg-text'>";
		            	    str += value.userNm + " : " + value.chatCont;
		            	    str += "    </div>";
		            	    str += "</div>";
		            	    $("#chatMessageArea").append(str);
	            	    
		                }else{
		                	str += "<div id='cm-msg' class='chat-msg user'>";
		            	    str += "    <div class='cm-msg-text'>";
		            	    str += value.userNm + " : " + value.chatCont;
		            	    str += "    </div>";
		            	    str += "</div>";
		            	    $("#chatMessageArea").append(str);
		                }
	                });
	                
	                	
				},
				error : function(){
					alert("실패");
				}
			
			})
	    })
	    
	    $("#chat-submit").on('click', function(){
	    	var chat = $("#chat-input").val();
	    	var chatroom = $("#boxhd").text();
	    	var users = "${MEMBER_INFO.userId}";
	    	
	    	var chatVo = {
	    		chatCont : chat,
	    		chatroomId : chatroom,
	    		userId : users
	    	}
	    	
	    	$.ajax({
	    		url : "/chat/insertChat",
	    		type : "post",
	    		data : chatVo,
	    		success : function(){
					$("#chat-input").val("");
	    		}
	    	})
	    })
	    
	    $("#tolist").on("click", function(){
	    	$.ajax({
	    		url : "/chat/realchat",
				type : "get",
				success : function(res){
					disconnect();
					str = "";
					str += '<c:forEach items="${chatList}" var="chat">';
					str +=	'<button class="chatBtn" type="button" value="${chat.chatroomId}">${chat.chatroomId}</button>'     	
					str += '</c:forEach>'
					$("#boxhd").html("CodeMaker Talk");
					$("#golist").css("display", "none");
					$(".chat-input").css("display", "none");
					$("#chatMessageArea").empty();
					$("#chatMessageArea").append(str);
					
					
				}
	    	})
	    })
	    
	  
	})
	
    window.onpageshow = function() {
    	disconnect();
    };
</script>
<style>
#chatArea {
    width: 200px; height: 100px; overflow-y: auto; border: 1px solid black;
}
</style>
</head>
<body>

</body>
</html>