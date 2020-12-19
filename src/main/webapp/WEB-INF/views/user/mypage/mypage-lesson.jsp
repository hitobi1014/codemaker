<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<jsp:useBean id="now" class="java.util.Date"/>
<script src="/js/poshytip/jquery.poshytip.js"></script>
<link href="/css/user/mypage/mypage-lesson.css" rel="stylesheet">
<div class="card shadow myles-box-area">
	<div class="myles-box-big">
		<h3>수강목록</h3>
		<div class="myles-box">
			<table id="lesson-tb">
				<thead>
					<tr>
						<th>과목</th>
						<th>강의명</th>
						<th>강사</th>
						<th>강의일수</th>
						<th>시작일</th>
						<th>종료일</th>
						<th colspan="2">남은일/진행률</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${plList}" var="lesson" varStatus="stat">
						<!-- 수강기간 : ${lesson.lesTerm}<br> --%>
						<!-- 강의시작일 -->
						<fmt:formatDate value="${lesson.payDate}" var="startLes" pattern="yyyy.MM.dd"/>
						<fmt:formatDate value="${lesson.cosTerm}" var="endLes" pattern="yyyy.MM.dd"/>
						<!-- 남은일수 구하기 -->
						<fmt:parseNumber value="${lesson.cosTerm.time / (1000*60*60*24)}" integerOnly="true" var="end" />
						<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true " var="now2"></fmt:parseNumber>
						<fmt:parseNumber value="${end-now2}" integerOnly="true" var="day"/>
						<tr class="lesson-tb-tr" data-lesid="${lesson.lesId}">
							<td style="width: 140px;">
								<div>
									<c:choose>
										<c:when test="${lesson.subNm == 'Java'}"><span class="les-sub" style="background: rgb(33 105 88);">${lesson.subNm}</span></c:when>
										<c:when test="${lesson.subNm == 'DB'}"><span class="les-sub" style="background: orange;">${lesson.subNm}</span></c:when>
										<c:when test="${lesson.subNm == 'Spring'}"><span class="les-sub" style="background: #e43131;">${lesson.subNm}</span></c:when>
										<c:when test="${lesson.subNm == 'Python'}"><span class="les-sub" style="background: #9e43f1;">${lesson.subNm}</span></c:when>
										<c:when test="${lesson.subNm == 'JSP'}"><span class="les-sub" style="background: #f14393;">${lesson.subNm}</span></c:when>
										<c:otherwise><span class="les-sub" style="background: rgb(0,94,135);">${lesson.subNm}</span></c:otherwise>
									</c:choose>
								</div>
							</td>
							<c:url value="/user/selectLessonPage" var="lessonPage">
								<c:param name="lesId" value="${lesson.lesId}"/>
							</c:url>
							<td><a href="${lessonPage}">${lesson.lesNm}</a></td>
							<td>${lesson.tchNm}</td>
							<td>${lesson.lesTerm}일</td>
							<td>${startLes}</td>
							<td>${endLes}</td>
							<td colspan="2">
								<div class="info-remain">
									<span><c:out value="${day}"/>일</span>
									<!-- 남은일수 진행바 -->
									<fmt:parseNumber value="${ ((lesson.lesTerm -day) / (lesson.lesTerm))*100}" integerOnly="true" var="remainDay"></fmt:parseNumber>
									<div class="progress">
										<div class="progress-bar" style="width: ${remainDay}%;">${remainDay}%</div>
									</div>
								</div>
							</td>
							<td>
								<div style="width: 100%;padding: 4px;">
									<button class="exam-btn" data-lesid="${lesson.lesId}">시험</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
$(function(){
	$(".exam-btn").on("click",function(){
		var lesid = $(this).data('lesid');
		console.log(lesid);
		location.href= "/examUser/selectAllExam";
	})
})
</script>