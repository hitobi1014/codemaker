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
		
		document.location="${cp}/admin/notice/selectAllNotice?searchOption="+searchOption+"&keyWord="+keyWord;
	});
})
</script>

</head>
<body>
	<form name="form1"  method="post">
        <select name="searchOption">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="0">전체</option>
            <option value="1">이벤트</option>
            <option value="2">자주묻는질문</option>
            <option value="3">알림</option>
        </select>
        <input type="text" name="keyWord" >
        <input id="searchBtn" type="button" value="조회">
        <button type="button" id="btnWrite">글쓰기</button>
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
						<td>${notice.notice_id}</td>
						<td><a href="${cp}/admin/notice/selectNotice?notice_id=${notice.notice_id}">${notice.notice_title}</a></td>
						<td><fmt:formatDate value="${notice.notice_date}" pattern="yyyy-MM-dd" /></td>
						<td>${notice.admin_id }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
	
	<div class="text-center">
			<ul class="pagination justify-content-center m-0">
				<c:choose>
					<c:when test="${page != 0 && page != 1}">
						  <li class="page-item"><a class="page-link" href="${cp}/admin/notice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${1}"><i class="fas fa-angle-double-left"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/admin/notice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${page-1}"><i class="fas fa-double-left"></i></a></li>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == page}">
							<li class="page-item active"><a class="page-link" href="${cp}/admin/notice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/admin/notice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${page != pages}">
						  <li class="page-item"><a class="page-link" href="${cp}/admin/notice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${page+1}"><i class="fas fa-angle-double-right"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/admin/notice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${pages}"><i class="fas fa-angle-right"></i></a></li>
					</c:when>
				</c:choose> 	
			</ul>
		</div>		
</body>
</html>

