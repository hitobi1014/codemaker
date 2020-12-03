<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 취업공고</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">

<script>
$(document).ready(function(){
		
	$("#btnWrite").on("click", function(){
		document.location="${cp}/admin/insertJobInfo";
	});
	$("#searchBtn").on("click", function(){
		
		var keyWord = $("input[name='keyWord']").val();
	
		document.location="${cp}/admin/selectAllJobInfo?keyWord="+keyWord;
		
	});
})
</script>
<style>
	#firstdiv{
		color:black; 
		margin:auto; 
		margin-top:10%; 
		width:1000px; 
		float:center;
	}
	h2{
		color : #1d25af;
	}
</style>

<div id="firstdiv" class="card">
	<div>
		<h2>CodeMaker 취업 공고 현황</h2>
	</div>
	<hr>
	<div class="table-responsive">
		<table class="table">
			<tr>
				<th>취업공고 아이디</th>
				<th>취업공고 제목</th>
				<th>취업공고 작성일</th>
				<th>작성자아이디</th>
				<th>삭제여부</th>
			</tr>
			<tbody id="jobInfoList">
				<c:forEach items="${jobInfoList}" var="jobInfo">
					<tr>
						<td>${jobInfo.jobinfoId}</td>
						<td><a href="${cp}/admin/selectJobInfo?jobinfoId=${jobInfo.jobinfoId}">${jobInfo.jobinfoTitle}</a></td>
						<td><fmt:formatDate value="${jobInfo.jobinfoDate}" pattern="yyyy-MM-dd" /></td>
						<td>${jobInfo.adminId}</td>
						<td>${jobInfo.jobinfoOut}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" id="btnWrite" class="btn btn-info btn-sm" style="float:right; width:100px; height:30px;">공고등록</button>
	</div>	
	
	<div class="text-center">
			<ul class="pagination justify-content-center m-0">
				<c:choose>
					<c:when test="${param.page != 0 && param.page != 1}">
						  <li class="page-item"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${1}"><<</a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${page-1}"><</a></li>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == param.page}">
							<li class="page-item active"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${param.page != pages}">
						  <li class="page-item"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${page+1}">></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${pages}">>></a></li>
					</c:when>
				</c:choose> 	
			</ul>
			<hr>
			<div>
				<form name="form1"  method="post">
			       <span>검색</span><input type="text" name="keyWord" value="${keyWord}" style="border : 1px solid black;">
			       <input id="searchBtn" type="button" class="btn btn-warning btn-sm" value="조회">
			    </form>
			</div>
		</div>		

</div>