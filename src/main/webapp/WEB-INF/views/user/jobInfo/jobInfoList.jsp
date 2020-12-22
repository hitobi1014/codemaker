<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 취업공고</title>

<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

<script>
$(document).ready(function(){
		
	$("#keywords").keypress(function(key) {
		if (key.keyCode == 13) {
			var searchOption = $("select[name='searchOption']").val();
			var keyWord = $("input[name='keyWord']").val();
				
			document.location="/user/selectAllJobInfo?&keyWord="+keyWord+"&page=1";
			return false;
		}
	});
	
	$("#searchBtn").on("click", function(){
		
		var keyWord = $("input[name='keyWord']").val();
	
		document.location="/user/selectAllJobInfo?keyWord="+keyWord+"&page=1";
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
			<h2>CodeMaker 취업 공고</h2>
			<div style="background-color:white;" >
				    <hr>
				<div style="margin:auto; width:1000px;">
					<table class="table">
						<tr>
							<th>취업공고 번호</th>
							<th>취업공고 제목</th>
							<th>취업공고 작성일</th>
							<th>작성자아이디</th>
						</tr>
						<tbody id="jobinfoList">
							<c:set var="num" value="${totalCnt - ((param.page-1)*10) }"/>
							<c:forEach items="${jobinfoList}" var="jobinfo">
								<c:if test="${jobinfo.jobinfoOut == 'N'}">
									<tr>
										<td>${num}</td>
										<td style="text-align:left;"><a style="color : black; font-size : 20px;" href="${cp}/user/selectJobInfo?jobinfoId=${jobinfo.jobinfoId}">${jobinfo.jobinfoTitle}</a></td>
										<td><fmt:formatDate value="${jobinfo.jobinfoDate}" pattern="yyyy-MM-dd" /></td>
										<td>${jobinfo.adminId}</td>
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
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllJobInfo?keyWord=${param.keyWord}&page=${1}">이전</a></li>
						</c:if>
					</c:when>
				</c:choose>
				
				<c:forEach var="i" begin="1" end="${pages}">
					<c:choose>
						<c:when test="${i == param.page}">
							<li class="page-item active"><a class="page-link">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${cp}/user/selectAllJobInfo?keyWord=${param.keyWord}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				
				<c:choose>
					<c:when test="${param.page != pages && param.page != null}">
						<fmt:parseNumber var="pg" value="${((page / 5 ) + 1 ) * 5 + 1 }"/>
						<c:if test="${pages >= pg}">
						  <li class="page-item"><a class="page-link" href="${cp}/user/selectAllJobInfo?keyWord=${param.keyWord}&page=${pages}">다음</a></li>
						</c:if>
					</c:when>
				</c:choose> 	
			</ul>
			<hr>
			<div>
		        <span>검색&nbsp;</span><input type="text" id="keywords" name="keyWord" value="${param.keyWord}" style="border : 1px solid black;">
		        <button id="searchBtn" type="button" class="btn btn-warning btn-sm">조회</button>
			</div>
		</div>
	</div>			
</div>