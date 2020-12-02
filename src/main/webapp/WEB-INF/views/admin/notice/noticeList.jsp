<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<title>Insert title here</title>
<script>
$(document).ready(function(){
		
	$("#btnWrite").on("click", function(){
		document.location="${cp}/admin/insertNotice";
	});
	
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	}, true);
	
	
	$("#searchBtn").on("click", function(){
		
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
	
		document.location="${cp}/admin/selectAllNotice?searchOption="+searchOption+"&keyWord="+keyWord;
		
	});
})
</script>

</head>
<body>
<div style="color:black">
	<form name="form1" method="post">
		<select name="searchOption">
			<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
			<c:if test="${param.searchOption == 1}">
				<option value="1" selected>공지사항</option>
				<option value="2">자주묻는질문</option>
			</c:if>
			<c:if test="${param.searchOption == 2}">
				<option value="1">공지사항</option>
				<option value="2" selected>자주묻는질문</option>
			</c:if>
		</select> 
		<input type="text" name="keyWord" value="${param.keyWord}"><input id="searchBtn"type="button" class="btn btn-warning btn-sm" value="조회">
		<button type="button" id="btnWrite" class="btn btn-info btn-sm">공지 작성</button>
	</form>



	<div class="table-responsive">
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
						<td><a href="${cp}/admin/selectNotice?noticeId=${notice.noticeId}">${notice.noticeTitle}</a></td>
						<td><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd" /></td>
						<td>${notice.adminId}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="text-center">
		<ul class="pagination justify-content-center m-0">
			<c:choose>
				<c:when test="${param.page != 0 && param.page != 1}">
					<li class="page-item"><a class="page-link"
						href="${cp}/admin/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${1}"><i
							class="fas fa-angle-double-left"></i></a></li>
					<li class="page-item"><a class="page-link"
						href="${cp}/admin/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${page-1}"><i
							class="fas fa-double-left"></i></a></li>
				</c:when>
			</c:choose>
		
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == param.page || param.page == null || param.page == ''}">
							<li class="page-item active"><a class="page-link" href="${cp}/admin/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/admin/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${param.page != pages && param.page != null}">
						  <li class="page-item"><a class="page-link" href="${cp}/admin/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${page+1}"><i class="fas fa-angle-double-right"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/admin/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${pages}"><i class="fas fa-angle-right"></i></a></li>
					</c:when>
				</c:choose> 	
			</ul>
		</div>		
</div>
