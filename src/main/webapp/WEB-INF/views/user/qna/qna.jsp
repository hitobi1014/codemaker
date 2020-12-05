<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<script>
$(document).ready(function(){
	var count = 0;
	$("#delbutton").on("click", function(){
		document.location="${cp}/user/deleteQna?lesId=${qnaVo.lesId}&qnaId=${qnaVo.qnaId}";
	});
	
	$("#listbutton").on("click", function(){
		document.location="${cp}/user/selectAllQna?lesId=${qnaVo.lesId}";
	})
	
	$("#insertbutton").on("click", function(){
		if($("textarea[name='replyCont']").val() == null || $("textarea[name='replyCont']").val() == ''){
			alert("내용을 입력해주세요");
			return;
		}else{
			$('#inre').submit();
		}
	})
	
	$("button[id^=rreply]").on('click', function(){
		var root = $(this).val();
		count++
		if(count < 2){
			$('#treply').append("<input type='text' style='border:1px black solid; resize:none; width:400px; margin-left:500px;' name='rreplyCont'>");
			$('#treply').append("<button type='button' id='rreplybutton' onclick='rreinsert()'>댓글작성</button>");
			$('#treply').append("<input type='hidden' name='root' value='"+ root +"'>");
			$('#treply').append("<input type='hidden' name='qnaId' value='${qnaVo.qnaId}'>");
			$('#treply').append("<input type='hidden' name='replyWriter' value='${USERID}'>");
		}
	});
	
	$("button[id^=delbutton]").on('click', function(){
		var but = $(this).val();
		if(confirm("삭제하시겠습니까?")){
			$('#delre').append("<input type='hidden' name='replyId' value='"+but+"'>")
			$('#delre').submit();
		}else{
			return;
		}
	})
	
	rreinsert = function(){
		$('#rrein').submit();
	}
});

</script>
<style>
	.card{
		width:1000px;
		margin:auto;
		background-color : #F8FFFF;
	}
	h2{
		color : #1d25af;
	}
	.row{
		margin: 50px 130px 0;
		background-color: white;
		margin-bottom:30px;
	}
</style>
<div class="row shadow" >
	<div class="col-12" style="margin:50px;">
		<div class="card" style=" height:500px;">
			<div style="text-align:center;">
			<div>
				<button type="button" id="listbutton" class="btn btn-primary" style="float:left;">목록</button>			
			</div>
				<h2>${qnaVo.qnaTitle}</h2>
				<hr>
			</div>
			
			<div>
				<label class="control-label">&nbsp;&nbsp;&nbsp;${qnaVo.qnaId}</label>
				<label style="float:right;" class="control-label">작성자 : ${qnaVo.userId}</label>
				<br>
				<label style="float:right;" class="control-label">작성날짜 : <fmt:formatDate value="${qnaVo.qnaDate}" pattern="yyyy-MM-dd" /></label>
				<hr>
			</div>

			<br>
			<div style="margin:30px;">
				<label class="control-label">${qnaVo.qnaCont}</label>
			</div>
			<div>
				<c:if test="${qnaVo.userId == USERID}">
					<button type=button id="delbutton">삭제</button>				
				</c:if>
			</div>
			<hr>
			<div>
			<h3 style="color:red">Reply</h3>
			<br>
				<table style="text-align:left; width:1000px;">
					<tr style="padding-left:50px;">
						<th style="padding-left:50px;">댓글 번호</th>
						<th>내용</th>
						<th>작성 날짜</th>
						<th>작성자</th>
					</tr>
					<tbody>
						<c:forEach var="reply" items="${replyList}">
							<tr style="padding-left:50px;">	
								<td style="padding-left:50px;">${reply.replyId}</td> 
								<td>${reply.replyCont}</td>
								<td><fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd"/></td>
								<td>${reply.replyWriter}</td>
								<c:if test="${reply.replyOut != 'Y'}">
									<c:choose>
										<c:when test="${reply.replyWriter != USERID}">
											<td><button id="rreply" type="button" name="rreplyRoot" value="${reply.replyId}">답글</button></td>
										</c:when>
										<c:otherwise>
										<td>
											<form id="delre" action="${cp}/user/deleteReply">
												<input type="hidden" value="${qnaVo.qnaId}" name="qnaId">
												<button type="button" id="delbutton" value="${reply.replyId}">삭제</button>
											</form>
										</td>
										</c:otherwise>
									</c:choose>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>	
			</div>
			
			<form id="rrein" action="${cp}/user/insertrReply" method="post">
				<div id="treply">
					
				</div>
			</form>
			
			<br>
			<form id="inre" action="${cp}/user/insertReply" method="POST">	
				<input type="hidden" name="replyWriter" value="${USERID}">
				<input type="hidden" name="qnaId" value="${qnaVo.qnaId}">
				<input type="hidden" name="replyRoot" value="">
				<div>
					<textarea style="border:1px black solid; resize:none; width:400px; margin-left:500px;" name="replyCont"></textarea>
				</div>
			</form>
			<div>
				<button type="button" id="listbutton" class="btn btn-primary">목록</button>
				<button type="button" id="insertbutton" class="btn btn-success">댓글작성</button>
			</div>
		</div>
	</div>
</div>