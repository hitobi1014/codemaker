<%@page import="kr.co.codemaker.user.cart.vo.LessonVO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div>
	<h1>폼 전송 테스트</h1>
	<c:url value="/user/pay" var="pay"/>
	
	<c:if test="${lessonVo !=null}">
		<form action="${pay}" method="post" id="payFrm">
			결제수단 : <input name="payWay" value="1"/><br>
			결제금액 : <input name="paySum" value="${lessonVo.lesCash}"/>
			수강기간 : <input name="cosTerm" value="${lessonVo.lesTerm}"/>
			회원아이디 : <input name="userId" value="${userVo.userId}"/>
			강의 아이디 : <input name="lesId" value="${lessonVo.lesId}"/>
			<button id="payBtn">결제하기</button>
		</form>
	</c:if>
	
	<c:if test="${lessonVoList != null}">
		<form action="${pay}" method="post" id="payListFrm">
			<table>
				<% int sum = 0; %>
				<c:forEach items="${lessonVoList}" var="lesson"  varStatus="stat">
					<input type="hidden" name="payList[${stat.index}].userId" value="${userVo.userId}"/>
					<input type="hidden" name="payList[${stat.index}].payWay" value="1"/>
					<input type="hidden" name="payList[${stat.index}].paySum" value="${lesson.lesCash}"/>
					<input type="hidden" name="payList[${stat.index}].cosTerm" value="${lesson.lesTerm}"/>
					<input type="hidden" name="payList[${stat.index}].lesId" value="${lesson.lesId}"/>
					<c:set value="${lesson.lesTerm}" var="lesTerm"/>
					<c:set value="${lesson.lesCash}" var="lesCash"/>
					<%
						int lesTerm =(int)(pageContext.getAttribute("lesTerm")); 
						Date now = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
						Calendar cal = Calendar.getInstance();
						cal.setTime(now);
						cal.add(Calendar.DATE, lesTerm);
						sum += (int)(pageContext.getAttribute("lesCash"));
					%>
					<tr>
						<td>
							강의명: ${lesson.lesNm} &nbsp;&nbsp;
						</td>
						<td>
							강사: ${lesson.tchNm} &nbsp;&nbsp;
						</td>
						<td>
							수강기간 : <%=sdf.format(now)%> ~ <%= sdf.format(cal.getTime()) %> &nbsp;&nbsp;
						</td>
						<td>
							결제금액 : ${lesson.lesCash} &nbsp;&nbsp;
						</td>
						<td>
							강의 아이디 : ${lesson.lesId} &nbsp;&nbsp;
							<input type="hidden" lesId" value="${lesson.lesId}" readonly="readonly"/>
						</td>
					</tr>
				</c:forEach>			
		</table>
			<button id="payListBtn">결제하기</button>
			총 합계 : <%= sum %>
			회원아이디 : ${userVo.userId}<br>
		</form>
	</c:if>
</div>

<script>
$(function(){
	$("#payBtn").on('click',function(){
		$("#payFrm").submit();
	})
	
	$("#payListBtn").on('click',function(){
		$("#payListFrm").submit();
	})
})
</script>
