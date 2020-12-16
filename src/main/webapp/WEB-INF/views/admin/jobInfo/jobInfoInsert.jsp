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
	height:800px;
	margin:auto;
	border: none;
}
h2{
	color : #1d25af;
	font-size: 2.0em;
}
#ff{
	margin: 50px 130px 0;
	background-color: white;
}
.pagination .page-item:first-child .page-link, .pagination .page-item:last-child .page-link
{
 height: 37px; 
}
@font-face {
  font-family: 'LotteMartDream';
  font-style: normal;
  font-weight: 300;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamLight.woff') format('woff');
}
div, li{
 font-family: 'LotteMartDream';
  font-weight: 500;
}
.table th{
font-family: 'LotteMartDream';
  font-weight: 700;
  font-size: 1.5em;
  text-align: center;
}
.table td{
font-family: 'LotteMartDream';
  font-weight: 500;
  font-size: 1.2em;
  text-align: center;
  line-height: 40px;
}
.table tr{
	border-top: 2px solid #bdbdbd;
    border-bottom: 2px solid #bdbdbd;
}
.card .table {
   margin-bottom: 70px;
}
#insertbutton{
	float:right;
}
#banner{
	margin: 20px;
}
</style>
<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12">
		<div class="card">
	
		<div id="banner">	
			<h2>채용 공고 등록</h2>
			<br>
		</div>	
			<form id="insertJobInfo" enctype="multipart/form-data" class="form-horizontal" method="POST" action="/admin/insertJobInfo">
				<table>
					<tr>
						<th>제목</th>
						<th><input type="text" name="jobinfoTitle" style="width:300px;"></th>
					</tr>
					<tr>
						<th>내용</th>
						<th><textarea style="margin-left:100px;" class="summernote" name="jobinfoCont"></textarea></th>
					</tr>
					<tr>
						<th>첨부파일</th>
						<th><input type='file' name='realfile' multiple='multiple' value="파일추가"></th>
					</tr>		
				
				</table>
			
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
</div>