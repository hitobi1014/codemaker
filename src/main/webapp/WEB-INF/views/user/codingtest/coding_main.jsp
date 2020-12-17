<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link rel="stylesheet" href="/css/user/coding/coding-main.css"/>
<div class="cmenu-container">
	<div class="cmenu-box">
		<c:url value="/user/coding/practice" var="cdpractice"/>
		<a href="${cdpractice}">코딩연습하기</a>
	</div>
	<div class="cmenu-box">
		<c:url value="/user/coding/test" var="cdtest"></c:url>
		<a href="${cdtest}">코딩테스트</a>
	</div>
</div>