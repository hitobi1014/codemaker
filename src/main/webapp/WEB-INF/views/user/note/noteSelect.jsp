<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<style>
#pt{
	font-size: 25px;
}
.nfn{
	color: #32325d;
}
#noteTitle{
	width: 820px;
}
#nt{
	font-size: 18px;
}
#d1{
	text-align: right;
	width: 820px;
}
</style>
<script>
	$(document).ready(function() {
		// 써머노트 사용
		$('#summernote').summernote({
	        tabsize: 2,
	        height: 600,
	        width: 820,
	        airmode : true,
	        disableResizeEditor: true, // 사이즈 조절 불가
			toolbar: [
			]
		});
		// 읽기만 가능
		$('#summernote').summernote('disable');
		// 필기내용 넣어주기
		$('#summernote').summernote('code', '${noteVO.noteCont}');
		
		// 수정
		$('#updateBtn').on('click', function(){
			$.ajax({
				url : '/note/updateViewNote',
				method : 'post',
				data : {
					noteId : '${noteVO.noteId }'
				},
				success : function(res) {
					$('#parent').html(res);
				},
				error : function(xhr) {
					alert("상태" + xhr.status);
				}
			});
		});
		
		// 삭제
		$('#delBtn').on('click', function(){
			$.ajax({
				url : '/note/deleteNote',
				method : 'post',
				data : {
					noteId : '${noteVO.noteId }'
				},
				success : function(res) {
					alert("해당 노트가 삭제되었습니다.");
					selectPageNote();
				},
				error : function(xhr) {
					alert("상태" + xhr.status);
				}
			});
		});
		
		// 목록
		$('#btnList').on('click', function(){
			selectPageNote();
		});
	});
	
	
</script>
<div class="container" role="main" id="parent">
	<p class="mb-0 nfn" id="pt"><strong>필기 노트</strong></p>
	<br>
	<form name="form" id="form" role="form">
		<label for="title" class="nfn" id="nt"><strong>필기 제목</strong></label>
		<div class="mb-3">
			<input type="text" id="noteTitle" class="form-control" name="noteTitle" value="${noteVO.noteTitle }" readonly="readonly">
		</div>
		<div class="mb-3">
			<textarea class="form-control" id="summernote" name="noteCont" readonly="readonly"></textarea>
		</div>
	</form>
	<div id="d1">
		<button type="button" class="btn btn-sm btn-primary" id="updateBtn">수정</button>
		<button type="button" class="btn btn-sm btn-primary" id="delBtn">삭제</button>
		<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
	</div>
</div>

