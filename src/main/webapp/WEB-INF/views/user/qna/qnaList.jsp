<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">

<title>Insert title here</title>
<script>
$(document).ready(function(){
	
	$("#insertqna").on("click", function(){
		document.location="/user/insertQna?lesId=${param.lesId}";
	});
	
})
</script>

<style>
	.card{
		width:1000px;
		margin:auto;
	}
	h2{
		color : #1d25af;
	}
	#ff{
		margin: 50px 130px 0;
		background-color: white;
	}
</style>
<div id="ff">
	<div style="margin:50px;">
		<div class="card">
			<div>
				<h2>CodeMaker QNA</h2>
			</div>
			<hr>
		
		<div class="table-responsive">
			<table class="table">
				<tr>
					<th>QNA 아이디</th>
					<th>QNA 제목</th>
					<th>QNA 작성일</th>
					<th>작성자아이디</th>
				</tr>
				<tbody id="noticeList">
					<c:forEach items="${qnaList}" var="qna">
						<c:if test="${qna.qnaOut == 'N'}">
							<tr>
								<td>${qna.qnaId}</td>
								<td><a href="${cp}/user/selectQna?qnaId=${qna.qnaId}">${qna.qnaTitle}</a></td>
								<td><fmt:formatDate value="${qna.qnaDate}" pattern="yyyy-MM-dd" /></td>
								<td>${qna.userId}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<button style="float:right" type="button" id="insertqna" class="btn btn-primary">QNA작성</button>
		</div>
	
		<div class="text-center">
			<ul class="pagination justify-content-center m-0">
				<c:choose>
					<c:when test="${param.page != null and param.page != 1 and param.page != ''}">
						<li class="page-item"><a class="page-link"
							href="${cp}/user/selectAllQna?lesId=${param.lesId}&page=${1}"><<</a></li>
						<li class="page-item"><a class="page-link"
							href="${cp}/user/selectAllQna?lesId=${param.lesId}&page=${param.page-1}"><</a></li>
					</c:when>
				</c:choose>
		
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == param.page or param.page == ''}">
							<li class="page-item active"><a class="page-link" href="${cp}/user/selectAllQna?lesId=${param.lesId}&page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/user/selectAllQna?lesId=${param.lesId}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${param.page != pages and param.page != 1 and param.page != null}">
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllQna?lesId=${param.lesId}&page=${param.page+1}">></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllQna?lesId=${param.lesId}&page=${pages}">>></i></a></li>
					</c:when>
				</c:choose> 	
			</ul>
			</div>
		</div>		
	</div>
</div>
