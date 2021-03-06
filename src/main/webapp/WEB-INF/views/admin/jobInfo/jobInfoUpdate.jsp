<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>취업 공고 수정</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>

<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

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
   	 });

    $(".del_file").on("click", function() {
        a = $(this).val();
        del_count++;
        $('#fileup').append("<input type='hidden' name='del_files' value='"+a+"'>")
        
        $('#del_count').val(del_count);
        $(this).parent().remove();

    })
    
     $('#updatebutton').on('click', function(){
    	var jobinfoTitle = $('input[name="jobinfoTitle"]').val();
    	var jobinfoCont = $('textarea[name="jobinfoCont"]').val();
    	
    	if(jobinfoTitle == '' || jobinfoTitle == null){
    		alert("제목을 입력하세요");
    		return;
    	} else if(jobinfoCont == '' || jobinfoCont == null){
    		alert("내용을 입력하세요");
    		return;
    	} else {
    		if(confirm("수정하시겠습니까?")){
	    		$("#frm").submit();
	    		return;
    		}else{
    			return;
    		}
    	}
    	
    })
    
   	$('#listBtn').on('click', function(){
       	if(confirm("이전화면으로 가시겠습니까?")){
       		document.location="/admin/selectJobInfo?jobinfoId=${jobinfoVo.jobinfoId}";
       		return;
       	}else{
       		return;
       	}
       })
})       
</script>
<style>
	.note-editable p{
		text-align:left;
		font-size: 1.0em;
	}
	.card{
		width:92%;
		height:auto;
		margin:30px auto;
		min-height:1080px;
		font-size: 1.2em;
/* 		border: none; */
	}
	h2{
		color : #1d25af;
		font-family: 'LotteMartDream';
		font-weight: 700;
		text-align : center;
		font-size:2.0em;
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
#banner{
	margin: 20px;
}
.fix{
	margin-left : auto;
	margin-right : auto;
}
.note-editable p{
		text-align:left;
		font-size: 1.0em;
	}
	th{
		padding : 10px;
	}
</style>
<div class="card shadow">	
		<div id="banner">	
			<h2>채용 공고 수정</h2>
			<br>
		</div>	
		<div class="fix">
		<form id="frm" class="form-horizontal" method="POST" action="${cp}/admin/updateJobInfo" enctype="multipart/form-data">
			<table>
				<tr>
					<th>제목</th>
					<th><input type=text name="jobinfoTitle" style="width:700px;"value="${jobinfoVo.jobinfoTitle}"></th>
				</tr>
				<tr>
					<th>내용</th>
					<th><textarea class="summernote" name="jobinfoCont">${jobinfoVo.jobinfoCont}</textarea></th>
				</tr>
				<tr>
					<th>첨부파일</th>
					<th><input type='file' name='realfile' multiple='multiple' value="파일추가"></th>
				</tr>
			</table>
				
			<div class="form-group" style="float:right;">
				<button style="font-size: 1.0em;" type="button" id="updatebutton" class="btn btn-success">수정</button>
				<button style="font-size: 1.0em;" type="button" id="listBtn" class="btn btn-warning">나가기</button>
			</div>
			
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
			
			<div class="col-sm-10" id="fileup" class="col-sm-10">
			</div>
		
			<input type="hidden" id="jobinfoId" name="jobinfoId" value="${jobinfoVo.jobinfoId}">
			<input type="hidden" id="count" name="count" value="0">
			<input type="hidden" id="del_count" name="del_count" value="0">
			<input type="hidden" name="jobinfoUwriter" value="${USERID}">
	
					
		</form>
	</div>
</div>