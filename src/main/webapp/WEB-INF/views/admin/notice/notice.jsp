<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<title>공지사항</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">
<script>
$(document).ready(function(){
	$("#upbutton").on("click", function(){
		document.location="${cp}/admin/updateNotice?noticeId=${noticeVo.noticeId}";
	});
	
	$("#delbutton").on("click", function(){
		
		document.location="${cp}/admin/deleteNotice?noticeId=${noticeVo.noticeId}";
	});
	
	$("#listbutton").on("click", function(){
		document.location="${cp}/admin/selectAllNotice";
	});


	$("button[id^=fileDownBtn]").on("click", function(){
		filesId = $(this).val();
		document.location="${cp}/admin/downloadNotice?noticeId=${noticeVo.noticeId}&filesId="+filesId;
	});
});

</script>
<style>
	.filesButton{
		background-color : #D4D4D4;
		color : black;
	}
	.card{
		width:1000px;
		margin:auto;
		background-color : #F8FFFF;
	}
	h2{
		color : #1d25af;
	}
	.row{
		margin: 50px 130px 0;
		background-color: white;
	}
	#delbutton, #upbutton{
		float:right;
	}
</style>
<div class="row shadow" >
	<div class="col-12" style="margin:50px;">
		<div class="card">
			<div style="text-align:center;">
				<h2>${noticeVo.noticeTitle}</h2>
				<hr>
			</div>
			
			<div>
				<label class="control-label">&nbsp;&nbsp;&nbsp;${noticeVo.noticeId}</label>
				<label style="float:right;" class="control-label">작성자 : ${noticeVo.adminId}</label>
				<br>
				<label style="float:right;" class="control-label">작성날짜 : <fmt:formatDate value="${noticeVo.noticeDate}" pattern="yyyy-MM-dd" /></label>
				<hr>
			</div>

			<div>	
				<c:if test="${filesList.size() != 0}">
					<span style="margin-left:30px;">첨부파일 :</span> 
				</c:if>
				<c:forEach items="${filesList}" var="filesVo">
					<button id="fileDownBtn" type="button" class="btn filesButton"
						value="${filesVo.filesId}">${filesVo.filesNm}</button>
				</c:forEach>
			</div>
			<br>
			<div style="margin:30px;">
				<label class="control-label">${noticeVo.noticeCont}</label>
			</div>
			
			<div>
				<label style="float:right;"class="control-label">삭제여부 : ${noticeVo.noticeOut}</label>
			</div>

			<div>
				<button type="button" id="listbutton" class="btn btn-primary">목록</button>
				<button type="button" id="upbutton" class="btn btn-success">수정</button>
				<button type="button" id="delbutton" class="btn btn-warning">삭제</button>
			</div>
		</div>
	</div>
</div>