<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>QNA 작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>


<script>
$(document).ready(function() {
	$('.summernote').summernote({
		width : 700,
		height: 300,
		lang: "ko-KR"
	});
	
	$('#insertbutton').on('click', function(){
    	var qnaTitle = $('input[name="qnaTitle"]').val();
    	var qnaCont = $('textarea[name="qnaCont"]').val();
    	
    	if(qnaTitle == '' || qnaTitle == null){
    		alert("제목을 입력하세요");
    		return;
    	} else if(qnaCont == '' || qnaCont == null){
    		alert("내용을 입력하세요");
    		return;
    	} else {
    		$.ajax({
        		url : "/common/alert",
        		success : function(){
        			$("#insertQna").submit();
        		}
        	})
    	}
    })
})	
</script>
<style>
	.card{
		width:1000px;
		margin:auto;
	}
	h2{
		text-align:center;
		color : #1d25af;
	}
	#insertbutton{
		float:right;
	}
	.row{
		margin: 50px 130px 0;
		background-color: white;
		margin-bottom:30px;
	}
</style>
<div class="row shadow" >
	<div class="col-12" style="margin:50px;">
		<div class="card" style=" height:500px;">
			<div style="text-align:center;">
				<h2>QNA 등록</h2>
				<form id="insertQna" method="POST" action="${cp}/user/insertQna">
		
					<div class="col-sm-10">
					<label for="userNm" class="col-sm-2 control-label">제목</label>
						<input type="text" name="qnaTitle" style="width:300px;">
					</div>
		
					<div class="col-sm-10">
					<label for="userNm" class="col-sm-2 control-label">내용</label>
						<textarea style="margin-left:100px;" class="summernote" name="qnaCont"></textarea>
					</div>
					<hr>
			
					<div class="col-sm-10">
						<input type="hidden" name="userId" value="${MEMBER_INFO.userId}" />
					</div>
					
					<div class="col-sm-10">
						<input type="hidden" name="lesId" value="${param.lesId}" />
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

