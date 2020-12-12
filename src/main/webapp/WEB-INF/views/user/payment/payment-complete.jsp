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
	<c:set value="0" var="total"/>
	<c:forEach items="${payList}" var="pay">
			<c:set value="${total + pay.paySum}" var="total"/>
	</c:forEach>
	
	<div class="pay-info-box">
		<h3>결제정보</h3>
		<div class="divinder"></div>
		<!-- 결제한 강의들 -->
		<table id="tb-info">
			<thead>
				<tr>
					<th>강의명</th>
					<th>강사명</th>
					<th>강의기간</th>
					<th>강의료</th>
				</tr>
			</thead>
			<c:set value="0"  var="lesPrice"/>
			<c:forEach items="${lessonList}" var="lesson">
				<c:set value="${lesson.lesTerm}" var="lesTerm"/>
				<c:set value="${lesPrice+lesson.lesCash}" var="lesPrice"/>
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
		<!-- 결제정보들 -->
		<div class="pay-info">
			<div class="divinder"></div>
			<div class="pay-date">
				<span>결제일</span>
				<span>${day}</span>
			</div>
			<div class="total-info-box">
				<div>
					<div class="total-info-items wid-20" >
						<span class="fs-15">정가</span>
						<span class="fs-11">
							<fmt:formatNumber value="${lesPrice}" maxFractionDigits="3"/>
						</span>
					</div>
					<div class="total-info-items wid-10" style="padding-top: 53px;">
						<span class="fs-15"><img src="/img/icon/iconmonstr-minus-6.svg" style="width: 24px;"></span>
					</div>
					<div class="total-info-items wid-20">
						<span class="fs-15" >포인트</span>
						<span class="fs-11" id="point-txt">
							<fmt:formatNumber value="${pointVo.pointUpdate}"  maxFractionDigits="3"/>
						</span>
					</div>
					<div class="total-info-items wid-10" style="padding-top: 49px;">
						<span class="fs-15"><img src="/img/icon/equals.png" style="width: 28px;"></span>
					</div>
					<div class="total-info-items wid-20">
						<span class="fs-15">결제금액</span>
						<span class="fs-11" id="pay-txt">
							<fmt:formatNumber value="${total}" var="payCost" maxFractionDigits="3"/><c:out value="${payCost}원"/>
						</span>
					</div>				
				</div>
			</div>
		</div>
		<!-- 이동 버튼 -->
		<div class="btn-box">
			<c:url value="/user/main" var="main"/>
			<a href="${main}" class="move-item" id="mainMove">메인으로</a>
			<a href="#" class="move-item">내강의실</a>
		</div>
	</div>
</div>

