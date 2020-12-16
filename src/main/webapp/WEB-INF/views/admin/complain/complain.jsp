<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고내역</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#cancle").on("click", function(){
			self.close();
		})
		
		$("#check").on("click", function(){
			var select = confirm("처리하시겠습니까?");
			if(select){
				document.location="/admin/checkComplain?cpId=${cpVo.cpId}";
				self.close();
			}else{
				return;
			}
			
		})
		
		$("#show").on("click", function(){
			var url = "";
			var option = "";
			if(${cpVo.qnaId != null}){
				url = "/user/selectQna?qnaId=${cpVo.qnaId}";
				option = "width = 1500, height = 800, top = 100, left = 200, location = no";
			}else if(${cpVo.replyId != null}){
				url = "/user/selectQna?qnaId=${reId}";
				option = "width = 1500, height = 800, top = 100, left = 200, location = no";
			}
			window.open(url, "_blank", option);
		})
	})
</script>
</head>
<body>
<table border="block">
	<tr>
		<td>신고 아이디</td>
		<td>${cpVo.cpId}</td>
	</tr>
	<tr>
		<td>신고 날짜</td>
		<td><fmt:formatDate value="${cpVo.cpDate}" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<td>신고 내용</td>
		<td>${cpVo.cpCont}</td>
	</tr>
	<tr>
		<td>처리 상태</td>
		<td>${cpVo.cpState}</td>
	</tr>
	<tr>
		<td>신고 구분</td>
		<td>
			<c:choose>
				<c:when test="${cpVo.replyId != null}">
					<div>${cpVo.replyId}</div>
				</c:when>
				<c:otherwise>
					<div>${cpVo.qnaId}</div>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>
<input type="button" id="cancle" name="cancle" value="닫기">
<input type="button" id="check" name="check" value="신고접수">
<input type="button" id="show" name="show" value="글보러가기">

</body>
</html>