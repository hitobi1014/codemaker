<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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
<<<<<<< HEAD
	<form id="insertNotice" enctype="multipart/form-data" class="form-horizontal" method="POST" action="${cp}/adminNotice/insertNotice">
	
=======
	<form id="insertNotice" enctype="multipart/form-data"
		class="form-horizontal" method="POST"
		action="${cp}/admin/notice/insertNotice">

>>>>>>> VO수정
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 타이틀</label>
			<div class="col-sm-10">
				<select id="notice_head" name="notice_head">
					<option value="1">이벤트</option>
					<option value="2">자주묻는질문</option>
					<option value="3">알림</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 제목</label>
			<div class="col-sm-10">
				<input type="text" name="notice_title" style="width: 500px;">
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 내용</label>
			<div class="col-sm-10">
				<textarea class="summernote" name="notice_cont"></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">첨부파일</label>
			<button type="button" id="fileAddBtn">파일추가</button>
			<br>
			<div class="col-sm-10" id="fileup" class="col-sm-10"></div>
		</div>

		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="admin_id" value="999" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="notice_id" value="1332" />
			</div>
		</div>

<<<<<<< HEAD
=======


>>>>>>> VO수정
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" id="insertbutton" class="btn btn-default">게시글등록</button>
			</div>
		</div>
	</form>
</body>
</html>