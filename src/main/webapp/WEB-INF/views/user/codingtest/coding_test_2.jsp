<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/codemirror/codemirror.js"></script>
<script type="text/javascript" src="/js/codemirror/javascript.js"></script>
<script type="text/javascript" src="/js/codemirror/codetest.js"></script>
<link href="/css/user/coding/coding-test.css" rel="stylesheet">
<link href="/css/user/coding/codemirror.css" rel="stylesheet">
<link href="/css/user/coding/eclipse.css" rel="stylesheet">
<div class="shadow coding-container">
	<!-- content 1번째 섹션 -->
	<div class="lang-select coding-item1">
		<div>
			<span style="color:#ffffffb8;">짝수와 홀수</span>
			<button class="list-btn" onclick="location.href='/user/coding/solution'">목록으로</button>
		</div>
	</div>
	
	<!-- content 2번째 섹션 -->
	<div class="coding-item2">
		<!-- 2번째 섹션 first -->
		<div class="coding-item2-section1">
			<div class="solution-box">
				<h6>문제 설명</h6>
				<div>
					<p>정수 num이 짝수일 경우 <q>Even</q>을 반환하고 홀수인 경우 <q>Odd</q>를 반환하는 함수, solution을 완성해주세요.</p>
					<h5>제한 조건</h5>
					<ul>
						<li>num은 int 범위의 정수입니다.</li>
						<li>0은 짝수입니다.</li>
					</ul>
					<h5>입출력 예</h5>
					<table class="ct2-tb">
						<thead>
							<tr>
								<th>num</th>
								<th style="text-align: center">return</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>3</td>
								<td style="text-align: center"><q>Odd</q></td>
							</tr>
							<tr>
								<td>4</td>
								<td style="text-align: center"><q>Even</q></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 2번째 섹션 second -->
		<div class="coding-item2-section2">
			<div class="main-box">
				<div class="coding-box">
					<textarea class="codemirror-textarea" spellcheck="false" id="code" rows="30" cols="1000"></textarea>
				</div>
				<div class="result-box-area">
					<div id="result-cl">
						<div class="h3-div"><h3>실행결과</h3></div>
						<div class="result-item">
							<div id="result">실행결과가 여기에 표시됩니다</div>
						</div>
					</div>
					<div id="run-box">
						<button id="run">코드실행</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 <script>
 $(document).ready(function(){
	//codemirror 설정
    var code = $(".codemirror-textarea")[0];
	//에디터 설정
    var editor = CodeMirror.fromTextArea(code,{
		lineNumbers : true,
		lineWrapping : true,
		mode : "javascript",
		theme : 'eclipse',
		val : code.value,
		indentWithTabs : true,
		autofocus : true,
    });
	//에디터 사이즈 설정
    editor.setSize("100%","100%");
	
	//초기 기본데이터 (자바로 설정)
	var random = Math.floor(Math.random()*10000);
	var txt = java2(random);
	editor.setValue(txt);
	var answer ="";
	if(random%2==0){
		answer = "Even";
	}else{
		answer = "Odd";
	}
	
	$("#run").click(function(){
		var to_compile = {
				 "LanguageChoice": "4",
				 "Program": editor.getValue(),
				 "Input": "",
				 "CompilerArgs" : ""
				};
		console.log("값"+editor.getValue());
		console.log("줄 수 "+editor.lineCount());
			$.ajax ({
			     url: "https://rextester.com/rundotnet/api",
			     type: "POST",
			     data: to_compile
			}).done(function(data) {
			 	if(data.Errors!= '' && data.Errors !=null){
				 	$("#result").text(data.Errors);
				 	$("#result").css({"color":"red"});
				 	console.log("에러" + data.Errors);
			 	}else{
			 		var res = "<table><tr><td>입력값 → "+ data.Result +"</td></tr>";
			 			res += "<tr><td>기대값 → " + answer+"</td></tr>";
			 			console.log("데이터넣은값 " + data.Result + "기대값 : "+answer);
			 		if(data.Result == answer){
			 			res += "<tr><td style='color:#91fffa;'>테스트를 통과하셨습니다 (☞ﾟヮﾟ)☞</td></tr>";
			 		}else{
			 			res += "<tr><td style='color:red;'>테스트를 실패하셨습니다 (;´༎ຶД༎ຶ`)</td></tr>";
			 		}
			 		res += "</table>";
				 	$("#result").html(res);
				 	$("#result").css({"color":"white"});
			 	}
			 	var json = JSON.stringify(data);
			 	console.log(JSON.stringify(data));
			 	console.log("성공");
			}).fail(function(data, err) {
			 	console.log("실패");
			     alert("fail " + JSON.stringify(data) + " " + JSON.stringify(err));
			});
	});
    
 });
 </script>