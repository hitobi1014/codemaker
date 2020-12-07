<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">

<title>Insert title here</title>
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
	
		document.location="${cp}/teacher/selectAllNotice?searchOption="+searchOption+"&keyWord="+keyWord;
		
	});
	
	$("#notice1").on("click", function(){
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
		document.location="${cp}/teacher/selectAllNotice?searchOption=1&keyWord="+keyWord;
	});
	
	$("#notice2").on("click", function(){
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
		document.location="${cp}/teacher/selectAllNotice?searchOption=2&keyWord="+keyWord;
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
				<h2>CodeMaker 공지 사항</h2>
			</div>
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
		
		<div class="table-responsive">
			<table class="table">
				<tr>
					<th>공지사항 아이디</th>
					<th>공지사항 제목</th>
					<th>공지사항 작성일</th>
					<th>작성자아이디</th>
				</tr>
				<tbody id="noticeList">
					<c:forEach items="${noticeList}" var="notice">
						<c:if test="${notice.noticeOut == 'N'}">
							<tr>
								<td>${notice.noticeId}</td>
								<td><a href="${cp}/teacher/selectNotice?noticeId=${notice.noticeId}">${notice.noticeTitle}</a></td>
								<td><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd" /></td>
								<td>${notice.adminId}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
		<div class="text-center">
			<ul class="pagination justify-content-center m-0">
				<c:choose>
					<c:when test="${param.page != null and param.page != 1 and param.page != ''}">
						<li class="page-item"><a class="page-link"
							href="${cp}/teacher/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${1}"><<</a></li>
						<li class="page-item"><a class="page-link"
							href="${cp}/teacher/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${param.page-1}"><</a></li>
					</c:when>
				</c:choose>
		
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == param.page}">
							<li class="page-item active"><a class="page-link" href="${cp}/teacher/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/teacher/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${param.page != pages and param.page != 1 and param.page != null}">
						  <li class="page-item"><a class="page-link" href="${cp}/teacher/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${param.page+1}">></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/teacher/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${pages}">>></i></a></li>
					</c:when>
				</c:choose> 	
			</ul>
			
			<hr>
			<div>
				<form name="form1" method="post">
					<select name="searchOption">
						<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
						<c:if test="${param.searchOption == 1 || param.searchOption == null || param.searchOption == ''}">
							<option value="1" selected>공지사항</option>
							<option value="2">자주묻는질문</option>
						</c:if>
						<c:if test="${param.searchOption == 2}">
							<option value="1">공지사항</option>
							<option value="2" selected>자주묻는질문</option>
						</c:if>
					</select> 
					<input type="text" name="keyWord" value="${param.keyWord}"><input id="searchBtn"type="button" class="btn btn-warning btn-sm" value="조회">
					
				</form>
			</div>
		</div>
		</div>		
	</div>
</div>
