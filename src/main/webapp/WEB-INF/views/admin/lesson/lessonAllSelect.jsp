<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">
<link rel="stylesheet" href="/css/teacher/lesson/button.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- js 추가 -->
<script src="/js/admin/lesson/lesson.js"></script>
<title>lessonAllList</title>

<script>
$(function(){
	// 강의 상세조회 페이지로
	$('#lesidx tr td').on('click', function(){
		if($(this).attr('class') != 'chb'){
			var lesId = $(this).parent('tr').data('lesid');
	// 		console.log(lesId);
			var windowObj = window.open('/admin/lessonSelect?lesId='+lesId,'lessonSelect', 'width=800,height=800,resizable=no,scrollbars=yes,left=1200,top=50');
		}
	});
	
	// 강의 승인 상태 변경
	$('#regBtn').on('click', function() {
		var lesIds = [];

		$('input:checkbox[name=chk]').each(function() {
			if ($(this).is(':checked')) {
				var lesId = $(this).val();
				console.log(lesId);
				lesIds.push(lesId);
			}
		});
		
		if(lesIds.length > 0){
			document.location = "/admin/updateLesson?lesState=3&lesIds=" + lesIds;
		}else{
			alert("승인할 강의를 선택해주세요.");
		}
	});
	
	// 반려
	$('#cancle').on('click', function() {
		var lesIds = [];

		$('input:checkbox[name=chk]').each(function() {
			if ($(this).is(':checked')) {
				var lesId = $(this).val();
				lesIds.push(lesId);
			}
		});
		
		if(lesIds.length > 0){
			document.location = "/admin/updateLesson?lesState=4&lesIds=" + lesIds;
		}else{
			alert("반려할 강의를 선택해주세요.");
		}
	});
	
	
});

</script>
<style>
.a2{
	color: red;
}
.a4{
	color: blue;
}
table{
	table-layout: fixed;
}
#wul {
	width: 1100px;
	margin-left: 200px;
}
#hd {
	margin-left: 15px;
}
#subject {
	width: 100px;
	display: inline-block;
	margin-right: 10px;
	margin-bottom: 10px;
}

#lesson {
	width: 400px;
	display: inline-block;
	margin-right: 10px;
	margin-bottom: 10px;
}
.right {
	float: right;
	text-align: right;
}
#regBtn {
	margin-right: 10px;
	margin-bottom: 10px;
	margin-top: 8px;
}
#selectTab {
	padding-left: 30px;
}
#containerId {
	width: 1300px;
	margin-left: 140px;
}
#delBtn {
	width: 40px;
	height: 35px;
	font-size: 11px;
	float: left;
	margin-left: 85px;
	padding: 0px 0px 0px 0px
}
#upBtn {
	width: 40px;
	height: 35px;
	font-size: 11px;
	float: right;
	padding: 0px 0px 0px 0px
}
#addBtn {
	margin-bottom: 20px;
}
.form-control-label {
	font-size: .875rem;
	font-weight: 600;
	color: #525f7f;
}
#less {
	display: inline-block;
}

#sub {
	display: inline-block;
}
#d2 {
	text-align: right;
}
</style>




</head>

<body>
<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12" style="margin: 50px;">
		
			<div class="card" style="width: 1200px;">
				<div class="card-body text-center"></div>
				<h2 class="card-title m-b-0">📢강의 개설 요청</h2>
				
				<br>
				<table>
					<thead>
						<tr>
							<td>과목명</td>
							<td>승인요청</td>
							<td>승인완료</td>
							<td>반려</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lessonList}" var="lesson">
							<tr>
								<td>${lesson.subNm }</td>
								<td><a class="a2" href="/admin/selectAllLesson?subId=${lesson.subId }&lesState=2">${lesson.agreeCnt }건</a></td>
								<td><a class="a3" href="/admin/selectAllLesson?subId=${lesson.subId }&lesState=3">${lesson.sagreeCnt }건</a></td>
								<td><a class="a4" href="/admin/selectAllLesson?subId=${lesson.subId }&lesState=4">${lesson.dagreeCnt }건</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<br>
				<div class="table-responsive">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">강의No.</th>
								<th scope="col">강의명</th>
								<th scope="col">담당선생님</th>
								<th scope="col">강의승인상태</th>
								<th scope="col">-</th>
							</tr>
						</thead>
						<tbody id="lesidx">
							<c:if test="${lessonLists.size() ne 0}">
							<c:forEach items="${lessonLists}" var="lesson" varStatus="status">
							<tr data-lesid='${lesson.lesId }'>
								<td>${status.count }</td>
								<td>${lesson.lesNm }</td>
								<td>${lesson.tchNm }</td>
								<td>
									<c:choose>
										<c:when test="${lesson.lesState == 2 }">
											승인요청
										</c:when>
										<c:when test="${lesson.lesState == 3 }">
											승인완료
										</c:when>
										<c:when test="${lesson.lesState == 4 }">
											반려
										</c:when>
									</c:choose>
								</td>
								<td class="chb">
									<input type="checkbox" value="${lesson.lesId }" class="chb" name="chk">
								</td>
							</tr>
						</c:forEach>
						</c:if>
						</tbody>
					</table>
				</div>

				<br>
				<div class="mb-3" id="d2">
					<input type="button" class="btn btn-sm btn-primary" value="승인" id="regBtn" data-lesid="${lesson.lesId }">
					<input type="button" class="btn btn-sm btn-primary" value="반려" id="cancle" data-lesid="${lesson.lesId }">
				</div>
				
			</div>

		</div>
	</div>
</div>
</body>