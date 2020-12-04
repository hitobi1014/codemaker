<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>
$(function(){
	var noteId = '${noteVO.noteId}';
	
	$('#noteCont').summernote({
		placeholder: '내용을 입력해주세요.',
        tabsize: 2,
        height: 600,
        width: 820,
        disableResizeEditor: true, // 사이즈 조절 불가
		toolbar: [
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['view', ['fullscreen', 'codeview', 'help']]
		]
	});
	
	// 필기내용 넣어주기
	$('#noteCont').summernote('code', '${noteVO.noteCont}');
	
	// 수정하기
	$('#upBtn').on('click', function(){
		// 빈칸이 있을 경우 등록 안됨.
		if($('#noteTitle').val() == '' || $('#noteCont').val() == ''){
// 			Console.log('aa');
			alert('내용을 입력해주세요.');
		}else{
			$.ajax({
				url : '/note/updateNote',
				method : 'post',
				data : $('#notef').serialize(),
				success : function(res) {
					alert("노트가 수정되었습니다.");
					selectNote(noteId);
				},
				error : function(xhr) {
					alert("상태" + xhr.status);
				}
			});
		}
		
	});
	
	// 수정 취소
	$('#cancle').on('click', function(){
		selectNote(noteId);
	});
})
</script>
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
<p class="mb-0 nfn" id="pt"><strong>필기 수정</strong></p>
<br>
<form id="notef">
	<input type="hidden" id="noteId" class="form-control" name="noteId" value="${noteVO.noteId }">
	<label for="title" class="nfn" id="nt"><strong>필기 제목</strong></label>
	<div class="mb-3">
		<input type="text" id="noteTitle" class="form-control" name="noteTitle" value="${noteVO.noteTitle }">
	</div>
	<div class="mb-3">
		<textarea id="noteCont" name="noteCont"></textarea>
	</div>
	<div class="mb-3" id="d1">
		<input type="button" class="btn btn-sm btn-primary" value="수정하기" id="upBtn">
		<input type="button" class="btn btn-sm btn-primary" value="수정취소" id="cancle">
	</div>
</form>
