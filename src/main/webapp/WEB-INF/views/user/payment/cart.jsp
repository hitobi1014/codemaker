<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/json/jquery.serialize-object.js"></script>
<style>
tr, td{
border:1px solid black;
}
</style>
<h1>장바구니 입니다</h1>
<table>
	<tr>
		<th>체크박스</th>
		<th>강의아이디</th>
		<th>강의명</th>
		<th>강사명</th>
		<th>수강기간</th>
		<th>금액</th>
	</tr>
<%-- 	<c:url value="/user/payView" var="payView"/> --%>
		<form id="frm" method="post">
		<c:forEach items="${lessonList}" var="lesson">
			<tr>
				<td><input type="checkbox" class="lesChk"/></td>
				<td><input type="text" value="${lesson.lesId}" name="lesId" readonly="readonly"/></td>
				<td><input type="text" value="${lesson.lesNm}" name="lesNm" readonly="readonly"/></td>
				<td><input type="text" value="${lesson.tchNm}" name="tchNm" readonly="readonly"/></td>
				<td><input type="text" value="${lesson.lesTerm}" name="lesTerm" readonly="readonly"/></td>
				<td><input type="text" value="${lesson.lesCash}" name="lesCash" readonly="readonly"/></td>
			</tr>
		</c:forEach>
		</form>
	<button id="sub">결제하기</button>
</table>
<script>
$(function(){
	$("#sub").on('click',function(){
		var lessonArr = new Array();
		$(".lesChk:checked").each(function(){
			var td = $(this).parent().parent().children();
// 			var lvo = td.children().serialize();
			var lvo = td.children().serializeObject();
// 			console.log("lvo 값 : "+lvo);
// 			lessonArr.push(jsonData);
			lessonArr.push(lvo);
		})
		console.log("lessonArr 값"+JSON.stringify(lessonArr));
		var jsonData = JSON.stringify(lessonArr);
		$.ajax({
			url : '<c:url value="/user/payView"/>',
			method : 'post',
			traditional : true,
			contentType : 'application/json; charset=utf-8',
			data : jsonData,
			success : function(res){
				alert("성공");
			},
			error : function(xhr){
				alert(xhr);
			}
			
		})
	})
})

</script>