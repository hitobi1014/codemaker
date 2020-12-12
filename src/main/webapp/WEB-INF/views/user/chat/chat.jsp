<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
<style>
html, body {
  background: #efefef;      
  height:100%;  
}
#center-text {          
  display: flex;
  flex: 1;
  flex-direction:column; 
  justify-content: center;
  align-items: center;  
  height:100%;
  
}
#chat-circle {
  position: fixed;
  bottom: 50px;
  right: 50px;
  background: #5A5EB9;
  width: 80px;
  height: 80px;  
  border-radius: 50%;
  color: white;
  padding: 28px;
  cursor: pointer;
  box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}

.btn#my-btn {
     background: white;
    padding-top: 13px;
    padding-bottom: 12px;
    border-radius: 45px;
    padding-right: 40px;
    padding-left: 40px;
    color: #5865C3;
}
#chat-overlay {
    background: rgba(255,255,255,0.1);
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border-radius: 50%;
    display: none;
}


.chat-box {
  display:none;
  background: #efefef;
  position:fixed;
  right:30px;
  bottom:50px;  
  width:350px;
  max-width: 85vw;
  max-height:100vh;
  border-radius:5px;  
/*   box-shadow: 0px 5px 35px 9px #464a92; */
  box-shadow: 0px 5px 35px 9px #ccc;
}
.chat-box-toggle {
  float:right;
  margin-right:15px;
  cursor:pointer;
}
.chat-box-header {
  background: #5A5EB9;
  height:70px;
  border-top-left-radius:5px;
  border-top-right-radius:5px; 
  color:white;
  text-align:center;
  font-size:20px;
  padding-top:17px;
}
.chat-box-body {
  position: relative;  
  height:370px;  
  height:auto;
  border:1px solid #ccc;  
  overflow: hidden;
}
.chat-box-body:after {
  content: "";
  background-image: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTAgOCkiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+PGNpcmNsZSBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIgY3g9IjE3NiIgY3k9IjEyIiByPSI0Ii8+PHBhdGggZD0iTTIwLjUuNWwyMyAxMW0tMjkgODRsLTMuNzkgMTAuMzc3TTI3LjAzNyAxMzEuNGw1Ljg5OCAyLjIwMy0zLjQ2IDUuOTQ3IDYuMDcyIDIuMzkyLTMuOTMzIDUuNzU4bTEyOC43MzMgMzUuMzdsLjY5My05LjMxNiAxMC4yOTIuMDUyLjQxNi05LjIyMiA5LjI3NC4zMzJNLjUgNDguNXM2LjEzMSA2LjQxMyA2Ljg0NyAxNC44MDVjLjcxNSA4LjM5My0yLjUyIDE0LjgwNi0yLjUyIDE0LjgwNk0xMjQuNTU1IDkwcy03LjQ0NCAwLTEzLjY3IDYuMTkyYy02LjIyNyA2LjE5Mi00LjgzOCAxMi4wMTItNC44MzggMTIuMDEybTIuMjQgNjguNjI2cy00LjAyNi05LjAyNS0xOC4xNDUtOS4wMjUtMTguMTQ1IDUuNy0xOC4xNDUgNS43IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIi8+PHBhdGggZD0iTTg1LjcxNiAzNi4xNDZsNS4yNDMtOS41MjFoMTEuMDkzbDUuNDE2IDkuNTIxLTUuNDEgOS4xODVIOTAuOTUzbC01LjIzNy05LjE4NXptNjMuOTA5IDE1LjQ3OWgxMC43NXYxMC43NWgtMTAuNzV6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIvPjxjaXJjbGUgZmlsbD0iIzAwMCIgY3g9IjcxLjUiIGN5PSI3LjUiIHI9IjEuNSIvPjxjaXJjbGUgZmlsbD0iIzAwMCIgY3g9IjE3MC41IiBjeT0iOTUuNSIgcj0iMS41Ii8+PGNpcmNsZSBmaWxsPSIjMDAwIiBjeD0iODEuNSIgY3k9IjEzNC41IiByPSIxLjUiLz48Y2lyY2xlIGZpbGw9IiMwMDAiIGN4PSIxMy41IiBjeT0iMjMuNSIgcj0iMS41Ii8+PHBhdGggZmlsbD0iIzAwMCIgZD0iTTkzIDcxaDN2M2gtM3ptMzMgODRoM3YzaC0zem0tODUgMThoM3YzaC0zeiIvPjxwYXRoIGQ9Ik0zOS4zODQgNTEuMTIybDUuNzU4LTQuNDU0IDYuNDUzIDQuMjA1LTIuMjk0IDcuMzYzaC03Ljc5bC0yLjEyNy03LjExNHpNMTMwLjE5NSA0LjAzbDEzLjgzIDUuMDYyLTEwLjA5IDcuMDQ4LTMuNzQtMTIuMTF6bS04MyA5NWwxNC44MyA1LjQyOS0xMC44MiA3LjU1Ny00LjAxLTEyLjk4N3pNNS4yMTMgMTYxLjQ5NWwxMS4zMjggMjAuODk3TDIuMjY1IDE4MGwyLjk0OC0xOC41MDV6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIvPjxwYXRoIGQ9Ik0xNDkuMDUgMTI3LjQ2OHMtLjUxIDIuMTgzLjk5NSAzLjM2NmMxLjU2IDEuMjI2IDguNjQyLTEuODk1IDMuOTY3LTcuNzg1LTIuMzY3LTIuNDc3LTYuNS0zLjIyNi05LjMzIDAtNS4yMDggNS45MzYgMCAxNy41MSAxMS42MSAxMy43MyAxMi40NTgtNi4yNTcgNS42MzMtMjEuNjU2LTUuMDczLTIyLjY1NC02LjYwMi0uNjA2LTE0LjA0MyAxLjc1Ni0xNi4xNTcgMTAuMjY4LTEuNzE4IDYuOTIgMS41ODQgMTcuMzg3IDEyLjQ1IDIwLjQ3NiAxMC44NjYgMy4wOSAxOS4zMzEtNC4zMSAxOS4zMzEtNC4zMSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEuMjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPjwvZz48L3N2Zz4=');
  opacity: 0.1;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  height:100%;
  position: absolute;
  z-index: -1;   
}
#chat-input {
  background: #f4f7f9;
  width:279px; 
  position:relative;
  height:47px;  
  padding-top:10px;
  padding-right:50px;
  padding-bottom:10px;
  padding-left:15px;
  border:none;
  resize:none;
  outline:none;
  border:1px solid #ccc;
  color:#888;
  border-top:none;
  border-bottom-right-radius:5px;
  border-bottom-left-radius:5px;
  overflow:hidden;  
}
.chat-input > form {
    margin-bottom: 0;
}
#chat-input::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  color: #ccc;
}
#chat-input::-moz-placeholder { /* Firefox 19+ */
  color: #ccc;
}
#chat-input:-ms-input-placeholder { /* IE 10+ */
  color: #ccc;
}
#chat-input:-moz-placeholder { /* Firefox 18- */
  color: #ccc;
}
.chat-submit {  
  position:absolute;
  bottom:15px;
  right:10px;
  background: transparent;
  box-shadow:none;
  border:none;
  border-radius:50%;
  color:#5A5EB9;
  height:35px;  
}
#chatMessageArea {
  padding:15px; 
  height:370px;
  overflow-y:scroll;
}

#chatMessageArea::-webkit-scrollbar-track
{
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
  background-color: #F5F5F5;
}

#chatMessageArea::-webkit-scrollbar
{
  width: 5px;  
  background-color: #F5F5F5;
}

#chatMessageArea::-webkit-scrollbar-thumb
{
  background-color: #5A5EB9;
}



@media only screen and (max-width: 500px) {
   #chatMessageArea {
        height:40vh;
    }
}

.cm-msg-text {
  background:white;
  padding:10px 15px 10px 15px;  
  color:#666;
  max-width:75%;
  float:left;
  margin-left:10px; 
  position:relative;
  margin-bottom:20px;
  border-radius:30px;
}
.chat-msg {
  clear:both;    
}
.chat-msg.self > .cm-msg-text {  
  float:right;
  margin-right:10px;
  background: #5A5EB9;
  color:white;
}
.cm-msg-button>ul>li {
  list-style:none;
  float:left;
  width:50%;
}
.cm-msg-button {
    clear: both;
    margin-bottom: 70px;
}

</style>
<script src="/vendor/user/main/jquery/jquery.min.js"></script>
<script type="text/javascript">
    
    // 웹소켓으로 쓸 변수 선언
    var wsocket;
    
    function generate_message(msg, type) {
	    $("#chatMessageArea").append(str);
	    $("#cm-msg-"+INDEX).hide().fadeIn(300);
	    if(type == 'self'){
	     $("#chat-input").val(''); 
	    }    
	    $("#chatMessageArea").stop().animate({ scrollTop: $("#chatMessageArea")[0].scrollHeight}, 1000);
	    
	} 
    $(function(){
	    $("#chat-circle").on('click',function() {    
			$("#chat-circle").toggle('scale');
			$(".chat-box").toggle('scale');
		})
		  
		$(".chat-box-toggle").on('click',function() {
			$("#chat-circle").toggle('scale');
			$(".chat-box").toggle('scale');
		})
    })
    
    // 입장 버튼 클릭시 작동 함수
    function connect() {
        
        // 웹소켓 생성
        // 생성자에 관해서는 이전 포스팅 참고
        // 여기서는 이 페이지로 대화 내용을 보내는 것이므로 소켓 경로가 이 페이지(여기)이다
        wsocket = new WebSocket(
                "ws://localhost/chat-ws");
        
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
<div>
	
</div>
<div id="body"> 
	<div id="chat-circle" class="btn btn-raised">
		<div id="chat-overlay">
		
		</div>
		<img style="width:85px; height:85px;"alt="talk" src="/images/talk.png"/>
	</div>
	<div class="chat-box">
		<div class="chat-box-header">
			<span id="boxhd">CodeMaker Talk</span>
			<span class="chat-box-toggle">닫기</span>
			<div id="golist" style="display : none;">
				<button type="button" id="tolist" style="float:left">목록으로</button>
			</div>
		</div>
		<div class="chat-box-body">
			<div class="chat-box-overlay">   
			  
			</div>
			<div id="chatMessageArea">
				<c:forEach items="${chatList}" var="chat">
					<button class="chatBtn" type="button" value="${chat.chatroomId}">${chat.chatroomId}</button>     	
				</c:forEach>
			</div>
		</div>
		<div class="chat-input" style="display : none;">    
			<input type="text" id="chat-input" name="chatCont" placeholder="Send a message..."/>
			<button type="button" class="chat-submit btn btn-primary" id="chat-submit">전송</button>
		</div>
	</div>
</div>
</body>
</html>