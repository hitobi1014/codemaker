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
	
	$("#return").on("click", function(){
		document.location="${cp}/user/selectAllNotice";
	})
	
	
	$("button[id^=fileDownBtn]").on("click", function(){
		filesId = $(this).val();
		document.location="downloadNotice?noticeId=${noticeVo.noticeId}&filesId="+filesId;
	});
});

</script>

<div  style="width:800px; height:750px; margin:auto; text-align:center;">
	<form class="form-horizontal" enctype="multipart/form-data" >
		<div class="ArticleContentBox">
			<div class="article_header">
				<div class="ArticleTitle">
					<span>공지사항 [${noticeVo.noticeId}]</span>
					<div class="title_area">
						<h3 class="title_text">${noticeVo.noticeTitle}</h3>
					</div>
				</div>
				<div class="WriterInfo">
					<div class="profile_area">
						<div class="profile_info">
							<div class="nick_box">${noticeVo.adminId}</div>
						</div>
						<div class="article_info">
							<span class="date"><fmt:formatDate value="${noticeVo.noticeDate}" pattern="yyyy-MM-dd" /></span>
						</div>
					</div>
				</div>
			</div>
		<div class="article_container">
			<div class="AttachFileList">
				<div class="attach_file">
					<c:forEach items="${filesList}" var="filesVo">
						<div class="form-group">
							첨부파일
							<button id="fileDownBtn" type="button" class="btn btn-info"
								value="${filesVo.filesId}">${filesVo.filesNm}</button>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="article_viewer">
				<div class="ContentRenderer">
					<div>
						${noticeVo.noticeCont}
					</div>
				</div>
			</div>		
		</div>
	</div>
		<input type="button" id="return" value="뒤로가기">
	</form>
</div>
