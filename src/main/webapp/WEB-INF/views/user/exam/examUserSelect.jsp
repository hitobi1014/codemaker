<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
$(function() {
	
	// #e6f4ea, que_answer, anw
	// 정답 체크시 오버레이
	$('input[name=erAnswerList]').on('click' ,function() {
		var ol = $(this).prevAll("input[name=ansCont]");
		
		if($(this).is(":checked") == true){
			ol.attr('style','background-color: rgba(230, 244, 234);');
		}else{
			ol.attr('style','background-color: #eee;');
		}
	});
	
	// 채점하기
	$('#checkScore').on('click',function() {
		scoring();
	});
	
	// 취소 버튼
	$('#cancle').on('click', function(){
		// 초기화
		$('#examf')[0].reset();
		opener.parent.location.reload(); // 부모창 리로드
		self.close();
	});
	
	// 시험 시작
	$('#st').on('click', function(){
		$('#start').attr('style', 'display: block;');
		// 시험 타이머
		var time = 10;	// 기준 시간
		var min = "";
		var sec = "";
		
		var timer = setInterval(function(){
			min = parseInt(time/60);
			sec = time%60;
			
			$('#timer').text("타이머 : " + min + "분 " + sec + "초");
			time--;
			
			// 시간초과
			if(time < -1){
				clearInterval(timer);
				$('#timer').text("시간 초과");
				alert("시간초과 되었습니다. 채점합니다.");

				scoring();
			}
		}, 1000);
		
	});
})

var scoring = function(){
	// 빈칸 체크
	var state = 0;
	var jumsu = [];
	
	if(state == 0){
		$('input[name="erAnswerList"]').each(function() {
			if($(this).is(":checked") == false){
				jumsu.push('0');
			}else{
				jumsu.push($(this).val());
			}
		});
		state = 1;
	}
	
	// examf
	if(state == 1){
		var answers = [];			// 정답
		var studentAnswers = [];	// 학생 정답
		var queScores = [];			// 배점
		var erChecks = [];			// 오답 여부
		
		$('input[name="queScore"]').each(function() { 
			queScores.push($(this).val());
		});
		
		$('input[name="queAnswer"]').each(function() { 
			answers.push($(this).val());
		});
		
		for(var ind=0; ind < $('.d5').length; ind++){
			var c = 0;
			for(var i=ind*4; i < (ind+1)*4-1 ; i++){
				if(jumsu[i] != '0'){
					studentAnswers.push(jumsu[i]);
					c = c - 1;
				}
				c = c + 1;
			}
			if(c == 3){
				studentAnswers.push('0');
			}
		}
		
		// 채점
		for(var i=0; i < answers.length; i++){
			if(answers[i] == studentAnswers[i]){
				var jum = parseInt(queScores[i], 0);
				erChecks.push(jum);
			}else{
				erChecks.push(0);
			}
		}
		
		// 총점
		var sum = 0;
		for(var i=0; i < erChecks.length; i++){
			sum += erChecks[i];
		}
		
		// 시험 첫 점수가 없다면 첫점수에 그게 아니라면 다시풀기 점수에...
		if($('#searchEsScore').val() == '0'){
			$('#esFscore').val(sum);
		}else{
			$('#esLscore').val(sum);
		}
		
		str = '<input type="hidden" name="erCheckList" value="' + erChecks + '">';
		str += '<input type="hidden" name="studentAnswers" value="' + studentAnswers + '">';
		
		$('#examf').append(str);
		//$('#examf').submit();
		
		$.ajax({
			url : '/examUser/insertExamResult',
			method : 'post',
			data : 
				$("#examf").serialize()
			,
			success : function(res){
				alert("채점 완료");
				opener.parent.location.reload(); // 부모창 리로드
				// 초기화
				$('#examf')[0].reset();
				self.close();
			},
			error: function(xhr){
				alert("상태"+xhr.status);
			}
		});
	}
}

</script>
<title>examInsert</title>
<style>
#start{
	display: none;
}
body {
	background-color: rgb(240, 235, 248);
}
input{
	margin-top: 5px;
}
#d2 {
	text-align: center;
}
#d1 {
	background: rgb(103, 58, 183);
	display: inline-block;
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
	height: 10px;
	width: calc(80% + 2px);
	margin-top: 30px;
}
#d3 {
	padding-left: 20px;
	display: inline-block;
	margin-top: -4px;
	background-color: white;
	width: calc(80% + 2px);
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
	height: 150px;
	text-align: left;
}
.d4 {
	background-color: #4285f4;
	display: inline-block;
	height: 285px;
	width: calc(1% + 2px);
	border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;
	float: left;
}
.d5 {
	display: inline-block;
	margin-left: -6px;
	background-color: white;
	width: calc(80% + 2px);
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
	border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;
	height: 285px;
	text-align: left;
	margin-top: 10px;
}
.d6 {
	padding-left: 20px;
	padding-top: 5px;
}
.sel1 {
	margin-top : 5px;
}
.form-control {
	width: 800px;
}
.radi {
	display: inline-block;
	margin-right: 5px;
}
.anw {
	margin-top: 5px;
}
.btnd {
	text-align: right;
	margin-top: 10px;
	padding-right: 20px;
}
.btns {
	text-align: right;
	margin-top: 10px;
	padding-right: 20px;
	margin-right: 90px;
}
.comment {
	resize: none;
	text-align: left;
}
.chk {
	margin-left: 4px;
	margin-top: 10px;
}
.rig{
	float: right;
}
.delBtn{
	margin-right: 60px;
    background-color: cadetblue;
}
.queS{
	display: inline-block;
	width: 200px;
}
#sel0{
	font-size: 20px;
}
</style>
</head>
<body>
<button type="button" class="btn btn-secondary" id="st">시험 시작</button>
<div id="start">
	<form:form name="examVO" commandName="examVO" id="examf" action="/examUser/insertExamResult">
		<form:input type="hidden" path="examId" class="form-control" value="${examId }"/>
		<input type="hidden" name="esFscore" class="form-control" id="esFscore" value="${ev.esFscore }"/>
		<input type="hidden" name="esLscore" class="form-control" id="esLscore" value="${ev.esLscore }"/>
		<form:input type="hidden" path="searchEsScore" class="form-control" id="searchEsScore" value="${searchEsScore }"/>
		<div id="d2">
			<div id="d1"></div>
			<div id="d3">
				<h2>시험</h2>
				<br> 
				<label for="sel0" id="sel0">${ev.examNm }</label><br>
				<label id="timer"></label>
			</div>
			<br>

			<c:forEach items="${questionList }" var="question" varStatus="status">
				<br>
				<div class="d5">
					<div class="d4"></div>
					<div class="d6">
						<label for="sel2" class="sel2"><h5>${status.count }. ${question.queCont }</h5></label><br>
						<input type="hidden" name="queIdList" class="form-control" value="${question.queId }"/>
						<input type="hidden" name="queAnswer" class="form-control" value="${question.queAnswer }"/>
						<label for="sel4" class="sel4">배점 : </label>
						<input type="number" name="queScore" class="form-control que queS" value="${question.queScore }" readonly="readonly"/>
						<br>
						
						<c:forEach begin="${status.index*4 }" end="${status.count*4-1 }" items="${answersheetLists }" varStatus="vs" var="answersheet">
							<div class="anw">
								<input type="text" name="ansCont" class="form-control radi" value="${answersheet.ansCont }" readonly="readonly" />
								<input type="checkbox" name="erAnswerList" value="${vs.count }" class="chk"/>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
	</form:form>
	<div class="btns">
		<input type="button" class="btn btn-default" id="regBtn" value="채점하기" data-toggle="modal" data-target="#exampleModalCenter">
		<button type="button" class="btn btn-default" id="cancle">나가기</button>
	</div>
</div>
	
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<strong>해당 시험을 채점하시겠습니까?</strong>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="checkScore">채점하기</button>
        &nbsp;&nbsp;&nbsp;
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close">취소하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>