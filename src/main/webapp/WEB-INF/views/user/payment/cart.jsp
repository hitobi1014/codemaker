<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/json/jquery.serialize-object.js"></script>
<link href="/css/user/cart/user-cart.css" rel="stylesheet" />
<h1>장바구니 입니다</h1>
<div class="cartBoxArea">
	<table>
		<thead>
			<tr>
				<th><span><input type="checkbox" id="allChk" data-toggle="1" onclick="selectChk()"/></span></th>
				<th>강의명</th>
				<th>강사명</th>
				<th>수강기간</th>
				<th>금액</th>
			</tr>
		</thead>
		<c:url value="/user/payViewList" var="payViewList"/>
			<form id="frm" method="post" action="${payViewList}" name="frm">
				<input type="hidden" value="0" id="chkNum"/>
			<tbody id="tbody">
				<c:forEach items="${lessonList}" var="lesson" varStatus="stat">
					<input type="hidden" value="${lesson.lesTerm}" id="lesTerm[${stat.index}]" name="lessonList[${stat.index}].lesTerm" readonly="readonly" disabled="disabled"/>
					<c:set value="${lesson.lesTerm}" var="lesTerm"/>
					<%
						int lesTerm =(int)(pageContext.getAttribute("lesTerm")); 
						Date now = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
						Calendar cal = Calendar.getInstance();
						cal.setTime(now);
						cal.add(Calendar.DATE, lesTerm);
					%>
					<input type="hidden" value="${lesson.lesId}" id="lesId[${stat.index}]" name="lessonList[${stat.index}].lesId" readonly="readonly" disabled="disabled"/>
					<tr class="lessonTr">
						<td class="chk"><input type="checkbox" class="lesChk" id="chk[${stat.index}]" name="chk[${stat.index}]" onclick="chkBox()"></td>
						<td>
							<input type="text" value="${lesson.lesNm}" id="lesNm[${stat.index}]" name="lessonList[${stat.index}].lesNm" readonly="readonly" disabled="disabled"/>
						</td>
						<td class="tdLine tdCenter">
							<input type="text" value="${lesson.tchNm}" id="tchNm[${stat.index}]" name="lessonList[${stat.index}].tchNm" readonly="readonly" disabled="disabled"/>
						</td>
						<td class="tdLine tdCenter">
								<%= sdf.format(now) %> ~ <%= sdf.format(cal.getTime()) %>
						</td>
						<td class="tdCenter">
							<input type="text" value="${lesson.lesCash}" id="lesCash[${stat.index}]" name="lessonList[${stat.index}].lesCash" readonly="readonly" disabled="disabled"/>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</form>
		<button id="sub">결제하기</button>
	</table>
</div>
<script>
$(function(){
	var length = $(".lesChk").length;
	$("#sub").on('click',function(){
		for(i=0; i<length; i++){
			$("#chk\\["+i+"\\]:checked").each(function(){
				$("#lesId\\["+i+"\\]").attr('disabled',false);
				$("#lesTerm\\["+i+"\\]").attr('disabled',false);
				$("#lesNm\\["+i+"\\]").attr('disabled',false);
				$("#tchNm\\["+i+"\\]").attr('disabled',false);
				$("#lesCash\\["+i+"\\]").attr('disabled',false);
			})
		}
		$("#frm").submit();
	})
	
	var cnt = 0;
// 	$(".lesChk").on('click',function(){
// 		chkBox(length);
// 	})
	
})
function chkBox(){
	var length = $(".lesChk").length;
	var count = $('.lesChk:checked').length;
	
	if($(this).prop('checked')==true){
		$(this).prop("checked", false);
	}else if($(this).prop('checked') == false){
		$(this).prop("checked", true);
	}
	
	
	if(count == length){
		$("#allChk").prop("checked", true);
	}else{
		$("#allChk").prop("checked", false);
	}
}


function selectChk(){
	
	
	if($("#allChk").is(":checked")==true){
		$("input[type='checkbox']").prop("checked", true);
// 		for(i=0; i<length;i++){
// 			$("#chk\\["+i+"\\]").attr('checked',true);
// 			alert("아이값 트루 : "+i)
// 		}
	}else if($("#allChk").is(":checked")==false){
		$("input[type='checkbox']").prop("checked", false);
// 		for(i=0; i<length;i++){
// 			$("#chk\\["+i+"\\]").attr('checked',false);
// 			alert("아이값 해제: "+i)
// 		}
	}
	

}

</script>