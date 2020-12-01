<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
<div style="color:black">
	<form name="form1"  method="post">
      
        검색<input type="text" name="keyWord" value="${keyWord}">
        <input id="searchBtn" type="button" class="btn btn-warning btn-sm" value="조회">
        <button type="button" id="btnWrite" class="btn btn-info btn-sm">글쓰기</button>
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
						<td>${jobInfo.jobinfoId}</td>
						<td><a href="${cp}/admin/selectJobInfo?jobinfoId=${jobInfo.jobinfoId}">${jobInfo.jobinfoTitle}</a></td>
						<td><fmt:formatDate value="${jobInfo.jobinfoDate}" pattern="yyyy-MM-dd" /></td>
						<td>${jobInfo.adminId}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
	
	<div class="text-center">
			<ul class="pagination justify-content-center m-0">
				<c:choose>
					<c:when test="${page != 0 && page != 1}">
						  <li class="page-item"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${1}"><i class="fas fa-angle-double-left"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${page-1}"><i class="fas fa-double-left"></i></a></li>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == page}">
							<li class="page-item active"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${page != pages}">
						  <li class="page-item"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${page+1}"><i class="fas fa-angle-double-right"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/admin/selectAllJobInfo?keyWord=${param.keyWord}&page=${pages}"><i class="fas fa-angle-right"></i></a></li>
					</c:when>
				</c:choose> 	
			</ul>
		</div>		

</div>