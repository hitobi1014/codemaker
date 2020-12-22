<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(document).ready(function(){
	
	
	$("#keywords").keypress(function(key) {
		if (key.keyCode == 13) {
			var searchOption = $("select[name='searchOption']").val();
			var keyWord = $("input[name='keyWord']").val();
		
			document.location="/user/selectAllNotice?searchOption="+searchOption+"&keyWord="+keyWord+"&page=1";
			return false;
		}
	});
	
// 	document.addEventListener('keydown', function(event) {
// 		  if (event.keyCode == 13) {
// 		    event.preventDefault();
// 		  };
// 	}, true);
	
	
	$("#searchBtn").on("click", function(){
		
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
	
		document.location="/user/selectAllNotice?searchOption="+searchOption+"&keyWord="+keyWord+"&page=1";
		
	});
	
	$("#notice1").on("click", function(){
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
		document.location="/user/selectAllNotice?searchOption=1&keyWord="+keyWord+"&page=1";
	});
	
	$("#notice2").on("click", function(){
		var searchOption = $("select[name='searchOption']").val();
		var keyWord = $("input[name='keyWord']").val();
		document.location="/user/selectAllNotice?searchOption=2&keyWord="+keyWord+"&page=1";
	});
	
})
</script>
<style>
.card{
	width:1500px;
	height:700px;
	margin:auto;
	border: none;
}
h2{
	color : #1d25af;
	font-size: 2.0em;
	font-family: 'LotteMartDream';
	font-weight: 700;
}
#ff{
	margin: 50px 130px 0;
	background-color: white;
}
.pagination .page-item:first-child .page-link, .pagination .page-item:last-child .page-link
{
 height: 37px; 
}
@font-face {
  font-family: 'LotteMartDream';
  font-style: normal;
  font-weight: 300;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff');
}
div, li{
 font-family: 'LotteMartDream';
  font-weight: 500;
}
.table th{
font-family: 'LotteMartDream';
  font-weight: 700;
  font-size: 1.5em;
  text-align: center;
}
.table td{
font-family: 'LotteMartDream';
  font-weight: 500;
  font-size: 1.2em;
  text-align: center;
  line-height: 40px;
}
.table tr{
	border-top: 2px solid #bdbdbd;
    border-bottom: 2px solid #bdbdbd;
}
.card .table {
   margin-bottom: 70px;
}
.table-responsive {
	margin-left:10%; 
	margin-right:10%; 
	height:800px; 
	text-align:center;
	margin-top: 30px;
}
</style>

<div class="d-flex">
		<div class="table-responsive">
			<br>
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
			
			<div style="background-color:white;">
				    <hr>
				<div style="margin:auto; width:1000px;">
					<table class="table" >
						<tr style="text-align:center;">
							<th>공지사항 번호</th>
							<th>공지사항 제목</th>
							<th>공지사항 작성일</th>
							<th>작성자아이디</th>
						</tr>
						<tbody id="noticeList">
							<c:set var="num" value="${totalCnt - ((param.page-1)*10) }"/>
								<c:forEach items="${noticeList}" var="notice" >
									<c:if test="${notice.noticeOut == 'N'}">
										<tr>
											<td>${num}</td>
											<td style="text-align:left;"><a style="color : black; font-size : 20px;" href="${cp}/user/selectNotice?noticeId=${notice.noticeId}">${notice.noticeTitle}</a></td>
											<td><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd" /></td>
											<td>${notice.adminId}</td>
										</tr>
									</c:if>
									<c:set var="num" value="${num-1}"/>
								</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	
		<div class="text-center" >
			<ul class="pagination justify-content-center m-0">
				<c:choose>
					<c:when test="${param.page != 0 and param.page != 1 and param.page != null}">
					<fmt:parseNumber var="pg" value="${((page / 5 ) - 1 ) * 5 + 1}"/>
						<c:if test="${page > 5}">
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${pg}">이전</a></li>
						</c:if>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == param.page}">
							<li class="page-item active"><a class="page-link">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${param.page != pages && param.page != null}">
						<fmt:parseNumber var="pg" value="${((page / 5 ) + 1 ) * 5 + 1 }"/>
						<c:if test="${pages >= pg}">
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllNotice?searchOption=${param.searchOption}&keyWord=${param.keyWord}&page=${pg}">다음</a></li>
						</c:if>
					</c:when>
				</c:choose> 	
			</ul>
			<hr>
			<div>
		        <select name="searchOption">
		            <c:if test="${searchOption == '1' || searchOption == '' || searchOption == null}">
			            <option value="1" selected>공지사항</option>
			            <option value="2">자주묻는질문</option>
		            </c:if>
		            <c:if test="${searchOption == '2'}">
			            <option value="1">공지사항</option>
			            <option value="2" selected>자주묻는질문</option>
		            </c:if>
		        </select>
		        <input id="keywords" type="text" name="keyWord" value="${param.keyWord}" style="border : 1px solid black;">
		        <button id="searchBtn" type="button" class="btn btn-warning btn-sm">조회</button>
			</div>
		</div>
	</div>			
</div>
