<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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

</style>

<body>
<div id="top">
	<div class="table-responsive">
	<button type="button" class="btn btn-warning" id="complains" name="complains">신고내역</button>
	<button type="button" class="btn btn-primary" id="blacklist" name="blacklist">블랙리스트</button>
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
</body>
