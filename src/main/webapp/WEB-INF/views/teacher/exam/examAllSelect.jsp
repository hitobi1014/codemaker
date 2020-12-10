<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- js 추가 -->
<script src="/js/teacher/exam/exam.js"></script>

<script>
$(function() {
	
	// 처음 요청했을 화면
	selectLesson('');
	
	// 시험 등록 폼 제공
	$('#regBtn').on('click', function(){
		var windowObj = window.open('/exam/insertExamView?curId=cur2','examInsert', 'width=1100,height=900,resizable=no,scrollbars=yes');
	});

	// 강의 조회 - 과목을 변경했을 경우에 조회
	$('#subject').on('change', function(){
		selectLesson($(this).val());
	});
	
	// 시험 조회
	$('#lesson').on('change', function(){
		
	});
	
	// 시험 상세페이지 data-exam_id
	$(document).on('click', '#examList tr td', function(){
		console.log($('#lesson').val());
// 		if ($(this).attr('class') == 'm') {
// 			var examId = $(this).parent('tr').data("examid");
// 			console.log(examId);
// 			document.location = "/exam/selectExam?examId=" + examId;
// 		}
	});
});

var selectLesson = function(subId){
	$.ajax({
		url : '/exam/selectAllLesson',
		method : 'post',
		data : {
			subId : subId
		},
		success : function(res){
			console.log(res);
			
			str = '<select name="lesId" class="form-control" id="lesson">';
			str += '<option value="99">강의</option>';
			$.each(res.lessonList, function(index, data){
				str += '<option value="'+ data.lesId +'">'+ data.lesCont +'</option>';
			})
			str += '</select>';
			
			$('#les').html(str);
		},
		error: function(xhr){
			alert("상태"+xhr.status);
		}
	});
}

</script>
<title>examAllSelect</title>

<style>
table{
	table-layout: fixed;
}
#wul {
	width: calc(100% - 1px);
}
#hd {
	margin-left: 15px;
}
#tthe{
	text-align: center;
}
#search {
	width: 115px;
	display: inline-block;
	margin-right: 10px;
	margin-bottom: 10px;
}

#right {
	text-align: right;
}
#regBtn {
	margin-right: 10px;
	margin-bottom: 10px;
	margin-top: 8px;
}
#subject{
	width: 120px;
    display: inline-block;
}
#lesson{
	display: inline-block;
    width: 400px;
}
#les{
	display: inline-block;
}
</style>
</head>
<body>
	<h2 id="hd">EXAM LIST</h2>
	<form:form name="examVO" commandName="examVO" id="subf">
	<div id="right">
			<form:select path="subId" cssClass="form-control" id="subject">
				<form:option value="99">과목</form:option>
				<form:options items="${subjectList }" itemLabel="subNm" itemValue="subId"/>
			</form:select>
			
			<div id="les"></div>
		
			<input type="button" class="btn btn-default" value="시험 등록" id="regBtn"> 
			<input type="button" class="btn btn-default" value="시험 삭제" id="delBtn">
		
	</div>
	
	<table class="w3-hoverable w3-table w3-striped w3-bordered" id="wul">
		<thead id ="tthe">
			<tr class="w3-light-grey">
				<th style="vertical-align : text-bottom; width: 70px;">순</th>
				<th style="vertical-align : text-bottom; width: 450px;">강의 목차명</th>
				<th style="vertical-align : text-bottom; width: 500px;">시험명</th>
				<th style="vertical-align : text-bottom; width: 220px;">작성일</th>
				<th style="vertical-align : text-bottom; width: 220px;">
					<select class="form-control" id="search">
						<option value="99">등록 상태</option>
						<option value="0">수정중</option>
						<option value="1">등록완료</option>
					</select> 
				</th>
				<th style="vertical-align : text-bottom;">-</th>
			</tr>
		</thead>
		<tbody id="examList">
			<!-- 시험 문제 리스트 -->
			<c:forEach items="${examList}" var="exam" varStatus="status">
				<tr data-examid='${exam.examId }'>
					<!-- 시험 문제를 볼때 -->
					<td class='m'>${status.count }</td>
					<td class='m'>${exam.lidxCont }</td>
					<td class='m'>${exam.examNm }_테스트</td>
					<td class='m'><fmt:formatDate value="${exam.examDate }" pattern="yyyy-MM-dd" /></td>
					<td data-examstate='${exam.examState }' class='m'>
						<c:choose>
							<c:when test="${exam.examState == 'Y' }">
								등록완료
							</c:when>
							<c:otherwise>
								수정중
							</c:otherwise>
						</c:choose>
					
					</td>
					<td><input type="checkbox" value='${exam.examId }' class='echk'>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</form:form>

</body>
</html>