<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<script>
	$(function(){
		$("input[id^='checkBlack']").on("click", function(){
			var userid = $(this).parents('tr').data("userid");
			document.location="/admin/insertBlackList?userId="+userid;
		})
		
		$("#complains").on('click', function(){
			document.location="/admin/selectAllComplain";
		})
		
		$("#blacklist").on('click', function(){
			document.location="/admin/selectBlackList";
		})
			
	})

</script>
<style>
	.table-responsive{
		text-align : center;
	}

</style>

<body>
<div class="table-responsive">
	<button type="button" class="btn btn-warning" id="complains" name="complains">신고내역</button>
	<button type="button" class="btn btn-primary" id="blacklist" name="blacklist">블랙리스트</button>
		<table class="table">
			<tr>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>블랙리스트여부</th>
				<th>신고누적횟수</th>
				<th></th>
			</tr>
			<tbody id="complainList">
				<c:forEach items="${blacklist}" var="black">
					<tr data-userid="${black.userId}">	
						<td>${black.userId}</td>
						<td>${black.userNm}</td>
						<td>${black.userBlack}</td>
						<td>${black.count}</td>
						<c:if test="${black.userBlack != 'Y'}">
							<td><input type="button" id="checkBlack" value="블랙리스트 추가"></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
</body>
