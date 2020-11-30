<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	
		document.location="${cp}/teacherNotice/selectAllNotice?searchOption="+searchOption+"&keyWord="+keyWord;
		
	});
})
</script>

	<form name="form1"  method="post">
        <select name="searchOption">
            <c:if test="${searchOption == '0' || searchOption == '' || searchOption == null}">
	            <option value="0" selected="true">전체</option>
	            <option value="1">이벤트</option>
	            <option value="2">자주묻는질문</option>
	            <option value="3">알림</option>
            </c:if>
            <c:if test="${searchOption == '1'}">
	            <option value="0">전체</option>
	            <option value="1" selected="true">이벤트</option>
	            <option value="2">자주묻는질문</option>
	            <option value="3">알림</option>
            </c:if>
            <c:if test="${searchOption == '2'}">
	            <option value="0">전체</option>
	            <option value="1">이벤트</option>
	            <option value="2" selected="true">자주묻는질문</option>
	            <option value="3">알림</option>
            </c:if>
            <c:if test="${searchOption == '3'}">
	            <option value="0">전체</option>
	            <option value="1">이벤트</option>
	            <option value="2">자주묻는질문</option>
	            <option value="3" selected="true">알림</option>
            </c:if>
        </select>
        <input id="keywords" type="text" name="keyWord" value="${keyWord}">
        <input id="searchBtn" type="button" value="조회">
        
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
						<td><a href="${cp}/teacherNotice/selectNotice?notice_id=${notice.noticeId}">${notice.noticeTitle}</a></td>
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
					<c:when test="${page != 0 && page != 1}">
						  <li class="page-item"><a class="page-link" href="${cp}/teacherNotice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${1}"><i class="fas fa-angle-double-left"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/teacherNotice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${page-1}"><i class="fas fa-double-left"></i></a></li>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == page}">
							<li class="page-item active"><a class="page-link" href="${cp}/teacherNotice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/teacherNotice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${page != pages}">
						  <li class="page-item"><a class="page-link" href="${cp}/teacherNotice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${page+1}"><i class="fas fa-angle-double-right"></i></a></li>
						  <li class="page-item"><a class="page-link" href="${cp}/teacherNotice/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${pages}"><i class="fas fa-angle-right"></i></a></li>
					</c:when>
				</c:choose> 	
			</ul>
		</div>		

