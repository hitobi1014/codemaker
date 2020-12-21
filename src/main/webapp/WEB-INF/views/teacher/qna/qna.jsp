<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<title>질의응답</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">
<script>
$(document).ready(function(){
	var count = 0;
	$("#listbutton").on("click", function(){
		document.location="/teacher/selectAllQna";
	});
	
	$("#insertbutton").on("click", function(){
		if($("#replyCont").val() == null || $("#replyCont").val() == ''){
			alert("내용을 입력해주세요");
			return;
		}else{
			if(confirm("작성하시겠습니까?")){
				$('#inre').submit();
				return;
			}else{
				return;
			}
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
			$('#treply').append("<input type='hidden' name='replyWriter' value='${S_TEACHER.tchId}'>");
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
	
	$("button[id^=report]").on('click', function(){	
		if(confirm("신고하시겠습니까?")){
			return;
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
		width: 80%;
	    height: auto;
	    margin: 20px auto 0;
	    border: none;
	    padding: 40px;
	}
	.titleDiv{
		text-align:center;
		margin:20px;
	}
	#title{
		color : #1d25af;
		font-weight: 600;
		font-family: 'LotteMartDream';
		font-size: 35px
	}
	.row{
		margin: 50px 130px 0;
		background-color: white;
	}
	.btnClass{
		float:right;
		width: 80px;
		margin-right: 10px;
	}
	.header{
		float: right;
	}
	.headerId{
		width: 100%;
		text-align: right;
		font-size: 20px;
    	font-weight: 600;
	}
	.headerDate{
		width: 100%;
		text-align: right;
		color: #a9a8a8;
   		font-size: 17px;
    	font-weight: 400;
    	margin-top: -10px;
	}
	#idImg{
		width: 20px;
	}
	.contentDiv{
		margin: 30px;
	    border: 2px solid #c1bebe;
	    height: 350px;
	    padding: 20px;
	    font-size: 18px;
    	font-weight: 500;
	}
	#listbutton{
		width: 80px;
   		margin-left: 30px;
	}
	.btnDiv{
		margin-right: 19px;
	}
	.contents{
		min-height:100px;
	}
	.condiv {
		height : 20px;
	}
	.CommentWriter{
		margin: 12px 0 29px;
	    padding: 16px 10px 10px 18px;
	    border: 2px solid #6f63631a;
	    border-radius: 6px;
	    box-sizing: border-box;
	    background-color: #fdfcfc;
	    height: 125px;
	    width: 820px;
	    margin-left:auto;
	    margin-right:auto;
	}
	.CommentWriter .comment_inbox_text {
	    display: block;
	    width: 100%;
	    min-height: 17px;
	    padding-right: 1px;
	    border: 0;
	    font-size: 18px;
	    resize: none;
	    box-sizing: border-box;
	    background: transparent;
	    color: var(--skinTextColor);
	    outline: 0;
	}
	.CommentWriter .register_box .button {
	    display: inline-block;
	    min-width: 46px;
	    height: 34px;
	    line-height: 36px;
	    font-size: 13px;
	    color: var(--skinCommentWriterText);
	    border-radius: 6px;
	    box-sizing: border-box;
	    font-weight: 700;
	    text-align: center;
	    vertical-align: top;
	}
	
</style>
	<div class="card">
			
			<div class="titleDiv">
				<h2 id="title">${qnaVo.qnaTitle}</h2>
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
			<hr>
			<div>
			<h3 style="color:rgb(0,95,134);">댓글</h3>
			<br>
				<div>
					<ul>
						<c:forEach var="reply" items="${replyList}">
							<li class="contents">
							<hr>
								<c:choose>
									<c:when test="${reply.replyRoot != null}">
										<div style="margin-left:60px;" class="condiv">	
											<div class="condiv" style="margin-bottom:10px;">
												<span style="font-size:1.3em; font-weight:800">${reply.replyWriter}</span>
												<span style="font-size:0.9em; font-weight:300; color:gray;"><fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd HH:mm"/></span>
											</div>
									</c:when>
									<c:otherwise>
										<div style="margin-left:20px;" class="condiv">	
											<div class="condiv" style="margin-bottom:10px;">
												<span style="font-size:1.3em; font-weight:800">${reply.replyWriter}</span>
												<span style="font-size:0.9em; font-weight:300; color:gray;"><fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd HH:mm"/></span>
											</div>
									</c:otherwise>
								</c:choose>
									<div class="condiv">
										<div class="condiv">
											<p style="float:left; margin-left:30px;">${reply.replyCont}</p>
										</div>
									</div>
									<div class="condiv">
										<br>
										<c:if test="${reply.replyOut != 'Y'}">
											<c:choose>
												<c:when test="${reply.replyWriter != S_TEACHER.tchId}">
													<button id="rreply" type="button" name="rreplyRoot" value="${reply.replyId}">답글</button>
													<button id="report" type="button" name="report" value="${reply.replyId}">신고</button>
												</c:when>
												<c:otherwise>
													<form id="delre" action="/teacher/deleteReply">
														<input type="hidden" value="${qnaVo.qnaId}" name="qnaId">
														<button type="button" id="delbutton" value="${reply.replyId}">삭제</button>
													</form>
												</c:otherwise>
											</c:choose>
											
										</c:if>	
										
									</div>
								</div>
								
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<form id="rrein" action="/teacher/insertrReply" method="post">
				<div id="treply">
					
				</div>
			</form>
			
			<hr>
			<form id="inre" action="/teacher/insertReply" method="POST">	
				<input type="hidden" name="replyWriter" value="${S_TEACHER.tchId}">
				<input type="hidden" name="qnaId" value="${qnaVo.qnaId}">
				<input type="hidden" name="replyRoot" value="">
				<div class="CommentWriter">
					<div class="comment_inbox">
						<span>작성자 : ${S_TEACHER.tchId}</span>
						<textarea class="comment_inbox_text" id="replyCont" name="replyCont" placeholder="댓글을 입력해주세요"></textarea>
					</div>
					<div class="comment_attach">
						<div>
							<button style="float:right; color:#b7b7b7;" class="button btn_register">등록</button>
						</div>
					</div>
				</div>
			</form>
			<hr>
			<div>
				<button type="button" id="listbutton" class="btn btn-primary">목록</button>
			</div>
		</div>
	</div>
</div>