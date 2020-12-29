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
		document.location="/user/selectAllQna?lesId=${qnaVo.lesId}";
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
		var str = "";
		count++
		if(count == 1){
			str += "<form id='rreplyInsert' method='POST' action='/user/insertrReply'>"
			str += "<li>";
			str += "<hr>";
			str += "	<div class='CommentWriter'>";
			str += "		<div class='comment_inbox'>";
			str += "			<span>작성자 : ${MEMBER_INFO.userId}</span>";
			str += "			<textarea class='comment_inbox_text' id='replyCont' name='rreplyCont' placeholder='댓글을 입력해주세요'></textarea>";
			str += "		</div>";
			str += "		<div class='comment_attach'>";
			str += "			<div>";
			str += "				<button style='float:right; color:#b7b7b7;' id='rreplybutton' class='button btn_register'>등록</button>";
			str += "			</div>";
			str += "		</div>";
			str += "	</div>";
			str += "</li>";
			str += "<input type='hidden' name='root' value='"+ root +"'>";
			str += "<input type='hidden' name='qnaId' value='${qnaVo.qnaId}'>";
			str += "<input type='hidden' name='replyWriter' value='${MEMBER_INFO.userId}'>";
			str += "</form>";
			
			$(this).closest('li').after(str);
			
		}else if(count == 2){
			count = 0;
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
	
	
	$("button[id='rreplybutton']").on('click', function(){
		if(confirm("등록하시겠습니까?")){
			$("#rreplyInsert").submit();
			return;
		}else{
			return;
		}
	})
	
    $("#qnaComplain").on("click", function(){
        var url = "/user/insertComplain?qnaId=${qnaVo.qnaId}&defendant=${qnaVo.userId}";
        var option = "width = 600, height = 300, top = 300, left = 200, location = no";
        window.open(url, "신고내역", option);
    })
    
    
    $("button[id^=replyComplain]").on("click", function(){
        var replyId = $(this).val();
        var find = $(this).parents('div.condiv').children('div.condiv:eq(0)').children('#defendant').text();
        var url = "/user/insertComplain?replyId="+replyId+"&defendant="+find;
        var option = "width = 600, height = 300, top = 300, left = 200, location = no";
        window.open(url, "신고내역", option);
    })
    
	
});

</script>
<style>
	.card{
		width: 60%;
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
		font-size: 35px;
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
	label{
		text-transform: none;
	}
	p{
		line-height: 2.5;
		margin-bottom: 0;
	}
</style>
	<div class="card">
			
			<div class="titleDiv">
				<h2 id="title">${qnaVo.qnaTitle}</h2>
				<button type="button" id="listbutton" style="float:right;" class="btn btn-primary">목록</button>
				<c:if test="${qnaVo.userId != MEMBER_INFO.userId}">
					<button type="button" id="qnaComplain" style="float:right;" class="btn btn-primary" value="${qnaVo.qnaId}">신고</button>
				</c:if>
			</div>
			
			<div>
				<label class="control-label">&nbsp;&nbsp;&nbsp;${qnaVo.qnaId}</label>
				<label style="float:right;" class="control-label">작성자 : ${qnaVo.userId}</label>
				<br>
				<label style="float:right;" class="control-label">작성날짜 : <fmt:formatDate value="${qnaVo.qnaDate}" pattern="yyyy-MM-dd" /></label>
				<hr>
			</div>

			<br>
			<div style="margin:30px; text-align:center;">
				<label class="control-label" style="font-size:20px; width:800px; text-align:left;">${qnaVo.qnaCont}</label>
			</div>
			<hr>
			<div>
			
			<div>
				<h3 style="color:rgb(0,95,134);">댓글</h3>
			</div>
			<br>
				<div>
					<ul id="ultag">
						<c:forEach var="reply" items="${replyList}">
							<li class="contents">
							<hr>
								<div style="margin-left:${60*reply.replylevel}px;" class="condiv">
									<div class="condiv" style="margin-bottom:10px;">
										<span style="font-size:1.3em; font-weight:800" id="defendant">${reply.replyWriter}</span>
										<span style="font-size:0.9em; font-weight:300; color:gray;"><fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd HH:mm"/></span>
									</div>
									<div class="condiv">
										<div class="condiv">
											<p style="float:left; margin-left:30px;">${reply.replyCont}</p>
										</div>
									</div>
									<div class="condiv">
										<br>
										<c:if test="${reply.replyOut != 'Y'}">
											<c:choose>
												<c:when test="${reply.replyWriter != MEMBER_INFO.userId}">
													<button id="rreply" type="button" name="rreplyRoot" value="${reply.replyId}">답글</button>
													<button id="replyComplain" type="button" name="replyComplain" value="${reply.replyId}">신고</button>
												</c:when>
												<c:otherwise>
													<form id="delre" action="/user/deleteReply">
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
			
			
			<hr>
			<form id="inre" action="/user/insertReply" method="POST">	
				<input type="hidden" name="replyWriter" value="${MEMBER_INFO.userId}">
				<input type="hidden" name="qnaId" value="${qnaVo.qnaId}">
				<input type="hidden" name="quserId" value="${qnaVo.userId}">
				<input type="hidden" name="replyRoot" value="">
				<div class="CommentWriter">
					<div class="comment_inbox">
						<span>작성자 : ${MEMBER_INFO.userId}</span>
						<textarea class="comment_inbox_text" id="replyCont" name="replyCont" placeholder="댓글을 입력해주세요"></textarea>
					</div>
					<div class="comment_attach">
						<div>
							<button style="float:right; color:#b7b7b7;" type="button" id="insertbutton" class="button btn_register">등록</button>
						</div>
					</div>
				</div>
			</form>
			<hr>
			
		</div>
	</div>
</div>