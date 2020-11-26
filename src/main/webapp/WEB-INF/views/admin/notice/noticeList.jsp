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
})
</script>

</head>
<body>
	<form name="form1"  method="post" action="${cp}/admin/notice/selectAllNotice">
        <select name="searchOption">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="0" <c:out value="${map.searchOption == '0'?'selected':''}"/> >전체</option>
            <option value="1" <c:out value="${map.searchOption == '1'?'selected':''}"/> >이벤트</option>
            <option value="2" <c:out value="${map.searchOption == '2'?'selected':''}"/> >자주묻는질문</option>
            <option value="3" <c:out value="${map.searchOption == '3'?'selected':''}"/> >알림</option>
        </select>
        <input name="keyWord" value="${map.keyWord}">
        <input type="submit" value="조회">
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
						<td>${notice.notice_date}</td>
						<td>${notice.admin_id }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
	
	<div class="text-center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${page != 0 && page != 1}">
						  <li><a href="${cp}/admin/notice/selectAllNotice?page=${1}"><<</a></li>
						  <li><a href="${cp}/admin/notice/selectAllNotice?page=${page-1}"><</a></li>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == page}">
							<li class="active"><span>${i}</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="${cp}/admin/notice/selectAllNotice?page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${page != pages}">
						  <li><a href="${cp}/admin/notice/selectAllNotice?page=${page+1}">></a></li>
						  <li><a href="${cp}/admin/notice/selectAllNotice?page=${pages}">>></a></li>
					</c:when>
				</c:choose> 	
			</ul>
		</div>		
</body>
</html>

