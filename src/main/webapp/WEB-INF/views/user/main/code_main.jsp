<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/css/user/main/code-main.css" rel="stylesheet"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CODE MAKER</title>
</head>
<body>
<div class="main-box">
	<div id="divB" class="div-box">
		 <p class="access-modifier p3">public static</p> <p class="return p1">void</p> <p class="method p2">main</p><p class="param">(String[] args) {</p>
		 	<p class="data-type">&#9;int</p> <p class="variable">rememberMe =</p><p class="value"> 0</p>;
			<p class="function">&#9;if(</p><p class="variable">rememberMe ==</p><p class="value">1</p><p class="function">) {</p>
				<p class="variable">&#9;&#9;userCookie = new Cookie</p><p class="param">("userid", URLEncoder.encode(userVo.getUserId(),"UTF-8"));</p>
				<p class="variable">&#9;&#9;remember = new Cookie</p><p class="param">("remember", Integer.toString(rememberMe));</p>
				<p class="variable">&#9;&#9;userCookie</p><p class="function">.setMaxAge</p><p class="param">(60*60*24*30);</p>
				<p class="variable">&#9;&#9;remember</p><p class="function">.setMaxAge</p><p class="param">(60*60*24*30);</p>
				<p class="variable">&#9;&#9;response</p><p class="function">.addCookie</p><p class="param">(userCookie);</p>
				<p class="variable">&#9;&#9;response</p><p class="function">.addCookie</p><p class="param">(remember);</p>
			<p class="function">&#9;}else {</p>
				<p class="variable">&#9;&#9;userCookie = new Cookie</p><p class="param">("userid", null);</p>
				<p class="variable">&#9;&#9;remember = new Cookie</p><p class="param">("remember", null);</p>
				<p class="variable">&#9;&#9;userCookie</p><p class="function">.setMaxAge</p><p class="param">(0);</p>
				<p class="variable">&#9;&#9;remember</p><p class="function">.setMaxAge</p><p class="param">(0);</p>
				<p class="variable">&#9;&#9;response</p><p class="function">.addCookie</p><p class="param">(userCookie);</p>
				<p class="variable">&#9;&#9;response</p><p class="function">.addCookie</p><p class="param">(remember);</p>
			<p class="function">&#9;}</p>
		<p class="param">}</p>
		<p class="jsp-function">function </p><p class="jsp-function-name">deleteLes(){</p>
			<p class="jsp-var">&#9;var len = </p><p class="jsp-type">$(</p><p class="jsp-text">.lesChk"</p><p class="jsp-text">).length;</p>
			<p class="jsp-var">&#9;var param = </p><p class="jsp-val">[];</p>
			<p class="jsp-function-name">&#9;for</p><p class="jsp-text">(i=0; i&lt; len; i++){</p>
				<p class="jsp-val">&#9;&#9;param.push</p><p class="jsp-text">($("#chk\\["+i+"\\]:checked").attr("data-lesId"));</p>
			<p class="jsp-function-name">&#9;}</p>
			<p class="jsp-function-name">&#9;$.ajax({</p>
				<p class="jsp-text">&#9;&#9;url : "/user/cartDelete",</p>
				<p class="jsp-text">&#9;&#9;data : {"data" : param},</p>
				<p class="jsp-text">&#9;&#9;traditional : true,</p>
				<p class="jsp-text">&#9;&#9;success : function(res){</p>
				<p class="jsp-text">&#9;&#9;&#9;location.href="/user/cartView";</p>
			<p class="jsp-function-name">&#9;&#9;}</p>
			<p class="jsp-function-name">&#9;})</p>
		<p class="jsp-function-name">}</p>
	</div>
	<!-- 이동페이지 -->
	<div class="btn-box">
		<button onclick="location.href='/user/main'">코딩하러가기</button>
	</div>
	<div class="typing"></div>
</div>
<script>
// $(function(){
// 	var txtBool = false;
// 	var txt = $(".div-box").html();	//텍스트 가져오기
// 	var txtIndex = 0;
// 	console.log(txt);
	
// 	//타이핑된 텍스트 가져오기
// 	txt = txt.split("");
// 	if(txtBool == false){
// 		txtBool = true;
// 		var tyInt = setInterval(typing,100);
// 	}
	
// 	function typing(){
// 		if(txtIndex<txt.length){
// 			var tag ="";
// 			if(txt[txtIndex]==="<"){
// 				tag += txt[txtIndex];
// 				$(".typing").append(txt[txtIndex]);
// 				txtIndex++;
// 			}
// 		}else{
// 			clearInterval(tyInt);
// 		}
// 	}
// })
function setupTypewriter(t) {
      var HTML = t.innerHTML;
      t.innerHTML = "";
      var cursorPosition = 0,
          tag = "",
          writingTag = false,
          tagOpen = false,
          typeSpeed = 5,
        tempTypeSpeed = 0;
      var type = function() {
          if (writingTag === true) {
              tag += HTML[cursorPosition];
          }
          if (HTML[cursorPosition] === "<") {
              tempTypeSpeed = 0;
              if (tagOpen) {
                  tagOpen = false;
                  writingTag = true;
              } else {
                  tag = "";
                  tagOpen = true;
                  writingTag = true;
                  tag += HTML[cursorPosition];
              }
          }
          if (!writingTag && tagOpen) {
              tag.innerHTML += HTML[cursorPosition];
          }
          if (!writingTag && !tagOpen) {
              if (HTML[cursorPosition] === " ") {
                  tempTypeSpeed = 0;
              }
              else {
                  tempTypeSpeed = (Math.random() * typeSpeed) + 50;
              }
              t.innerHTML += HTML[cursorPosition];
          }
          if (writingTag === true && HTML[cursorPosition] === ">") {
              tempTypeSpeed = (Math.random() * typeSpeed) + 50;
              writingTag = false;
              if (tagOpen) {
                  var newSpan = document.createElement("span");
                  t.appendChild(newSpan);
                  newSpan.innerHTML = tag;
                  tag = newSpan.firstChild;
              }
          }
          cursorPosition += 1;
          if (cursorPosition < HTML.length - 1) {
              setTimeout(type, tempTypeSpeed);
          }

      };
      return {
          type: type
      };
  }
  var typer = document.getElementById('divB');
  typewriter = setupTypewriter(typer);
  typewriter.type();
</script>
</body>
</html>