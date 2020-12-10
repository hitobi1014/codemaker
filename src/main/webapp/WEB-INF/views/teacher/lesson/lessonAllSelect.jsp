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
</head>
<script>
$(function(){
// 	$('#subject').change(function(){
// // 		console.log('a');
// 		$('#lesson').find('option').each(function(){
// 			$(this).remove();
// 		})
// 		var option = "<option value= 'SELECT'></option>";
// 		$('#lesson').append('option');
// 		var selectVal = $(this).val();
// 		$.ajax({
// 			type:'POST',
// 			url:'/teacherL/selectSubject',
// 			data:{'subId':selectVal},
// 			dataType:'json',
// 			success:function(data){
// // 				alert('data');
// 				console.log(data);
// // 					var list = data.lessonList;
// 				for (var i=0; i<data.length; i++){
// 					$('#lesson').append("<option value='" + data[i].lesId +"'>" + data[i].lesNm + "</option>");
// 				}
// 			},
// 			error:function(data){
// 				alert('안됨');
// 			}
// 		})
// 	})
	
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
		console.log(lesid);
		$.ajax({
				method:'get',
				url:'/teacherL/deleteLesson',
				data:{'lesId':lesid},
				dataType:'html',
				success:function(data){
					console.log(data);
					$('#lesTbody').load('/teacherL/selectloadSubject');
// 					$('#lesTbody').html(data);
				},
				error:function(data){
					alert('안됨');
				}
			})
	})
	
	// 수정버튼
	$('#lesTbody').on('click','.upClass',function(){
		var lesId=$(this).data("lesid");
		var subId=$(this).data("subid");
		document.location="/teacherL/updateLesson?lesId="+lesId+"&subId="+subId;
	})
	
	
})	

// 과목선택하고 강의조회버튼
var selLes = function(){
	var subVal = $("#subject option:selected").val();
	console.log(subVal);
	$.ajax({
		url:'/teacherL/selectSubject',
		data:{'subId':subVal},
		method:'post',
		dataType:'json',
		success:function(data){
			var html="";
			console.log(data);
			for(var i=0; i<data.length; i++){
				var lessonList =  data[i];
				html += "<tr data-lesid='"+lessonList.lesId+"' data-toggle=modal data-target=#exampleModalCenter>";
				html += "<td>" + '' + "</td>";
				html += "<td>" + lessonList.lesNm+ "</td>";
				html += "<td>" + lessonList.lesCont+ "</td>";
				html += "<td>" + lessonList.lesCash + "</td>";
				html += "<td>" + lessonList.lesTerm + "</td>";
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
						<option value="SUB0001">DB</option>
						<option value="SUB0002">Spring</option>
						<option value="SUB0003">Java</option>
						<option value="SUB0004">Python</option>
						<option value="SUB0005">Jsp</option>
					</select> 
<!-- 					<select class="form-control" id="lesson"> -->
<!-- 						<option value="99">강의</option> -->
<!-- 						<option value="LESSON0001">Why Java?</option> -->
<!-- 						<option value="0">Spring</option> -->
<!-- 						<option value="1">Java</option> -->
<!-- 						<option value="1">Python</option> -->
<!-- 						<option value="1">Jsp</option> -->
<!-- 					</select>  -->
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
								<th>강의 차순</th>
								<th>강의 목차내용</th>
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
										<td ></td>
										<td class="ls">${no.lesId}</td>
										<td>${no.lesNm}</td>
										<c:choose>
											<c:when test="${no.lesState=='1' }">
												<td>
													<div>
														<div style="float: left; width:50%;">임시저장</div>
														 <div style="float: left;width:50%;">
															 <input id="delBtn" class="delClass " type="button" value="삭제" data-lesid="${no.lesId}"> 
															 <input id="upBtn" class="upClass"  type="button" value="수정" data-lesid="${no.lesId}" data-subid="${no.subId}" >
															 <input id="reqBtn" class="reqClass"  type="button" value="요청" >
														 </div>   
													</div>
												</td>
											</c:when>
											<c:when test="${no.lesState=='2' }">
												<td>
													<div>
														<div style="float: left;width:50%;">승인중</div>
														<div style="float: left;width:50%;">
															<input id="delBtn2" class="delClass " type="button" value="삭제" data-lesid="${no.lesId}" >
															<input id="upBtn" class="upClass" type="button" value="수정" data-lesid="${no.lesId}" data-subid="${no.subId}">
															<input id="reqBtn" class="reqClass"  type="button" value="요청" >
														</div> 
													</div>
												</td>
											</c:when>
											<c:when test="${no.lesState=='4' }">
												<td>
													<div>
														<div style="float: left;width:50%;">승인반환 </div>
														<div style="float: left;width:50%;">
															<input id="delBtn3" class="delClass" type="button" value="삭제" data-lesid="${no.lesId}" >
															<input id="upBtn" class="upClass"  type="button" value="수정" data-lesid="${no.lesId}" data-subid="${no.subId}">
															<input id="reqBtn" class="reqClass"  type="button" value="요청" >
														</div>
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
	</div>
</div>
