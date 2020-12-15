<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<link href="/css/user/mypage/mypage-lesson.css" rel="stylesheet">
<div class="myles-box-area">
	<div class="myles-box">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>과목</th>
					<th>강의명</th>
					<th>강사</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>남은일수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${plList}" var="lesson" varStatus="stat">
<%-- 					수강기간 : ${lesson.lesTerm}<br> --%>
					<!-- 강의시작일 -->
					<fmt:formatDate value="${lesson.payDate}" var="startLes" pattern="yyyy.MM.dd"/>
					<fmt:formatDate value="${lesson.cosTerm}" var="endLes" pattern="yyyy.MM.dd"/>
					<!-- 남은일수 구하기 -->
					<fmt:parseNumber value="${lesson.cosTerm.time / (1000*60*60*24)}" integerOnly="true" var="end" />
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true " var="now2"></fmt:parseNumber>
					<fmt:parseNumber value="${end-now2}" integerOnly="true" var="day"/>
					<tr>
						<td>${stat.count}</td>
						<td>${lesson.subNm}</td>
						<td>${lesson.lesNm}</td>
						<td>${lesson.tchNm}</td>
						<td>${startLes}</td>
						<td>${endLes}</td>
						<td><c:out value="${day}"/> 일</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>