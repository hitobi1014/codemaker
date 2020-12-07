<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!-- main(css)-->
<link href="/vendor/user/main/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- main Custom styles for this template-->
<link href="/css/user/main/sb-admin-2.min.css" rel="stylesheet">

 <!-- main Bootstrap core JavaScript-->
<script src="/vendor/user/main/jquery/jquery.min.js"></script>
<script src="/vendor/user/main/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- main Core plugin JavaScript-->
<script src="/vendor/user/main/jquery-easing/jquery.easing.min.js"></script>

<!-- main Custom scripts for all pages-->
<script src="/js/user/main/sb-admin-2.min.js"></script>

<!-- main Page level plugins -->
<script src="/vendor/user/main/chart.js/Chart.min.js"></script>

<!-- main Page level custom scripts -->
<script src="/js/user/main/demo/chart-area-demo.js"></script>
<script src="/js/user/main/demo/chart-pie-demo.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(document).ready(function(){
	
	$("#listbutton").on("click", function(){
		document.location="${cp}/user/selectAllNotice";
	})
	
	
	$("button[id^=fileDownBtn]").on("click", function(){
		filesId = $(this).val();
		document.location="downloadNotice?noticeId=${noticeVo.noticeId}&filesId="+filesId;
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
		margin-bottom:30px;
	}
</style>
<div class="row shadow" >
	<div class="col-12" style="margin:50px;">
		<div class="card" style=" height:500px;">
			<div style="text-align:center;">
			<div>
				<button type="button" id="listbutton" class="btn btn-primary" style="float:left;">목록</button>			
			</div>
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
		</div>
	</div>
</div>