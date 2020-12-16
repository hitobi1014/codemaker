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
	
	
	$("#keywords").keydown(function(key) {
		if (key.keyCode == 13) {
			var searchOption = $("select[name='searchOption']").val();
			var keyWord = $("input[name='keyWord']").val();
		
			document.location="${cp}/user/selectAllNotice?searchOption="+searchOption+"&keyWord="+keyWord+"&page=1";
		}
	});
	
// 	document.addEventListener('keydown', function(event) {
// 		  if (event.keyCode == 13) {
// 		    event.preventDefault();
// 		  };
// 	}, true);
	
	
	$("#searchBtn").on("click", function(){
		
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
	
		document.location="${cp}/user/selectAllNotice?searchOption="+searchOption+"&keyWord="+keyWord+"&page=1";
		
	});
	
	$("#notice1").on("click", function(){
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
		document.location="${cp}/user/selectAllNotice?searchOption=1&keyWord="+keyWord+"&page=1";
	});
	
	$("#notice2").on("click", function(){
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
		document.location="${cp}/user/selectAllNotice?searchOption=2&keyWord="+keyWord+"&page=1";
	});
	
})
</script>
<style>
	.table-responsive {
		margin-left:10%; 
		margin-right:10%; 
		height:800px; 
	}
	a{
		color : black;
	}
</style>

<div class="d-flex">
		<div class="table-responsive" style="height:800px;">
			<br>
			<div style="text-align:center;">
				<c:if test="${param.searchOption == '1' || param.searchOption == '' || param.searchOption == null}">
					<button id="notice1" type="button" class="btn btn-info btn-lg active">공지사항</button>
					<button id="notice2" type="button" class="btn btn-info btn-lg">자주묻는질문</button>
				</c:if>
				<c:if test="${param.searchOption == '2'}">
					<button id="notice1" type="button" class="btn btn-info btn-lg">공지사항</button>
					<button id="notice2" type="button" class="btn btn-info btn-lg active">자주묻는질문</button>
				</c:if>
			</div>
			<hr>
			
			<div style="background-color:white;">
				    <hr>
				<div style="margin:auto; width:1000px;">
					<table class="table" >
						<tr style="text-align:center;">
							<th>공지사항 번호</th>
							<th>공지사항 제목</th>
							<th>공지사항 작성일</th>
							<th>작성자아이디</th>
						</tr>
						<tbody id="noticeList">
							<c:set var="num" value="${totalCnt - ((param.page-1)*10) }"/>
								<c:forEach items="${noticeList}" var="notice" >
									<c:if test="${notice.noticeOut == 'N'}">
										<tr>
											<td style="text-align:center;">${num}</td>
											<td><a href="${cp}/user/selectNotice?noticeId=${notice.noticeId}">${notice.noticeTitle}</a></td>
											<td style="text-align:center;"><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd" /></td>
											<td style="text-align:center;">${notice.adminId}</td>
										</tr>
									</c:if>
									<c:set var="num" value="${num-1}"/>
								</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	
		<div class="text-center" >
			<ul class="pagination justify-content-center m-0">
				<c:choose>
					<c:when test="${param.page != 0 and param.page != 1 and param.page != null}">
					<fmt:parseNumber var="pg" value="${((page / 5 ) - 1 ) * 5 + 1}"/>
						<c:if test="${page > 5}">
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${pg}">이전</a></li>
						</c:if>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == param.page}">
							<li class="page-item active"><a class="page-link">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${param.page != pages && param.page != null}">
						<fmt:parseNumber var="pg" value="${((page / 5 ) + 1 ) * 5 + 1 }"/>
						<c:if test="${pages >= pg}">
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${pg}">다음</a></li>
						</c:if>
					</c:when>
				</c:choose> 	
			</ul>
			<hr>
			<div>
		        <select name="searchOption">
		            <c:if test="${searchOption == '1' || searchOption == '' || searchOption == null}">
			            <option value="1" selected>공지사항</option>
			            <option value="2">자주묻는질문</option>
		            </c:if>
		            <c:if test="${searchOption == '2'}">
			            <option value="1">공지사항</option>
			            <option value="2" selected>자주묻는질문</option>
		            </c:if>
		        </select>
		        <input id="keywords" type="text" name="keyWord" value="${param.keyWord}">
		        <button id="searchBtn" type="button" class="btn btn-warning btn-sm">조회</button>
			</div>
		</div>
	</div>			
</div>
