<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취업공고</title>
<script>
$(document).ready(function(){

	$("button[id^=fileDownBtn]").on("click", function(){
		filesId = $(this).val();
		document.location="${cp}/user/downloadJobInfo?jobinfoId=${jobInfoVo.jobinfoId}&filesId="+filesId;
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

});

</script>

</head>
<body>
	<form class="form-horizontal" enctype="multipart/form-data" >
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">취업공고 아이디</label>
			<div class="col-sm-10">
				<label class="control-label">${jobInfoVo.jobinfoId}</label>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">취업공고 제목</label>
			<div class="col-sm-10">
				<label class="control-label">${jobInfoVo.jobinfoTitle}</label>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">취업공고 내용</label>
			<div class="col-sm-10">
				<label class="control-label">${jobInfoVo.jobinfoCont}</label>
			</div>
		</div>

		<div class="form-group">
			<label for="pass" class="col-sm-2 control-label">작성 날짜</label>
			<div class="col-sm-10">
				<label class="control-label"><fmt:formatDate value="${jobInfoVo.jobinfoDate}" pattern="yyyy-MM-dd" /></label>
			</div>
		</div>

		<div class="form-group">
			<label for="pass" class="col-sm-2 control-label">작성자</label>
			<div class="col-sm-10">
				<label class="control-label">${jobInfoVo.adminId}</label>
			</div>
		</div>

		<c:forEach items="${filesList}" var="filesVo">
			<div class="form-group">
				<label for="pass" class="col-sm-2 control-label">첨부파일</label>
				<button id="fileDownBtn" type="button" class="btn btn-default"
					value="${filesVo.filesId}">${filesVo.filesNm}</button>
			</div>
		</c:forEach>
		
	</form>
