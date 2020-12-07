<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/json/jquery.serialize-object.js"></script>
<style>
tr, td{
border:1px solid black;
}
</style>
<h1>장바구니 입니다</h1>
<table>
	<tr>
		<th>체크박스</th>
		<th>강의아이디</th>
		<th>강의명</th>
		<th>강사명</th>
		<th>수강기간</th>
		<th>금액</th>
	</tr>
	<c:url value="/user/payViewList" var="payViewList"/>
		<form id="frm" method="post" action="${payViewList}" >
			<c:forEach items="${lessonList}" var="lesson" varStatus="stat">
				<tr>
					<td><input type="checkbox" class="lesChk" id="chk[${stat.index}]"/></td>
					<td>
						<input type="text" value="${lesson.lesId}" id="lesId[${stat.index}]" name="lessonList[${stat.index}].lesId" readonly="readonly" disabled="disabled"/>
					</td>
					<td>
						<input type="text" value="${lesson.lesNm}" id="lesNm[${stat.index}]" name="lessonList[${stat.index}].lesNm" readonly="readonly" disabled="disabled"/>
					</td>
					<td>
						<input type="text" value="${lesson.tchNm}" id="tchNm[${stat.index}]" name="lessonList[${stat.index}].tchNm" readonly="readonly" disabled="disabled"/>
					</td>
					<td>
						<input type="text" value="${lesson.lesTerm}" id="lesTerm[${stat.index}]" name="lessonList[${stat.index}].lesTerm" readonly="readonly" disabled="disabled"/>
					</td>
					<td>
						<input type="text" value="${lesson.lesCash}" id="lesCash[${stat.index}]" name="lessonList[${stat.index}].lesCash" readonly="readonly" disabled="disabled"/>
					</td>
				</tr>
			</c:forEach>
		</form>
	<button id="sub">결제하기</button>
</table>
<script>
$(function(){
	$("#sub").on('click',function(){
// 		var lessonArr = new Array();
	
		$(".lesChk:checked").each(function(){
			var td = $(this).parent().parent().children();
			td.eq(1).children().attr('disabled',false);
			td.eq(2).children().attr('disabled',false);
			td.eq(3).children().attr('disabled',false);
			td.eq(4).children().attr('disabled',false);
			td.eq(5).children().attr('disabled',false);
			var lesId = td.eq(1).children().val();
			var lesNm = td.eq(2).children().val();
			var tchNm = td.eq(3).children().val();
			var lesTerm = td.eq(4).children().val();
			var lesCash = td.eq(5).children().val();
			console.log("아이디 : "+lesId + "이름 : "+lesNm+"강사 : "+tchNm + "수강기간 : "+lesTerm + "수강료 :"+lesCash);
// 			var lvo = td.children().serializeObject();
// 			lessonArr.push(lvo);
			$("#frm").submit();
		})
		
// 		console.log("lessonArr 값"+JSON.stringify(lessonArr));
// 		var jsonData = JSON.stringify(lessonArr);
// 		$.ajax({
// 			url : '<c:url value="/user/payView"/>',
// 			method : 'post',
// 			contentType : 'application/json; charset=utf-8',
// 			data : jsonData,
// 			dataType : 'html',
// 			success : function(res){
// 				location.href=res;
// 			},
// 			error : function(xhr){
// 				alert(xhr);
// 			}
// 		})
	})
})

</script>