<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/user/mypage/myclassroom.css">
<!-- SLEEK CSS -->
<!-- <link id="sleek-css" rel="stylesheet" href="/css/admin/main/sleek.css" /> -->


<body>

	<div class="card card-table-border-none" id="recent-orders">
		<div class="card-header justify-content-between">
			<h2>강의 진행도</h2>
			<div class="date-range-report ">
				<span></span>
			</div>
		</div>
		<div class="card-body pt-0 pb-5">
			<table id="mytable"class="table card-table table-responsive table-responsive-large" style="width: 100%">
				<thead>
					<tr>
						<th>강의명</th>
						<th>목차번호</th>
						<th class="d-none d-md-table-cell">과정</th>
						<th class="d-none d-md-table-cell">강의진행도</th>
						<th>진행상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="selectMyLesson">
					<c:forEach items="${selectMyLesson}" var="selectMyLesson">
					<tr>
						<td>${selectMyLesson.lesNm}</td>
						<td>${selectMyLesson.lidxNum}</td>
						<td>${selectMyLesson.lidxCont}</td>
						<td>
							<label for="file"><fmt:formatNumber value="${selectMyLesson.lidxCurtime/selectMyLesson.lidxDurtime}" type="percent"/></label>
							<progress id="progress" max="100" value="${selectMyLesson.lidxCurtime/selectMyLesson.lidxDurtime*100}">
								<fmt:formatNumber value="${selectMyLesson.lidxCurtime/selectMyLesson.lidxDurtime}" type="percent"/>
						</progress>
						</td>
						<td>
							<c:choose>
								<c:when test="${selectMyLesson.lidxCurtime == selectMyLesson.lidxDurtime}">
									<span class="badge badge-success">수강완료</span>
								</c:when>
								<c:when test="${selectMyLesson.lidxCurtime lt selectMyLesson.lidxDurtime}">
									<span class="badge badge-warning">미수강</span>
								</c:when>
							</c:choose>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
</div>


</body> 