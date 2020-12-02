<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
$(document).ready(function() {
       $('.summernote').summernote({
	        width : 500,
			height: 300,
	        lang: "ko-KR"
       });
       
       $('#fileAddBtn').on('click', function(){
	        $('#fileup').append("&nbsp;&nbsp;<input type='file' name='realfile' multiple='multiple'>")
	    })

    $(".del_file").on("click", function() {
        a = $(this).val();
        $('#fileup').append("<input type='hidden' name='del_files' value='"+a+"'>")
        
        $(this).parent().remove();

    })
})       
</script>
	<form id="frm" class="form-horizontal" method="POST" action="${cp}/admin/updateJobInfo" enctype="multipart/form-data">
		
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 제목</label>
			<div class="col-sm-10">
				<input type=text name="jobinfoTitle" style="width: 500px;"
					value="${jobinfoVo.jobinfoTitle}">
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 내용</label>
			<div class="col-sm-10">
				<textarea class="summernote" name="jobinfoCont">${jobinfoVo.jobinfoCont}</textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="jobinfoId" value="${jobinfoVo.jobinfoId}" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="jobinfoUwriter" value="${jobinfoVo.adminId}" />
			</div>
		</div>

		<label class="col-sm-2 control-label">첨부파일</label> 
		
		<c:if test="${filesList != null}">
			<c:forEach items="${filesList}" var="filesVo">
				<div class="form-group">
					<div id="${filesVo.filesId}">
						&emsp;&emsp;&emsp;&emsp;${filesVo.filesNm}
						<button class="del_file" type="button" class="btn btn-default" value="${filesVo.filesId}">삭제</button>
					</div>
				</div>
			</c:forEach>
		</c:if>
		
		<button type="button" id="fileAddBtn">파일추가</button>
		<br>
		<div class="col-sm-10" id="fileup" class="col-sm-10">
		</div>
		

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">취업공고 수정</button>
			</div>
		</div>
	</form>
