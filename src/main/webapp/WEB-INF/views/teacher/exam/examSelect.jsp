<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->


<script>
$(function() {
	
	// 수정하기
	$('#updateBtn').on('click', function(){
		str = '<input type="hidden" name="examState" value="1">';
		
		$('#examf').append(str);
		
		$('#examf').submit();
	});
	
	// 등록하기 - 상태값을 수정하면 끝
	$('#regBtn').on('click', function(){
		str = '<input type="hidden" name="examState" value="2">';
		
		$('#examf').append(str);
		
		$('#examf').attr('action', '/exam/updateExam');
		
		$('#examf').submit();
	});
	
	// 목록으로 가기
	$('#cancle').on('click', function(){
		var searchSubId = '${examVO.searchSubId }';
		var searchLesId = '${examVO.searchLesId }';
		var searchExamState = '${examVO.searchExamState }';
		
		document.location = '/exam/selectAllExam?searchSubId=' + searchSubId + '&searchLesId=' + searchLesId + '&searchExamState=' + searchExamState;
	});

})
</script>
<title>examSelect</title>
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
	border-top-right-radius: 8px;
	height: 10px;
	width: 900px;
	margin-bottom: -15px;
	margin-right: 5px;
}
.d5 {
	display: inline-block;
	margin-left: -6px;
	background-color: white;
	width: 900px;
	border-bottom-right-radius: 8px;
	text-align: left;
	margin-top: 10px;
}
.d6 {
	padding-left: 20px;
	padding-top: 5px;
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
#hh2{
	margin-top: 10px;
}
#sel1{
	margin-top: 10px;
}
.sel2{
	padding-top: 5px;
}
</style>
	<form action="/exam/updateViewExam" id="examf" method="post">
		<input type="hidden" name="searchSubId" value="${examVO.searchSubId}">
		<input type="hidden" name="searchLesId" value="${examVO.searchLesId}">
		<input type="hidden" name="searchExamState" value="${examVO.searchExamState}">
		<input type="hidden" name="examId" value="${examVO.examId}">
		
		<div id="d2">
			<div id="d1"></div>
			<br>
			<div id="d3">
				<h2 id="hh2">시험</h2>
				<br> <label for="sel1" id="sel1"><h4>${ev.examNm }</h4></label><br>
			</div>
			<br>
			<c:forEach items="${questionList }" var="question" varStatus="status">
				<br>
				<div class="d4"></div>
				<br>
				<div class="d5">
					<div class="d6">
						<label for="sel2" class="sel2"><h5>${status.count }. ${question.queCont }</h5></label> <br>
						<c:forEach begin="${status.index*4 }" end="${status.count*4-1 }" items="${answersheetLists }" varStatus="vs" var="answersheet">
							<div class="anw">
								<div class="overlay"
									<c:if test="${vs.count eq question.queAnswer }">
										style="display:block"
									</c:if>></div>
								<input type="text" name="ansCont" class="form-control radi" value="${answersheet.ansCont}" readonly="readonly"> 
								<input type="checkbox" name="queAnswer" value="${vs.count }" class="chk" readonly="readonly" disabled="disabled"
									<c:if test="${vs.count eq question.queAnswer }">
										checked="checked"								
									</c:if> />
							</div>
						</c:forEach>
						<div class="anw">
							<textarea class="form-control comment" rows="5" name="queExplain" readonly="readonly" >${question.queExplain}</textarea>
							<br>
						</div>
					</div>
				</div>
				<br>
			</c:forEach>
		</div>
		<div class="btns">
			<c:if test="${ev.examState != '3'}">
				<input type="button" class="btn btn-default" id="updateBtn" value="수정하기"> 
				<input type="button" class="btn btn-default" id="regBtn" value="등록하기"> 
			</c:if>
			<input type="button" class="btn btn-default" id="cancle" value="목록으로 가기">
		</div>
	</form>
