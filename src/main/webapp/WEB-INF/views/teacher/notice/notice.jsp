<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javaScript" src="<c:url value='/resource/js/bootstrap.js'/>"></script><!-- Custom styles for this template -->

<link type="text/css" href="<c:url value='/resource/css/bootstrap.css'/>" rel="stylesheet"><!-- Bootstrap core CSS -->
<link type="text/css" href="<c:url value='/resource/css/dashboard.css'/>" rel="stylesheet">
<link type="text/css" href="<c:url value='/resource/css/blog.css?v=2'/>" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){

	$("button[id^=fileDownBtn]").on("click", function(){
		files_no = $(this).val();
		document.location="downloadView?board_no=${bv.board_no}&files_no="+files_no;
	});
	
	$("#return").on("click", function(){
		document.location="${cp}/teacherNotice/selectAllNotice";
	})

});

</script>

</head>
<body>
	<form class="form-horizontal" enctype="multipart/form-data" >
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 번호</label>
			<div class="col-sm-10">
				<label class="control-label">${noticeVo.notice_id}</label>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">게시글 제목</label>
			<div class="col-sm-10">
				<label class="control-label">${noticeVo.notice_title}</label>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">게시글 내용</label>
			<div class="col-sm-10">
				<label class="control-label">${noticeVo.notice_cont}</label>
			</div>
		</div>

		<div class="form-group">
			<label for="pass" class="col-sm-2 control-label">작성 날짜</label>
			<div class="col-sm-10">
				<label class="control-label"><fmt:formatDate value="${noticeVo.notice_date}" pattern="yyyy-MM-dd" /></label>
			</div>
		</div>

		<div class="form-group">
			<label for="pass" class="col-sm-2 control-label">작성자</label>
			<div class="col-sm-10">
				<label class="control-label">${noticeVo.admin_id}</label>
			</div>
		</div>

		<c:forEach items="${filesList}" var="filesVo">
			<div class="form-group">
				<label for="pass" class="col-sm-2 control-label">첨부파일</label>
				<button id="fileDownBtn" type="button" class="btn btn-default"
					value="${filesVo.files_id}">${filesVo.files_nm}</button>
			</div>
		</c:forEach>
		
		<input type="button" id="return" value="뒤로가기">
		
	</form>
</body>	
</html>