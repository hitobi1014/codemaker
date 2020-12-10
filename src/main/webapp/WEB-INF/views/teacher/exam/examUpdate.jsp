<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<!-- js 추가 -->
<script src="/js/teacher/exam/exam.js"></script>

<script>
$(function() {

	// #e6f4ea, que_answer, anw
	// 정답 체크시 오버레이
	$(document).on('click', 'input[name=que_answer]',function() {
		var ol = $(this).prevAll("div[class=overlay]");
		
		if($(this).is(":checked") == true){
			//console.log('ddfd');
			ol.attr('style','display: block');
		}else{
			//console.log('dadfad');
			ol.attr('style','display: none');
		}

	});
	
	// 목록으로 가기
	$('#cancle').on('click', function(){
		var searchSubId = '${examVO.searchSubId }';
		var searchLesId = '${examVO.searchLesId }';
		var searchExamState = '${examVO.searchExamState }';
		
		document.location = '/exam/selectAllExam?searchSubId=' + searchSubId + '&searchLesId=' + searchLesId + '&searchExamState=' + searchExamState;
	});
	
	// 수정하기
	$('#temps').on('click', function(){
		str = '<input type="hidden" name="examState" value="N">';
		str += '<input type="hidden" name="searchSubId" value="${examVO.searchSubId}">';
		str += '<input type="hidden" name="searchLesId" value="${examVO.searchLesId}">';
		str += '<input type="hidden" name="searchExamState" value="${examVO.searchExamState}">';
		str += '<input type="hidden" name="examId" value="${examVO.examId}">';
		
		$('#examf').append(str);
		
		$('#examf').submit();
	});
	
	// 등록하기 - 상태값을 수정하면 끝
	$('#regBtn').on('click', function(){
		str = '<input type="hidden" name="examState" value="Y">';
		str += '<input type="hidden" name="searchSubId" value="${examVO.searchSubId}">';
		str += '<input type="hidden" name="searchLesId" value="${examVO.searchLesId}">';
		str += '<input type="hidden" name="searchExamState" value="${examVO.searchExamState}">';
		str += '<input type="hidden" name="examId" value="${examVO.examId}">';
		
		$('#examf').append(str);
		$('#examf').submit();
	});

})
</script>
<title>examUpdate</title>
<style>
#examf {
	color: black;
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
	width: 900px;
}
#d3 {
	padding-left: 20px;
	display: inline-block;
	margin-top: -4px;
	background-color: white;
	width: 900px;
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
	height: 150px;
	text-align: left;
}

.d4 {
	background-color: #4285f4;
	display: inline-block;
	height: 520px;
	width: calc(1% + 2px);
	border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;
	float: left;
}

.d5 {
	display: inline-block;
	margin-left: -6px;
	background-color: white;
	width: 900px;
	border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
	height: 520px;
	text-align: left;
	margin-top: 10px;
}
.d6 {
	padding-left: 20px;
	padding-top: 5px;
}
#sel1 {
	width: 500px;
}
.form-control {
	width: 800px;
}
.radi {
	display: inline-block;
	margin-right: 5px;
}
.anw {
	margin-top: 10px;
}
.btnd {
	text-align: right;
	margin-top: 10px;
	padding-right: 20px;
}
.btn {
	background-color: white;
}
.btn:hover {
	background-color: lightsteelblue;
	font-weight: bold;
}
.btns {
	text-align: right;
	margin-top: 10px;
	padding-right: 20px;
	margin-right: 298px;
}
.comment {
	resize: none;
	text-align: left;
}
.overlay {
	z-index: 1;
	position: absolute;
	display: none;
	background-color: rgba(230, 244, 234, 0.5);
	width: 840px;
	height: 40px;
}
.chk {
	z-index: 2;
	margin-left: 4px;
	margin-top: 10px;
	position: relative;
}
#sel1{
	margin-top: 10px;
}
#hh2{
	margin-top: 10px;
}
.sel2{
	padding-top: 5px;
}
</style>
</head>
<body>
	<form action="/exam/updateExam" id="examf" method="post">
		<div id="d2">
			<div id="d1"></div>
			<br>
			<div id="d3">
				<h2 id="hh2">시험 수정</h2>
				<br> 
				<label for="sel1" id="sel1" >
					<input type="text" name="examNm" id="examNm" class="form-control" value="${ev.examNm }_테스트">
				</label><br> 
			</div>
			<br>
			<c:forEach items="${questionList }" var="question" varStatus="status">
				<br>
				<br>
				<div class="d5">
					<div class="d4"></div>
					<div class="d6">
						<label for="sel2" class="sel2">문제를 입력해주세요.</label><br>
						<input type="hidden" name="queId" class="form-control" value="${question.queId }"/>
						<input type="text" name="que_cont" class="form-control que" value="${question.queCont }" /> 
						<br> 
						<label for="sel3">보기를 입력해주세요. </label>
						<c:forEach begin="${status.index*4 }" end="${status.count*4-1 }" items="${answersheetLists }" varStatus="vs" var="answersheet">
							<div class="anw">
								<div class="overlay"
									<c:if test="${vs.count eq question.queAnswer }">
										style="display:block"
									</c:if>></div>
								<input type="text" name="ans_cont" class="form-control radi" value="${answersheet.ansCont }">
								<!-- 보기와 정답이 같다면 체크 -->
								<input type="checkbox" name="que_answer" value="${vs.count }" class="chk"
									<c:if test="${vs.count eq question.queAnswer }">
										checked="checked"								
									</c:if> />
							</div>
						</c:forEach>
						<div class="anw">
							<textarea class="form-control comment" rows="5" name="que_explain">${question.queExplain}</textarea>
							<br>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="btns">
			<input type="button" class="btn btn-default" id="temps" value="임시저장">
			<input type="button" class="btn btn-default" id="regBtn" value="등록하기">
			<input type="button" class="btn btn-default" id="cancle" value="나가기">
		</div>
	</form>
</body>
</html>