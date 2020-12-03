<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="/js/teacher/exam/exam.js"></script>

</script>
<title>examAllSelect</title>

<style>
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
#right {
	text-align: right;
}

#regBtn {
	margin-right: 10px;
	margin-bottom: 10px;
	margin-top: 8px;
}

#selectTab{
	padding-left: 30px;
	
}
#containerId{
    width: 1300px;
    margin:60px;
}


#delBtn{
     width: 60px;
    height: 40px;
    font-size: 1.0em;
}

#upBtn{
     width: 60px;
    height: 40px;
    font-size: 1.0em;
}



</style>
</head>
<script>
$(function(){
	$('#subject').change(function(){
// 		console.log('a');
		$('#lesson').find('option').each(function(){
			$(this).remove();
		})
		var option = "<option value= 'SELECT'></option>";
		$('#lesson').append('option');
		var selectVal = $(this).val();
		$.ajax({
			type:'POST',
			url:'/teacherL/selectSubject',
			data:{'subId':selectVal},
			dataType:'json',
			success:function(data){
// 				alert('data');
				console.log(data);
// 					var list = data.lessonList;
				for (var i=0; i<data.length; i++){
					$('#lesson').append("<option value='" + data[i].lesId +"'>" + data[i].lesNm + "</option>");
				}
			},
			error:function(data){
				alert('안됨');
			}
		})
	})
	
// 	$('.delClass').on('click',function(){
// 		var str="";
// 		var tdArr = new Array();
// 		var checkBtn = $(this);
		
// 		var tr = checkBtn.parent().parent().parent().parent();
// 		var td = tr.children();
// // 		console.log(td.text());
// 		var lesid=td.eq(1).text();
// 		console.log(lesid);
		
// 		$.ajax({
// 			type:'method',
// 			url:'/teacherL/deleteLesson',
// 			data:{'lesid':lesid},
// 			dataType:'json',
// 			success:function(data){
				
// 			},
// 			error:function(data){}
// 				alert('안됨');
// 		})
		
		
// 	})

// 	deleteLessonHTML();
})	
	
var selLesIdx = function(){
	var lesIdxVal = $("#lesson option:selected").val();
	console.log(lesIdxVal);
	$.ajax({
		url:'/teacherL/selectAllLessonIndex',
		data:{'lesId':lesIdxVal},
		method:'get',
		dataType:'json',
		success:function(data){
			var html="";
			console.log(data);
			for(var i=0; i<data.length; i++){
				var lesIdxList =  data[i];
				html += "<tr>";
				html += "<td>" + '' + "</td>";
				html += "<td>" + lesIdxList.lidxNum + "</td>";
				html += "<td>" + lesIdxList.lidxCont + "</td>";
				html += "<td>" + lesIdxList.lidxNum + "</td>";
				html += "</tr>";
			}
			
			$('.lesIdxTbody').html(html);
		},
		error:function(data){
			alert('안됨');
			console.log(data);
		}
	})
}


var delLes = function(){
	var str="";
	var tdArr = new Array();
	var checkBtn = $('.delClass');

	var tr = checkBtn.parent().parent().parent().parent();
	var td = tr.children();
// 		console.log(td.text());
	var lesid=td.eq(1).text();
	console.log(lesid);
	$.ajax({
			method:'get',
			url:'/teacherL/deleteLesson',
			data:{'lesId':lesid},
			dataType:'html',
			success:function(data){
				$('#lesTbody').load('/teacherL/selectloadSubject');
			
			},
			error:function(data){
				alert('안됨');
			}
		})
	
}



</script>




<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12" style="margin:50px;">
			<div class="card" style="width:1200px;">
				<div class="card-body text-center"></div>
				<h2 class="card-title m-b-0">📢강의 조회 및 개설</h2>
				<div id="addLesId">
					<button class="button button-inline button-small button-success" id="addLesBtn" style="float: right;">강의 등록</button>
				</div>
				<div id="right">
					<select class="form-control" id="subject" name="subId">
						<option value="0">과목</option>
						<option value="SUB0001">DB</option>
						<option value="SUB0002">Spring</option>
						<option value="SUB0003">Java</option>
						<option value="SUB0004">Python</option>
						<option value="SUB0005">Jsp</option>
					</select> <select class="form-control" id="lesson">
						<option value="99">강의</option>
						<option value="LESSON0001">Why Java?</option>
						<option value="0">Spring</option>
						<option value="1">Java</option>
						<option value="1">Python</option>
						<option value="1">Jsp</option>
					</select> <input id="selBtn" type="button" value="조회" onclick="selLesIdx()">
				</div>
				<br>
				<div class="table-responsive">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th><label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span>
								</label></th>
								<th scope="col">강의No.</th>
								<th scope="col">강의목록명</th>
								<th scope="col">동영상</th>
							</tr>
						</thead>
						<tbody class="lesIdxTbody">

						</tbody>
					</table>
				</div>

				<h2 class="card-title m-b-0">📢임시 저장된 강의</h2>
				<div class="table-responsive">
					<table class="table">
							<thead class="thead-light">
								<tr>
									<th style="width:170px;"><label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span>
									</label></th>
									<th scope="col" style="width: 290px;">강의No.</th>
									<th scope="col" style="width: 389px;">강의목록명</th>
									<th scope="col">강의승인상태</th>
								</tr>
							</thead>
							<tbody id="lesTbody">
							<c:forEach items="${noLessonList}" var="no">
								<tr data-lesId="${no.lesId}">
									<td ></td>
									<td class="ls">${no.lesId}</td>
									<td>${no.lesCont}</td>
									<c:choose>
										<c:when test="${no.lesState=='1' }">
											<td>
												<div>
													<div style="float: left; width:70%;">강의개설요청</div>
													 <div style="float: left;width:30%;"><input id="delBtn" class="delClass button button-inline button-small button-danger" type="button" value="삭제" id="delBtn" onclick="delLes()"> <input id="upBtn" class="upClass button button-inline button-small button-primary" type="button" value="수정" id="upBtn"></div>   
												</div>
											</td>
										</c:when>
										<c:when test="${no.lesState=='2' }">
											<td>
												<div>
													<div style="float: left;width:70%;">승인요청중</div>
													<div style="float: left;width:30%;"><input id="delBtn" class="delClass button button-inline button-small button-danger" type="button" value="삭제" id="delBtn" onclick="delLes()"><input id="upBtn" class="button button-inline button-small button-primary" type="button" value="수정" id="upBtn"></div> 
												</div>
											</td>
										</c:when>
										<c:when test="${no.lesState=='4' }">
											<td>
												<div>
													<div style="float: left;width:70%;">승인반환 </div>
													<div style="float: left;width:30%;"><input id="delBtn" class="delClass button button-inline button-small button-danger" type="button" value="삭제" id="delBtn" onclick="delLes()"> <input id="upBtn" class="button button-inline button-small button-primary" type="button" value="수정" id="upBtn"></div>
												</div>
											</td>
										</c:when>
									</c:choose>
								</tr>
		</c:forEach>


							</tbody>
					</table>
				</div>
			</div>
		</div>


		<c:if test="${examList.size() ne 0 }">
			<%-- pages : ${pages} --%>
			<!-- 현재 있는 페이지 번호 출력 -->
			<%-- page : ${page} --%>
			<div class="text-center">
				<ul class="pagination">

				</ul>
			</div>
		</c:if>

	</div>
</div>
