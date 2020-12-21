<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">
<link rel="stylesheet" href="/css/teacher/lesson/button.css">

<script src="/js/admin/subject/subject.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.card {
    width: 92%;
    min-height: 700px;
    height: auto;
    margin: 0 auto;
    border: none;
}
#subTable{
/* 	margin-left: 100px; */
    width: 1000px;
}
.row{
	width: 1200px;
	margin-left: 200px;
}
.table .thead-light th{
 	background-color: #0b2d61;
    color:white;
    text-align: center;
}
td{
	text-align: center;
}
.button{
	height: 35px;
	font-size: 12px;
	padding: 0px 10px 10px 10px;
    border-radius: 5px;
}
#buttonTh{
	padding: 0px;
}
#buttonDiv{
	width: 100%;
	height: 100%;
}
#subThzero{
	width: 150px;
    vertical-align: middle;
    padding-left: 100px;
}
#subTdzero{
	width: 150px;
    vertical-align: middle;
    padding-left: 100px;
}
h2{
	font-family: 'LotteMartDream';
}

</style>


<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12" style="margin:50px;">
			<div class="card">
				<h2 class="card-title m-b-0">📢 과목조회</h2>
				<div id="addLesId">
				</div>
				<br>
				<div id="tabId">
				</div>
				<table id="subTable" class="table">
					<thead class="thead-light">
						<tr>
							<th id="subThzero"><label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox" > <span class="checkmark"></span></label></th>
							<th class="subTh"  id="subThFirst">과목ID</th>
							<th class="subTh">과목명</th>
							<th id="buttonTh">
								<div id="buttonDiv">
									<button class="button button-inline button-small button-success form-control-label" id="addBtn" data-toggle="modal" onclick="creSub()">추가</button>
								</div>
							</th>
						</tr>
					</thead>
					<tbody id="subTbody">
						<c:forEach items="${subList}" var="subList">
						<tr>
							<c:choose>
								<c:when test="${subList.subOut == 'N' }">
									<td id="subTdzero"><label class="customcheckbox m-b-20"> <input type="checkbox" name="checkRow"  value="${subList.subId}"> <span class="checkmark"></span></label></td>
									<td id="tdFirst" data-subid="${subList.subId}">${subList.subId}</td>
									<td>${subList.subNm}</td>
									<td><button class="button button-inline button-small button-inverse form-control-label" id="upBtn" data-toggle="modal"  data-subnm="${subList.subNm}" data-subid="${subList.subId}">수정</button></td>	
								</c:when>
								
							</c:choose>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div>
				<button class="button button-inline button-small button-danger form-control-label" id="delBtn" >선택삭제</button>
				</div>
				
			</div>
		</div>
	</div>
</div>




<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 id="modal-title" class="modal-title"></h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="subId">
				<table class="table">
					<tr>
						<td>과목명</td>
						<td><input class="form-control" id="subNm" type="text" ></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button id="modalSubmit" type="button" class="btn btn-success">Submit</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- /Modal -->

