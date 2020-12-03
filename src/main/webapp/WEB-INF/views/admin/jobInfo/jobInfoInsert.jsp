<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>

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
	
})       
</script>

</head>
<body>
	<form id="insertJobInfo" enctype="multipart/form-data" class="form-horizontal" method="POST" action="${cp}/admin/insertJobInfo">
	
	
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">취업공고 제목</label>
			<div class="col-sm-10">
				<input type="text" name="jobinfoTitle" style="width: 500px;">
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">취업공고 내용</label>
			<div class="col-sm-10">
				<textarea class="summernote" name="jobinfoCont"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">첨부파일</label>
			<button type="button" id="fileAddBtn">파일추가</button>
			<br>
			<div class="col-sm-10" id="fileup" class="col-sm-10">
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="adminId" value="S_MEMBER" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="jobinfoId" value="" />
			</div>
		</div>

		

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" id="insertbutton" class="btn btn-default">취업공고 등록</button>
			</div>
		</div>
	</form>
</body>
</html>