<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<title>공지사항</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(document).ready(function(){
	
	$("#listbutton").on("click", function(){
		document.location="${cp}/user/selectAllNotice?searchOption=1&keyWord=${param.keyWord}&page=1";
	})
	
	$("button[id^=fileDownBtn]").on("click", function(){
		filesId = $(this).val();
		document.location="downloadNotice?noticeId=${noticeVo.noticeId}&filesId="+filesId;
	});
});

</script>
<style>
body, p{
	font-family: 'LotteMartDream' !important;
}
	.filesButton{
		background-color : #D4D4D4;
		color : black;
	}
	.card{
		width: 70%;
	    height: 700px;
	    margin: 20px auto 0;
	    border: none;
	    padding: 40px;
	    font-family: 'LotteMartDream';
	}
	.titleDiv{
		text-align:center;
		margin:20px;
	}
	#title{
		color : #1d25af;
		font-weight: 600;
		font-family: 'LotteMartDream';
		font-size: 35px
	}
	.row{
		margin: 50px 130px 0;
		background-color: white;
	}
	.btnClass{
		float:right;
		width: 80px;
		margin-right: 10px;
	}
	.header{
		float: right;
	}
	.headerId{
		width: 100%;
		text-align: right;
		font-size: 20px;
    	font-weight: 600;
	} 
	.headerDate{
		width: 100%;
		text-align: right;
		color: #a9a8a8;
   		font-size: 17px;
    	font-weight: 400;
    	margin-top: -10px;
	}
	#idImg{
		width: 20px;
	}
	.contentDiv{
		margin: 30px;
	    border: 2px solid #c1bebe;
	    height: 350px;
	    padding: 20px;
	    font-size: 18px;
    	font-weight: 500;
	}
	#listbutton{
		width: 80px;
   		margin-left: 30px;
	}
</style>
<body>
	<div class="card">
		<div class="titleDiv">
			<h2 id="title">${noticeVo.noticeTitle}</h2>
		</div>
		
		<div class="header">
			<label class="headerId"><img id="idImg" src="/images/admin/notice/id.png">&nbsp;&nbsp;${noticeVo.adminId}</label>
			<label class="headerDate"><fmt:formatDate value="${noticeVo.noticeDate}" pattern="yyyy-MM-dd HH:mm" /></label>
		</div>
		
		<button type="button" id="listbutton" class="btn btn-primary">목록</button>
		<br>
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
		<div class="contentDiv">
			<label class="control-label">${noticeVo.noticeCont}</label>
		</div>
	</div>
</body>	