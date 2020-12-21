<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<style>
.paycontainer{
	background-color: white;
}
.paybox{
	background-color:#005F86;
    width: 450px;
    height: 50px;
}
p {
    color: white;
    font-size: 23px;
    font-weight: 600;
    text-align: center;
    padding: 5px;
}
.listbox{
	background-color: #e1e4e833;
    border: 1px solid #cbcdd2;
    height: 500px;
    margin: 28px 15px 0px 15px;
}
.title{
	background-color: #232356;
	text-align: center;
	color: white;
}
</style>
<body>
<div class="paycontainer">
<div class="paybox">
	<p>강의 환불</p>
	</div>
	<div class="listbox">
	
	<table>
		<tbody id="mypayVo">
				<tr>
					<td class="title">결제ID</td>
					<td>${mypayVo.payId }</td>
				</tr>
				<tr>
					<td class="title">강의명</td>
					<td>${mypayVo.lesNm }</td>
				</tr>
				<tr>
					<td class="title">결제일</td>
					<td><fmt:formatNumber value="${mypayVo.paySum }"></fmt:formatNumber></td>
				</tr>
				<tr>
					<td class="title">결제방식</td>
					<td>${mypayVo.payWay }</td>
				</tr>
				<tr>
					<td class="title">결제금액</td>
					<td>${mypayVo.paySum }</td>
				</tr>
		</tbody>
	</table>
	</div>
</div>


</body> 