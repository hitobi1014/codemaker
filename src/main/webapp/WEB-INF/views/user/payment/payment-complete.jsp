<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/css/user/cart/user-pay-complete.css" rel="stylesheet" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>결제 완료</title>
<div class="pay-info-boxArea">
	<c:set var="now" value="<%=new java.util.Date()%>"/> <!-- 오늘날짜구하기 -->
	<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="day"/>
	
	<c:forEach items="${payList}" var="pay">
			<c:set value="${total + pay.paySum}" var="total"/>
	</c:forEach>
	<div class="pay-info-box">
		<h3>결제정보</h3>
		<div class="divinder"></div>
		<c:set value="0" var="total"/>
		<table id="tb-info">
			<thead>
				<tr>
					<th>강의명</th>
					<th>강사명</th>
					<th>강의기간</th>
					<th>강의료</th>
				</tr>
			</thead>
			<c:forEach items="${lessonList}" var="lesson">
				<c:set value="${lesson.lesTerm}" var="lesTerm"/>
				<tbody>
					<tr>
						<td>${lesson.lesNm}</td>
						<td>${lesson.tchNm}</td>
						<fmt:formatDate value="${lesson.lesDate}" var="lesDate" pattern="yyyy.MM.dd"/>
						<td>${day}~ ${lesDate}</td>
						<fmt:formatNumber value="${lesson.lesCash}" var="lesCash"/>
						<td>${lesCash}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<div class="pay-info">
		<div class="divinder"></div>
			<div class="pay-date">
				<span>결제일</span>
				<span>${day}</span>
			</div>
			<div>
				<div>
					<span>정가</span>
					<span>
						30000000
					</span>
				</div>
				<div>
					<span>포인트</span>
					<span>
						<fmt:formatNumber value="${pointVo.pointUpdate}" var="point" maxFractionDigits="3"/>${point}
					</span>
				</div>
				<div>
					<span>결제금액</span>
					<span>
						<fmt:formatNumber value="${total}" var="payCost" maxFractionDigits="3"/><c:out value="${payCost}"/>
					</span>
				</div>				
			</div>
		</div>
	</div>
</div>

