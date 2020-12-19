<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<script>
$(function() {

	// #e6f4ea, queAnswer, anw
	// 정답 체크시 오버레이
	$(document).on('change', 'input[type=checkbox]',function() {
		console.log('aa');
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
		console.log('aa');
		$('#examf').submit();
	});
	
	
})

</script>
<title>examUpdate</title>
<style>
input{
	margin-top: 5px;
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
	height: 495px;
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
	height: 495px;
	text-align: left;
	margin-top: 10px;
}
.d6 {
	padding-left: 20px;
	padding-top: 5px;
}
#sel1 {
	width: 500px;
	margin-top: 10px;
}
.form-control {
	width: 800px;
}
.anw {
	margin-top: 5px;
}
.btn {
	margin-right: 67px;
    background-color: cadetblue;
    color: black;
}
.btn:hover {
    color: black;
	background-color: #7cb9bb;
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
#hh2{
	margin-top: 10px;
}
.sel2{
	padding-top: 5px;
	font-size: 16px;
    font-weight: bold;
}
</style>
<form:form action="/examUser/selectAllExam" id="examf" method="post" commandName="examVO" name="examVO">
	<form:input type="hidden" path="searchEsFscore" class="form-control" id="searchEsFscore" value="${searchEsFscore }"/>
	
	<div id="d2">
		<div id="d1"></div>
		<br>
		<div id="d3">
			<h2 id="hh2">시험 결과</h2>
			<br> 
			<label for="sel1" id="sel1"><h5>${examScoreVO.examNm }</h5></label>
			<label for="sel1" id="sel1">총 문제 수: ${examResultList.size() } / 맞힌 개수 : ${examResultList[0].answerCount }</label>
		</div>
		<br>
		<c:forEach items="${examResultList }" var="examResult" varStatus="status">
			<br>
			<div class="d5">
				<div class="d4"></div>
				<div class="d6">
					<label for="sel2" class="sel2">${status.count }. ${examResult.queCont }</label><br>
					<label for="sel4" class="sel4">배점 : ${examResult.queScore }</label>
					<br>
					
					<c:forEach begin="${status.index*4 }" end="${status.count*4-1 }" items="${answersheetLists }" varStatus="vs" var="answersheet">
						<div class="anw">
							<label for="sel4" class="sel4"
								<c:if test="${vs.count eq examResult.queAnswer }">
									style="background-color: rgba(230, 244, 234);"
								</c:if>>${vs.count }. ${answersheet.ansCont }</label>
						</div>
					</c:forEach>
					<hr>
					<div class="anw">
						<label for="sel5" class="sel5">입력한 답 : 
							<c:if test="${examResult.erAnswer != '0' }">
								${examResult.erAnswer }
							</c:if>
						</label><br>
						<label for="sel5" class="sel5">정답 : ${examResult.queAnswer } </label><br>
						<label for="sel5" class="sel5">문제해설 </label>
						<textarea class="form-control comment" rows="5" name="queExplain" readonly="readonly">${examResult.queExplain}</textarea>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</form:form>

<div class="btns">
	<input type="button" class="btn btn-default" id="cancle" value="목록으로 가기">
</div>

