<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 취업공고</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">

<script>
$(document).ready(function(){
		
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	}, true);
	
	$("#searchBtn").on("click", function(){
		
		var keyWord = $("input[name='keyWord']").val();
	
		document.location="${cp}/user/selectAllJobInfo?keyWord="+keyWord;
		
	});
})
</script>
<style>
	.table-responsive {
		margin-left:10%; 
		margin-right:10%; 
		height:800px; 
		text-align:center;
	}
</style>
<div class="d-flex">
		<div class="table-responsive" style="margin-left:10%; margin-right:10%; height:800px; text-align:center;">
			<h2>CodeMaker취업 공고</h2>
			<div style="background-color:white;">
				    <hr>
				<div style="margin:auto; width:1000px;">
					<table class="table">
						<tr>
							<th>취업공고 아이디</th>
							<th>취업공고 제목</th>
							<th>취업공고 작성일</th>
							<th>작성자아이디</th>
						</tr>
						<tbody id="jobinfoList">
							<c:forEach items="${jobinfoList}" var="jobinfo">
								<c:if test="${jobinfo.jobinfoOut == 'N'}">
									<tr>
										<td>${jobinfo.jobinfoId}</td>
										<td><a href="${cp}/user/selectJobInfo?jobinfoId=${jobinfo.jobinfoId}">${jobinfo.jobinfoTitle}</a></td>
										<td><fmt:formatDate value="${jobinfo.jobinfoDate}" pattern="yyyy-MM-dd" /></td>
										<td>${jobinfo.adminId}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	
		<div class="text-center" >
			<ul class="pagination justify-content-center m-0">
				<c:choose>
					<c:when test="${param.page != '' and param.page != 1 and param.page != null}">
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllJobInfo?keyWord=${param.keyWord}&page=${1}"><i class="fas fa-angle-double-left"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllJobInfo?keyWord=${param.keyWord}&page=${param.page-1}"><i class="fas fa-angle-left"></i></a></li>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == param.page}">
							<li class="page-item active"><a class="page-link" href="${cp}/user/selectAllJobInfo?keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/user/selectAllJobInfo?keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${param.page != pages and pages != 1}">
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllJobInfo?keyWord=${param.keyWord}&page=${param.page+1}"><i class="fas fa-angle-right"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllJobInfo?keyWord=${param.keyWord}&page=${pages}"><i class="fas fa-angle-double-right"></i></a></li>
					</c:when>
				</c:choose> 	
			</ul>
			<hr>
			<div>
		        <span>검색</span><input type="text" name="keyWord" value="${param.keyWord}" style="border : 1px solid black;">
		        <button id="searchBtn" type="button" class="btn btn-warning btn-sm">조회</button>
			</div>
		</div>
	</div>			
</div>