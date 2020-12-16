<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>취업 공고 등록</title>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">

<script>
$(document).ready(function() {
	var count = 0;
	$('.summernote').summernote({
		width : 700,
		height: 500,
		lang: "ko-KR"
	});
	
    $('#insertbutton').on('click', function(){
    	var jobinfoTitle = $('input[name="jobinfoTitle"]').val();
    	var jobinfoCont = $('textarea[name="jobinfoCont"]').val();
    	
    	if(jobinfoTitle == '' || jobinfoTitle == null){
    		alert("제목을 입력하세요");
    		return;
    	} else if(jobinfoCont == '' || jobinfoCont == null){
    		alert("내용을 입력하세요");
    		return;
    	} else {
    		alert("게시글 등록이 완료되었습니다.")
    		$("#insertJobInfo").submit();
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
	#insertbutton{
		float:right;
	}
</style>
<div>
	<div class="col-12" style="margin:50px;">
		<div class="card">	
			<h2>채용 공고 등록</h2>
			<form id="insertJobInfo" enctype="multipart/form-data" class="form-horizontal" method="POST" action="${cp}/admin/insertJobInfo">
				<div class="col-sm-10">
				<label for="userNm" class="col-sm-2 control-label">제목</label>
					<input type="text" name="jobinfoTitle" style="width:300px;">
				</div>
				
				<div class="col-sm-10">
				<label for="userNm" class="col-sm-2 control-label">내용</label>
					<textarea style="margin-left:100px;" class="summernote" name="jobinfoCont"></textarea>
				</div>
				<hr>
				<div class="col-sm-10">
					<label for="userNm" class="col-sm-2 control-label">첨부파일</label>
					<input type='file' name='realfile' multiple='multiple' value="파일추가">
				</div>
				<div class="col-sm-10">
					<input type="hidden" name="adminId" value="${S_ADMIN.adminId}"/>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" id="insertbutton" class="btn btn-success">등록</button>
					</div>
				</div>
			</form>
		</div>	
	</div>
</div>