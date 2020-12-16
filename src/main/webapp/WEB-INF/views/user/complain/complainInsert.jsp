<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
			var cont = $("#cpCont").val();
			if(cont != ''){
				var sub = confirm("접수하시겠습니까?")
				if(sub){
					smit();
					alert("접수되었습니다");
					return;
				}else{
					return;
				}
			}else{
				alert("내용을 입력해주세요");
				return;
			}
			window.close();
		})
	})
	
	function smit(){
		$("#insertcp").submit();
	}
	
	
</script>
</head>
<body>
<div>신고하기</div>
<br>
<form id="insertcp" action="${cp}/user/insertComplain" method="POST">
	<table>
		<tr>
			<td>글 아이디</td>
			<c:choose>
				<c:when test="${qnaId == null or qnaId == ''}">
				<input type="hidden" name="cpGn" value="1">
					<td><input type="text" name="replyId" id="replyId" value="${replyId}" readonly></td>
				</c:when>
				<c:otherwise>
				<input type="hidden" name="cpGn" value="2">
					<td><input type="text" name="qnaId" id="qnaId" value="${qnaId}" readonly></td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" cols="30" name="cpCont" id="cpCont"></textarea></td>
		</tr>
	</table>
</form>
<input type="button" id="cancle" name="cancle" value="닫기">
<input type="button" id="check" name="check" value="신고접수">
</body>
</html>