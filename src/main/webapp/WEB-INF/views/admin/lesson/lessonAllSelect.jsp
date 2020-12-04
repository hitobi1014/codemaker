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

<style>
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
#paging{
	text-align: right;
}
#lesState{
	width: 130px;
	margin-left: 1070px;
}
</style>
</head>
<script>
	$(function() {
		
		// 페이지 이동 - 강의 목차
		$(document).on('click', '.pageMove',function(){
			var page = $(this).data("page");
			var lesId = $('#lesson option:selected').val();
			console.log(page);
			selectPage(page, lesId);
		});
		
		// 페이지 이동 - 승인 내역
		$('.pagelMove').on('click', function(){
			var page = $(this).data("page");

			console.log(page);
			selectPageLesson(page);
		});

		// 과목을 선택할 시 해당 강의목록 조회
		$('#subject').on('change', function() {
			// 과목 아이디
			var subId = $(this).val();
			// 		console.log(subId);

			$.ajax({
				url : '/admin/selectLesson',
				method : 'post',
				data : {
					subId : subId
				},
				success : function(res) {
					$('#less').html(res);
				},
				error : function(xhr) {
					alert("상태" + xhr.status);
				}
			});

		});

		// 강의를 선택할 시 해당 강의목차 조회
		$(document).on('change', '#lesson', function() {
			// 강의 아이디
			var lesId = $(this).val();
			// 		console.log(lesId);

			$.ajax({
				url : '/admin/selectLessonIndex',
				method : 'post',
				data : {
					lesId : lesId
				},
				success : function(res) {
					$('#lesidx').html(res.split('fin')[0]);
					$('#d2').html(res.split('fin')[1]);
					$('#paging').html(res.split('fin')[2]);
					
				},
				error : function(xhr) {
					alert("상태" + xhr.status);
				}
			});

		});

		// 강의 승인 또는 반려 regBtn , cancle
		$(document).on('click', '#regBtn', function() {

			// 강의 아이디
			var lesId = $(this).data('lesid');
			// 		console.log(lesId);
			var lesState = '3';

			agree(lesId, lesState);
		});

		$(document).on('click', '#cancle', function() {
			// 강의 아이디
			var lesId = $(this).data('lesid');
			// 		console.log(lesId);
			var lesState = '4';

			agree(lesId, lesState);
		});

	});

	var agree = function(lesId, lesState) {
		$.ajax({
			url : '/admin/updateLesson',
			method : 'post',
			data : {
				lesId : lesId,
				lesState : lesState
			},
			success : function(res) {
				if (res == '3') {
					alert("해당 강의가 승인되었습니다.");
				} else {
					alert("해당 강의가 반려되었습니다.");
				}
				document.location = "/admin/selectAllSubject";
			},
			error : function(xhr) {
				alert("상태" + xhr.status);
			}
		});
	}
</script>

<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12" style="margin: 50px;">

			<div class="card" style="width: 1200px;">
				<div class="card-body text-center"></div>
				<h2 class="card-title m-b-0">📢강의 개설 요청 목록</h2>

				<div class="right">
					<form:form name="subjectVO" commandName="subjectVO" id="sub">
						<form:select path="subId" cssClass="form-control" id="subject">
							<form:option value="99">과목</form:option>
							<form:options items="${subjectList}" itemLabel="subNm" itemValue="subId" />
						</form:select>
					</form:form>
					<div id="less"></div>
				</div>

				<br>
				<div class="table-responsive">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">강의No.</th>
								<th scope="col">강의 목차</th>
								<th scope="col">동영상</th>
							</tr>
						</thead>
						<tbody id="lesidx"></tbody>
					</table>
				</div>

				<br>
				<div class="card-footer py-4" id="paging"></div>
				<div class="mb-3" id="d2"></div>

				<h2 class="card-title m-b-0">📢강의 승인 목록</h2>
				
				<div class="right">
					<select class="form-control" id="lesState">
						<option value="99">승인 상태</option>
						<option value="2">승인 요청</option>
						<option value="3">승인</option>
						<option value="3">반려</option>
					</select>
				</div>
				
				<br>
				<div class="table-responsive">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col" style="width: 290px;">강의No.</th>
								<th scope="col" style="width: 389px;">강의명</th>
								<th scope="col">강의승인상태</th>
							</tr>
						</thead>
						<tbody id="lesTbody">
							<c:forEach items="${lessonList }" var="lesson" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td>${lesson.lesNm}</td>
									<c:choose>
										<c:when test="${lesson.lesState == '1' }">
											<td>
												<div>
													<div style="float: left; width:50%;">강의개설요청</div>
												</div>
											</td>
										</c:when>
										<c:when test="${lesson.lesState == '2' }">
											<td>
												<div>
													<div style="float: left;width:50%;">승인요청중</div>
												</div>
											</td>
										</c:when>
										<c:when test="${lesson.lesState=='3' }">
											<td>
												<div>
													<div style="float: left;width:50%;">승인완료 </div>
												</div>
											</td>
										</c:when>
										<c:when test="${lesson.lesState=='4' }">
											<td>
												<div>
													<div style="float: left;width:50%;">승인반려 </div>
												</div>
											</td>
										</c:when>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="card-footer py-4" id="pagingl">
					<c:if test="${lessonList.size() ne 0 }">
						<ul class="pagination justify-content-end mb-0">
							<!-- 첫페이지가 아닐때 -->
							<c:if test="${lessonVO.page ne lessonVO.startPage }">
								<!-- 첫페이지로 가기 -->
								<li class="page-item active">
									<input type="button" class="page-link pagelMove" value="<<" data-page="${lessonVO.startPage}">
								</li>
								<!-- 이전 페이지로 가기 -->
								<li class="page-item active">
									<input type="button" class="page-link pagelMove" value="<" data-page="${lessonVO.page-1 }">
								</li>
							</c:if>
						
							<c:forEach begin="1" end="${pages }" var="i">
								<!-- 현재 있는 페이지와 구분 -->
								<c:choose>
									<c:when test="${i == lessonVO.page }">
										<!-- 보고 있는 페이지와 현재 선택된 페이지가 같을 때 -->
										<li class="page-item active"><span class="page-link" style="float:none;"><strong>${i }</strong></span></li>
									</c:when>
									<c:otherwise>
										<li class="page-item active">
											<input type="button" class="page-link pagelMove" value="${i}" data-page="${i}">
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						
							<!-- 마지막페이지가 아닐때 -->
							<c:if test="${lessonVO.page ne lessonVO.endPage }">
								<!-- 다음 페이지로 이동 -->
								<li class="page-item active">
									<input type="button" class="page-link pagelMove" value=">" data-page="${lessonVO.page+1 }">
								</li>
								<!-- 마지막 페이지로 이동 -->
								<li class="page-item active">
									<input type="button" class="page-link pagelMove" value=">>" data-page="${lessonVO.endPage }">
								</li>
							</c:if>
							
						</ul>
					</c:if>
				</div>

			</div>

		</div>
	</div>
</div>