<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javaScript"
	src="<c:url value='/resource/js/bootstrap.js'/>"></script>
<!-- Custom styles for this template -->

<link type="text/css"
	href="<c:url value='/resource/css/bootstrap.css'/>" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link type="text/css"
	href="<c:url value='/resource/css/dashboard.css'/>" rel="stylesheet">
<link type="text/css" href="<c:url value='/resource/css/blog.css?v=2'/>"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	$("#upbutton").on("click", function(){
		document.location="${cp}/admin/updateNotice?noticeId=${noticeVo.noticeId}";
	});
	
	$("#delbutton").on("click", function(){
		
		document.location="${cp}/admin/deleteNotice?noticeId=${noticeVo.noticeId}";
	});


	$("button[id^=fileDownBtn]").on("click", function(){
		filesId = $(this).val();
		document.location="${cp}/admin/downloadNotice?noticeId=${noticeVo.noticeId}&filesId="+filesId;
	});

	 
	$('textarea').keyup(function() {

	    var content = $(this).val();
	    $('#counter').html("("+content.length+" / 최대 500자)");    //글자수 실시간 카운팅

	    if (content.length > 500){
	        alert("최대 500자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#counter').html("(200 / 최대 500자)");
	    }

	});
	
	$("#return").on("click", function(){
		document.location="${cp}/admin/selectAllNotice";
	})

});

</script>

</head>
<body>
	<form class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 번호</label>
			<div class="col-sm-10">
				<label class="control-label">${noticeVo.noticeId}</label>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">게시글 제목</label>
			<div class="col-sm-10">
				<label class="control-label">${noticeVo.noticeTitle}</label>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">게시글 내용</label>
			<div class="col-sm-10">
				<label class="control-label">${noticeVo.noticeCont}</label>
			</div>
		</div>

		<div class="form-group">
			<label for="pass" class="col-sm-2 control-label">작성 날짜</label>
			<div class="col-sm-10">
				<label class="control-label"><fmt:formatDate value="${noticeVo.noticeDate}" pattern="yyyy-MM-dd" /></label>
			</div>
		</div>

		<div class="form-group">
			<label for="pass" class="col-sm-2 control-label">작성자</label>
			<div class="col-sm-10">
				<label class="control-label">${noticeVo.adminId}</label>
			</div>
		</div>
	
		<c:if test="${filesList != null}">
			<c:forEach items="${filesList}" var="filesVo">
				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">첨부파일</label>
					<button id="fileDownBtn" type="button" class="btn btn-default"
						value="${filesVo.filesId}">${filesVo.filesNm}</button>
				</div>
			</c:forEach>
		</c:if>


			<div class="form-group">
				<label for="pass" class="col-sm-2 control-label">삭제여부</label>
				<div class="col-sm-10">
					<label class="control-label">${noticeVo.noticeOut}</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" id="upbutton" class="btn btn-default">공지사항
						수정</button>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" id="delbutton" class="btn btn-default">공지사항
						삭제</button>
				</div>
			</div>

		<input type="button" id="return" value="뒤로가기">
	</form>
</body>
</html>