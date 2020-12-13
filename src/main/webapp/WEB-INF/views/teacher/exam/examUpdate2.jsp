<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<script src="/js/teacher/exam/exam.js"></script>
<script>
$(function() {

	// #e6f4ea, queAnswer, anw
	// 정답 체크시 오버레이
	$(document).on('click', 'input[class=chk]',function() {
		var ol = $(this).prevAll("div[class=overlay]");
		
		if($(this).is(":checked") == true){
			//console.log('ddfd');
			ol.attr('style','display: block');
		}else{
			//console.log('dadfad');
			ol.attr('style','display: none');
		}
	});
	
	// 문제 추가
	$('#plusBtn').on('click', function() {
		//createExam();
		
		str = '<div class="d5">';
		str += '<div class="d4">';
		str += '<input type="button" class="btn btn-default delBtn" value="문제삭제">';
		str += '<input type="text" name="examNm" id="examNm" class="form-control read" value="adsfadsf" readonly="readonly">';
		str += '</div>';
		str += '</div>';

		$('#examf').append(str);
	});
	
	// 문제 삭제
	$(document).on('click', '.delBtn', function(){
		// 해당 문제 삭제
		var parents = $(this).parents('div');
		// 최상위 부모 삭제
		parents[parents.length-1].remove();
		
	});
	
	// 기존 문제 삭제
	$('.delIdBtn').on('click', function(){
		// 문제 삭제시에 hidden 태그를 생성해준다. data-queid
		str = '<input type="hidden" name="delqueIdList" value="'+ $(this).data('queid') +'">';
		$('#subf').append(str);
		
		// 해당 문제 삭제
		var parents = $(this).parents('div');

		// 최상위 부모 삭제
		parents[parents.length-1].remove();
	});
	
	// 목록으로 가기
	$('#cancle').on('click', function(){
		$('#subf').attr('action', '/exam/selectAllExam');
		$('#subf').submit();
	});
	
	// 수정 화면 요청
	$('#updateBtn').on('click', function(){
		$('#hh2').text('시험 수정');
		
		// readonly 제거
		$('.read').removeAttr("readonly");

		// class uhide 보이지 않게
		$('.uhide').attr('style','display: none');

		// class hide 보이게
		$('.hide').attr('style','display: inline-block')
	});
	
	// 임시저장
	$('#temps').on('click', function(){
		str = '<input type="hidden" name="examState" value="1">';
		$('#examf').append(str);
		$('#examf').submit();
	});
	
	// 등록하기 - 상태값을 수정하면 끝
	$('#regBtn').on('click', function(){
		str = '<input type="hidden" name="examState" value="2">';
		
		$('#examf').append(str);
		$('#examf').submit();
	});

})

</script>
<title>examUpdate</title>
<style>
.hide{
	display: none;
}
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
	height: 670px;
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
	height: 670px;
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
<form action="/exam/updateExam" id="examf" method="post">
	<input type="hidden" name="searchSubId" value="${examVO.searchSubId}">
	<input type="hidden" name="searchLesId" value="${examVO.searchLesId}">
	<input type="hidden" name="searchExamState" value="${examVO.searchExamState}">
	<input type="hidden" name="examId" value="${examVO.examId}">
	
	<div id="d2">
		<div id="d1"></div>
		<br>
		<div id="d3">
			<h2 id="hh2">시험</h2>
			<br> 
			<label for="sel1" id="sel1">
<%-- 				<input type="text" name="examNm" id="examNm" class="form-control" value="${ev.examNm }" readonly="readonly"> --%>
			</label>
				<input type="text" name="examNm" id="examNm" class="form-control read" value="adsfadsf" readonly="readonly"><br><br>
				<input type="text" name="examNm"  class="form-control read uhide" value="수정하면 사라져" readonly="readonly" >
				<input type="text" name="examNm" id="examNm" class="form-control hide" value="수정하면 생겨"><br><br>
			<br> 
		</div>
		<br>
		<c:forEach items="${questionList }" var="question" varStatus="status">
			<br><br>
			<div class="d5">
				<div class="d4"></div>
				<div class="d6">
					<label for="sel2" class="sel2 hide">문제를 입력해주세요.</label><br>
					<input type="hidden" name="questionList[${status.index }].queId" class="form-control" value="${question.queId }"/>
					<span class="uhide">${status.count }. </span>
					<input type="text" name="questionList[${status.index }].queCont" class="form-control que read" value="${question.queCont }"  readonly="readonly"/> 
					<br>
					<input type="text" name="questionList[${status.index }].queScore" class="form-control que read" value="${question.queScore }" readonly="readonly"/><br>
					<label for="sel3" class="hide">보기를 입력해주세요. </label>
					<c:forEach begin="${status.index*4 }" end="${status.count*4-1 }" items="${answersheetLists }" varStatus="vs" var="answersheet">
						<div class="anw">
							<div class="overlay"
								<c:if test="${vs.count eq question.queAnswer }">
									style="display:block"
								</c:if>></div>
							<input type="hidden" name="answersheetLists[${vs.index }].ansId" class="form-control" value="${answersheet.ansId }"/>
							<input type="text" name="answersheetLists[${vs.index }].ansCont" class="form-control radi read" value="${answersheet.ansCont }" readonly="readonly" />
							<!-- 보기와 정답이 같다면 체크 -->
							<input type="checkbox" name="questionList[${status.index }].queAnswer" value="${vs.count }" class="chk read" readonly="readonly"
								<c:if test="${vs.count eq question.queAnswer }">
									checked="checked"								
								</c:if> />
						</div>
					</c:forEach>
					<div class="anw">
						<textarea class="form-control comment read" rows="5" name="questionList[${status.index }].queExplain" readonly="readonly">${question.queExplain}</textarea>
						<br>
					</div>
					<div class="anw">
						<input type="button" class="btn btn-default delIdBtn" value="문제삭제" data-queid="${question.queId }">
						<br>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</form>
<div class="btns">
	<input type="button" class="btn btn-default hide" id="plusBtn" value="문제추가">
	<input type="button" class="btn btn-default hide" id="temps" value="임시저장">
	<c:if test="${ev.examState != '3'}">
		<input type="button" class="btn btn-default uhide" id="updateBtn" value="수정하기"> 
		<input type="button" class="btn btn-default" id="regBtn" value="등록하기"> 
	</c:if>
	<input type="button" class="btn btn-default" id="cancle" value="목록으로 가기">
</div>
