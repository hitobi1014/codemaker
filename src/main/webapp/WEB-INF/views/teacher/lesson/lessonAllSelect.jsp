<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!-- bootstrap 사용 설정 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">
<link rel="stylesheet" href="/css/teacher/lesson/button.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


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
   	margin-left: 140px;
}


.delClass{
    width: 40px;
    height: 27px;
    font-size: 12px;
    float: left;
    margin-left: 30px;
    padding: 0px 0px 0px 0px;
}
.upClass{
	width: 40px;
    height: 27px;
    font-size: 12px;
    float: left;
    padding: 0px 0px 0px 0px;
}
.reqClass{
	width: 40px;
    height: 27px;
    font-size: 12px;
    float: left;
    padding: 0px 0px 0px 0px;
}
#addBtn{
	   margin-bottom: 20px;
}
.form-control-label {
  font-size: .875rem;
  font-weight: 400;
  color: #525f7f;
}


#test{border: 3px solid #1447b9;
    background: #f5f5f5;
    font-weight: 500;
    border-radius: 5px;
    color: #1447b9;
}

.lesIdxTbody:hover{
	cursor: pointer;
	
}


</style>
<script>
$(function(){
	
	// 강의목차 조회
	$('.lesIdxTbody').on("click","tr",function(){
		console.log("뭐떠라");
		var lesVal = $(this).data("lesid");
		console.log(lesVal);
	 	$.ajax({
		url:'/teacherL/selectAllLessonIndex',
		data:{'lesId':lesVal},
		method:'get',
		dataType:'json',
		success:function(data){
			var html="";
			console.log(data);
			for(var i=0; i<data.length; i++){
				var lesIdxList = data[i];
				html +="<tr>";
				html +="<td>" +lesIdxList.lidxNum+ "</td>";
				html +="<td>"+lesIdxList.lidxCont+"</td>";
				html +="</tr>";
			}
			$('.lesTbody').html(html);
		},
		error:function(data){
			alert('안됨');
			console.log(data);
		}
		})
	})
	
	
	// 삭제 버튼
	$('#lesTbody').on('click', '.delClass', function(){
		alert('삭제되었습니다.');
		var lesid = $(this).data("lesid");
		var check = $(this).data("check");
		console.log(lesid);
		$.ajax({
				method:'get',
				url:'/teacherL/deleteLesson',
				data:{'lesId':lesid,
					 'check':check},
				success:function(data){
					console.log(data);
					document.location="/teacherL/selectSubject";
// 					$('#lesTbody').load('/teacherL/selectloadSubject');
				},
				error:function(data){
					alert('data');
					console.log(data);
				}
			})
	})
	
	// 수정버튼
	$('#lesTbody').on('click','.upClass',function(){
		var lesId=$(this).data("lesid");
		var subId=$(this).data("subid");
		document.location="/teacherL/updateLesson?lesId="+lesId+"&subId="+subId;
	})
	
	// 요청버튼
	$('#lesTbody').on('click','.reqClass',function(){
		alert('승인요청합니다.');
		var lesid = $(this).data("lesid");
		var check = $(this).data("check");
		console.log(lesid);
		$.ajax({
				method:'get',
				url:'/teacherL/deleteLesson',
				data:{'lesId':lesid,
					 'check':check},
				dataType:'html',
				success:function(data){
					console.log(data);
					alert('요청되었습니다.')
					document.location="/teacherL/selectSubject";
// 					$('#lesTbody').load('/teacherL/selectloadSubject');
				},
				error:function(data){
					alert('요청을 실패하였습니다');
				}
			})
	})
		
})	

// 과목선택하고 강의조회버튼
var selLes = function(){
	var subVal = $("#subject option:selected").val();
	console.log(subVal);
	$.ajax({
		url:'/teacherL/selectLesson',
		data:{'subId':subVal},
		method:'get',
		dataType:'json',
		success:function(data){
			var html="";
			for(var i=0; i<data.length; i++){
				var lessonList =  data[i];
				html += "<tr data-lesid='"+lessonList.lesId+"' data-toggle=modal data-target=#exampleModalCenter>";
				html += "<td>" + '' + "</td>";
				html += "<td>" + lessonList.lesNm+ "</td>";
				html += "<td>" + lessonList.lesCont+ "</td>";
				var sdate = new Date(lessonList.lesSdate);
				console.log(moment(sdate).format('YYYY-MM-DD'));
				html += "<td>" + moment(sdate).format('YYYY-MM-DD') + "</td>";
				var edate = new Date(lessonList.lesEdate);
				console.log(moment(edate).format('YYYY-MM-DD'));
				html += "<td>" + moment(edate).format('YYYY-MM-DD') + "</td>";
				html += "<td>" + lessonList.lesTerm + "</td>";
				var lescash = lessonList.lesCash;
				html += "<td>" + lescash.toLocaleString()+ "</td>";
				html += "</tr>";
			}
			$('.lesIdxTbody').html(html);
		},
		error:function(data){
			console.log(data);
			alert('안됨');
		}
	})
}

var addLes = function(){
	document.location="/teacherL/insertViewLesson";
}


</script>

<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12" style="margin:50px;">
			<div class="card" style="width:1200px;">
				<div class="card-body text-center"></div>
				<h2 class="card-title m-b-0">📢강의 조회 및 개설</h2>
				<div id="addLesId">
					<button class="button button-inline button-small button-success form-control-label" id="addBtn" style="float: right;" onclick="addLes()">강의 등록</button>
				</div>
				<div id="right">
					<select class="form-control" id="subject" name="subId">
						<option value="0">과목</option>
						<c:forEach items="${subjectList}" var="sub">
							<c:choose>
								<c:when test="${sub.subOut == 'N'}">
									<option value="${sub.subId}">${sub.subNm}</option>
								</c:when>
							</c:choose>
						</c:forEach>
					</select> 
					<input id="selBtn" type="button" value="조회" onclick="selLes()">
				</div>
				<br>
				<div class="table-responsive">
					<table class="table">
				
						<thead class="thead-light">
							<tr>
								<th><label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span></label></th>
								<th scope="col">강의명</th>
								<th scope="col">강의소개</th>
								<th scope="col">강의 개설날짜</th>
								<th scope="col">강의 마감날짜</th>
								<th scope="col">강의기간</th>
								<th scope="col">수강료</th>
							</tr>
						</thead>
						<tbody class="lesIdxTbody">

						</tbody>
					</table>
				</div>
				
			
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalCenterTitle">강의목차 조회</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <table>
							<tr>
								<th>차순</th>
								<th>목차내용</th>
							</tr>
							<tbody class="lesTbody">
							
							</tbody>
						</table>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<h2 class="card-title m-b-0">📢임시 저장된 강의</h2>
				<div class="table-responsive">
					<table class="table">
							<thead class="thead-light">
								<tr>
									<th style="width:170px;"><label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span>
									</label></th>
									<th scope="col" style="width: 290px;">강의No.</th>
									<th scope="col" style="width: 389px;">강의명</th>
									<th scope="col">강의승인상태</th>
								</tr>
							</thead>
							<tbody id="lesTbody">
								<c:forEach items="${noLessonList}" var="no">
									<tr>
										<td></td>
										<td class="ls">${no.lesId}</td>
										<td>${no.lesNm}</td>
										<td>
											<div>
												<c:choose>
													<c:when test="${no.lesState=='1'}">
														<div style="float: left; width: 50%;">임시저장</div>
													</c:when>
													<c:when test="${no.lesState=='2'}">
														<div style="float: left; width: 50%;">승인중</div>
													</c:when>
													<c:when test="${no.lesState=='4'}">
														<div style="float: left; width: 50%;">승인반환</div>
													</c:when>
												</c:choose>
												<input id="delBtn" class="delClass " type="button" value="삭제" data-lesid="${no.lesId}" data-check="1">
												<input id="upBtn" class="upClass" type="button" value="수정" data-lesid="${no.lesId}" data-subid="${no.subId}">
												<input id="reqBtn" class="reqClass" type="button" value="요청" data-lesid="${no.lesId}" data-check="2">
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
