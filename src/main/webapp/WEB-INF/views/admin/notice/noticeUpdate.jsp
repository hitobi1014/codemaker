<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">


<script>
$(document).ready(function() {
	var count = 0;
	var del_count = 0;
       $('.summernote').summernote({
	        width : 700,
			height: 500,
	        lang: "ko-KR"
       });
       
       $('#fileAddBtn').on('click', function(){
    		var del = $('.del_file').length;
            if(del + count >= 5){
           	   alert("첨부파일은 5개까지 등록가능합니다");
               return;
            }
            count++;  
            $('#fileup').append("&nbsp;&nbsp;<input type='file' name='realfile' multiple='multiple'>")
            $('#count').val(count)
       })

    $(".del_file").on("click", function() {
        a = $(this).val();
        del_count++;
        $('#fileup').append("<input type='hidden' name='del_files' value='"+a+"'>")
        
        $('#del_count').val(del_count)
        $(this).parent().remove();
    })
    
     $('#updatebutton').on('click', function(){
    	var noticeTitle = $('input[name="noticeTitle"]').val();
    	var noticeCont = $('textarea[name="noticeCont"]').val();
    	
    	if(noticeTitle == '' || noticeTitle == null){
    		alert("제목을 입력하세요");
    		return;
    	} else if(noticeCont == '' || noticeCont == null){
    		alert("내용을 입력하세요");
    		return;
    	} else {
    		alert("게시글을 수정 하였습니다.")
    		$("#frm").submit();
    	}
    })
})       
</script>
<style>
	.card{
		width:800px;
		margin-left:150px;
	}
	h2{
		text-align:center;
		color : #1d25af;
	}
	#updatebutton{
		float:right;
	}
</style>
<div class="col-12" style="margin:50px;">
	<div class="card">	
		<h2>공지 사항 수정</h2>
		<form id="frm" class="form-horizontal" method="POST" action="${cp}/admin/updateNotice" enctype="multipart/form-data">
			<div class="col-sm-10">
			<label for="userNm" class="col-sm-2 control-label">분류</label>
				<select id="notice_head" name="noticeHead">
					<c:if test="${noticeVo.noticeHead == 1}">
						<option value="1" selected>공지사항</option>
						<option value="2">자주묻는질문</option>
					</c:if>
					<c:if test="${noticeVo.noticeHead == 2}">
						<option value="1">공지사항</option>
						<option value="2" selected>자주묻는질문</option>
					</c:if>
				</select>
			</div>


			<div class="col-sm-10">
			<label for="userNm" class="col-sm-2 control-label">제목</label>
				<input type=text name="noticeTitle" style="width: 500px;"
					value="${noticeVo.noticeTitle}">
			</div>

			<div class="col-sm-10">
			<label for="userNm" class="col-sm-2 control-label">내용</label>
				<textarea class="summernote" name="noticeCont">${noticeVo.noticeCont}</textarea>
			</div>
			
			<hr>
			<div class="col-sm-10">
				<label for="userNm" class="col-sm-2 control-label">첨부파일</label>
				<button type="button" id="updatebutton" class="btn btn-success">수정</button>
				<input type="button" id="fileAddBtn" value="파일추가">
				
				<div class="col-sm-10" id="fileup" class="col-sm-10">
					<c:if test="${filesList != null}">
						<c:forEach items="${filesList}" var="filesVo">
							<div class="form-group">
								<div id="${filesVo.filesId}">
									&emsp;&emsp;&emsp;&emsp;${filesVo.filesNm}
									<button class="del_file btn btn-danger" type="button" value="${filesVo.filesId}">삭제</button>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<br>
			<div class="col-sm-10" id="fileup" class="col-sm-10">
			</div>
			
			<input id="count" name="count" type="hidden" value="0">
			<input id="del_count" name="del_count" type="hidden" value="0">
			<input type="hidden" name="noticeUwriter" value="${USERID}">
			<input type="hidden" name="noticeId" value="${noticeVo.noticeId}">
		</form>
	</div>
</div>
