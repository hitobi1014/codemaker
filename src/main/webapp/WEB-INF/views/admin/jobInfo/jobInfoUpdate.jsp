<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>Insert title here</title>
</head>
<body>
	<form id="frm" class="form-horizontal" method="POST" action="${cp}/admin/jobInfo/jobInfoNotice" enctype="multipart/form-data">
		
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 제목</label>
			<div class="col-sm-10">
				<input type=text name="job_title" style="width: 500px;"
					value="${jobInfoVo.job_title}">
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 내용</label>
			<div class="col-sm-10">
				<textarea class="summernote" name="job_cont">${jobInfoVo.job_cont}</textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="job_date" value="${jobInfoVo.job_date}" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="job_out" value="${jobInfoVo.job_out}" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="admin_id" value="${jobInfoVo.admin_id}" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="job_id" value="${jobInfoVo.job_id}" />
			</div>
		</div>

		<label class="col-sm-2 control-label">첨부파일</label> 
		<br>
		<br>

		<c:forEach items="${filesVo}" var="filesVo">
			<div class="form-group">
				<div id="${filesVo.files_id}">
					&emsp;&emsp;&emsp;&emsp;${filesVo.files_nm}
					<button class="del_file" type="button" class="btn btn-default" value="${filesVo.files_id}">삭제</button>
				</div>
			</div>
		</c:forEach>

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
</body>
</html>