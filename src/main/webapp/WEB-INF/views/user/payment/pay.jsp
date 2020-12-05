<%@page import="kr.co.codemaker.user.cart.vo.LessonVO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div>
	<c:set value="${lessonVo.lesTerm}" var="lesTerm"/>
	<%
		int lesTerm =(int)(pageContext.getAttribute("lesTerm")); 
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		cal.add(Calendar.DATE, lesTerm);
	%>
	<h1>임시테스트 정보 확인</h1>
	강의명 : ${lessonVo.lesNm} <br>
	강사명 : ${lessonVo.tchNm} <br>
	수강기간 : <%= sdf.format(now)%> ~ <%= sdf.format(cal.getTime())%><br>
	구매자 정보 : ${userVo.userId} <br>
	결제금액 : ${lessonVo.lesCash} <br>
	강의아이디 : ${lessonVo.lesId} <br>
</div>

<div>
	<h1>폼 전송 테스트</h1>
	<c:url value="/user/pay" var="pay"/>
	<form:form action="${pay}" method="post" commandName="payVO" id="payFrm">
		<!-- 넘어가야할 정보 
			결제수단
			결제금액
			수강기간
			회원아이디
			강의아이디
		-->
		결제수단 : <form:input path="payWay" value="1"/><br>
		결제금액 : <form:input path="paySum" value="${lessonVo.lesCash}"/>
		수강기간 : <form:input path="cosTerm" value="${lessonVo.lesTerm}"/>
		회원아이디 : <form:input path="userId" value="${userVo.userId}"/>
		강의 아이디 : <form:input path="lesId" value="${lessonVo.lesId}"/>
		<button id="payBtn">결제하기</button>
	</form:form>
</div>
<script>
$(function(){
	$("#payBtn").on('click',function(){
		$("#payFrm").submit();
	})
})
</script>
