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
		

	
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	}, true);
	
	
	$("#searchBtn").on("click", function(){
		
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
	
		document.location="${cp}/user/selectAllNotice?searchOption="+searchOption+"&keyWord="+keyWord;
		
	});
	
	$("#notice1").on("click", function(){
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
		document.location="${cp}/user/selectAllNotice?searchOption=1&keyWord="+keyWord;
	});
	
	$("#notice2").on("click", function(){
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
		document.location="${cp}/user/selectAllNotice?searchOption=2&keyWord="+keyWord;
	});
	
})
</script>
<div class="d-flex">
	<div class="wrapper" style="width:200px;">
		<div class="list-group list-group-flush">
	        <a href="${cp}/user/main" class="list-group-item list-group-item-action bg-light">Main</a>
	        <a href="${cp}/user/selectAllNotice?searchOption=1&keyWord="+keyWord class="list-group-item list-group-item-action bg-light">공지사항</a>
	        <a href="${cp}/user/selectAllNotice?searchOption=2&keyWord="+keyWord class="list-group-item list-group-item-action bg-light">자주묻는질문</a>
	        <a href="#" class="list-group-item list-group-item-action bg-light">QnA</a>
	        <a href="${cp}/mypage/myinfoSelect" class="list-group-item list-group-item-action bg-light">마이페이지</a>
	        <a href="#" class="list-group-item list-group-item-action bg-light">장바구니</a>
     	</div>
	</div>
		<div class="table-responsive" style="width:800px; height:800px; margin-left:19%; text-align:center; ">
			<br>
			<c:if test="${searchOption == '1' || searchOption == '' || searchOption == null}">
				<button id="notice1" type="button" class="btn btn-info btn-lg active">공지사항</button>
				<button id="notice2" type="button" class="btn btn-info btn-lg">자주묻는질문</button>
			</c:if>
			<c:if test="${searchOption == '2'}">
				<button id="notice1" type="button" class="btn btn-info btn-lg">공지사항</button>
				<button id="notice2" type="button" class="btn btn-info btn-lg active">자주묻는질문</button>
			</c:if>
			<hr>
			<form name="form1"  method="post">
			
		        <select name="searchOption">
		            <c:if test="${searchOption == '1' || searchOption == '' || searchOption == null}">
			            <option value="1" selected="true">공지사항</option>
			            <option value="2">자주묻는질문</option>
		            </c:if>
		            <c:if test="${searchOption == '2'}">
			            <option value="1">공지사항</option>
			            <option value="2" selected="true">자주묻는질문</option>
		            </c:if>
		        </select>
		        <input id="keywords" type="text" name="keyWord" value="${keyWord}">
		        <button id="searchBtn" type="button" class="btn btn-warning btn-sm">조회</button>
		    </form>
		    <hr>
			<table class="table table-striped">
				<tr>
					<th>공지사항 아이디</th>
					<th>공지사항 제목</th>
					<th>공지사항 작성일</th>
					<th>작성자아이디</th>
				</tr>
				<tbody id="noticeList">
					<c:forEach items="${noticeList}" var="notice">
						<tr>
							<td>${notice.noticeId}</td>
							<td><a href="${cp}/user/selectNotice?noticeId=${notice.noticeId}">${notice.noticeTitle}</a></td>
							<td><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd" /></td>
							<td>${notice.adminId}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
	
		<div class="text-center" >
			<ul class="pagination justify-content-center m-0">
				<c:choose>
					<c:when test="${param.page != 0 && param.page != 1 && param.page != null}">
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${1}"><i class="fas fa-angle-double-left"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${param.page-1}"><i class="fas fa-angle-left"></i></a></li>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == param.page || param.page == null}">
							<li class="page-item active"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${param.page != pages && param.page != null}">
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${param.page+1}"><i class="fas fa-angle-right"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${pages}"><i class="fas fa-angle-double-right"></i></a></li>
					</c:when>
				</c:choose> 	
			</ul>
		</div>
	</div>				
</div>
