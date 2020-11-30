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

<title>Insert title here</title>
<script>
$(document).ready(function(){
		
	$("#btnWrite").on("click", function(){
		document.location="${cp}/admin/notice/insertNotice";
	});
	$("#searchBtn").on("click", function(){
		
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
	
		document.location="${cp}/admin/jobInfo/selectAllJobInfo?&keyWord="+keyWord;
		
	});
})
</script>

</head>
<body>
	<form name="form1"  method="post">
      
        검색<input type="text" name="keyWord" value="${keyWord}">
        <input id="searchBtn" type="button" value="조회">
        <button type="button" id="btnWrite">글쓰기</button>
    </form>


	<div class="table-responsive">
		<table class="table table-striped">
			<tr>
				<th>취업공고 아이디</th>
				<th>취업공고 제목</th>
				<th>취업공고 작성일</th>
				<th>작성자아이디</th>
			</tr>
			<tbody id="jobInfoList">
				<c:forEach items="${jobInfoList}" var="jobInfo">
					<tr>
						<td>${jobInfo.job_id}</td>
						<td><a href="${cp}/admin/jobInfo/selectJobInfo?job_id=${jobInfo.job_id}">${jobInfo.job_title}</a></td>
						<td><fmt:formatDate value="${jobInfo.job_date}" pattern="yyyy-MM-dd" /></td>
						<td>${jobInfo.admin_id}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
	
	<div class="text-center">
			<ul class="pagination justify-content-center m-0">
				<c:choose>
					<c:when test="${page != 0 && page != 1}">
						  <li class="page-item"><a class="page-link" href="${cp}/admin/notice/selectAllJobInfo?keyWord=${param.keyWord}&page=${1}"><i class="fas fa-angle-double-left"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/admin/notice/selectAllJobInfo?keyWord=${param.keyWord}&page=${page-1}"><i class="fas fa-double-left"></i></a></li>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == page}">
							<li class="page-item active"><a class="page-link" href="${cp}/admin/notice/selectAllJobInfo?keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/admin/notice/selectAllJobInfo?keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${page != pages}">
						  <li class="page-item"><a class="page-link" href="${cp}/admin/notice/selectAllJobInfo?keyWord=${param.keyWord}&page=${page+1}"><i class="fas fa-angle-double-right"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/admin/notice/selectAllJobInfo?keyWord=${param.keyWord}&page=${pages}"><i class="fas fa-angle-right"></i></a></li>
					</c:when>
				</c:choose> 	
			</ul>
		</div>		
</body>
</html>
