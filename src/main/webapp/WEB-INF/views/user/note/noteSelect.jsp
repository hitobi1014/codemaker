<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!-- include libraries(jQuery, bootstrap) --> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js--> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		$('#noteList tr').on('click', function() {
			// data-userid : data("속성명")
			console.log('add');
			var noteId = $(this).data("noteid");
			console.log("noteId : " + noteId);

			// 클릭시 상세페이지로 이동
			document.location = "/note/selectNote?noteId=" + noteId;
		});
		
		// 써머노트 사용
		$('#summernote').summernote({
			placeholder: 'Hello stand alone ui',
	        tabsize: 2,
	        height: 120,
	        width: 700,
			toolbar: [
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['view', ['fullscreen', 'codeview', 'help']]
			]
		});
		
		// 필기내용 넣어주기
		$('#summernote').summernote('code', '${noteVo.noteCont}');
	})
	
</script>
<body>
	<div class="container" role="main">
		<h4>필기 노트</h4>
		<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/teacherL/insert">
			<label for="title">필기 제목</label>
			<div class="mb-3">
				<input type="text" class="form-control" name="les_nm" value="${noteVo.noteTitle }" readonly="readonly">
			</div>
			<label for="reg_id">필기 내용</label>
			<div class="mb-3">
				<textarea class="form-control" id="summernote" name="noteCont"></textarea>
			</div>
		</form>
		<div>
			<button type="button" class="btn btn-sm btn-primary" id="updateBtn">수정</button>
			<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
		</div>
	</div>
</body>
</html>