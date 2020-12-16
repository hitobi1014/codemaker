<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

<script>
	$(function(){
		$("button[name^=detail]").on("click", function(){
			var cpId = $(this).parents('tr').data("cpid");
			
			var url = "${cp}/admin/selectComplain?cpId="+cpId;
			var option = "width = 1000, height = 1000, top = 100, left = 200, location = no"
			window.open(url, "신고내역", option);
		})
		
		$("#complains").on('click', function(){
			document.location="${cp}/admin/selectAllComplain";
		})
		
		$("#blacklist").on('click', function(){
			document.location="${cp}/admin/selectBlackList";
		})
			
	})

</script>
<style>
	.table-responsive{
		text-align : center;
	}
.card{
	width:1500px;
	height:700px;
	margin:auto;
	border: none;
}
h2{
	color : #1d25af;
	font-size: 2.0em;
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
#banner{
	margin: 20px;
}
</style>

<body>
<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12">
		<div class="card">
		<div id="banner">
		<h2>CodeMaker 신고내역</h2>
			<div style="text-align:center;">
				<button type="button" class="btn btn-warning" id="complains" name="complains">신고내역</button>
				<button type="button" class="btn btn-primary" id="blacklist" name="blacklist">블랙리스트</button>
			</div>
		</div>
		<table class="table">
			<tr>
				<th>신고 아이디</th>
				<th>신고 내용</th>
				<th>신고일</th>
				<th>신고확인</th>
				<th></th>
			</tr>
			<tbody id="complainList">
				<c:forEach items="${complainList}" var="complain">
					<tr data-cpid="${complain.cpId}">	
						<td>${complain.cpId}</td>
						<td style="text-align:left;">${complain.cpCont}</td>
						<td><fmt:formatDate value="${complain.cpDate}" pattern="yyyy-MM-dd" /></td>
						<td>${complain.cpState}</td>
						<td><button type="button" name="detail" id="detail">상세보기</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
	</div>
	</div>
</div>
</body>
