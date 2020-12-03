// 문제 추가
var selectNote = function(noteId) {
	$.ajax({
		url : '/note/selectNote',
		method : 'post',
		data : {
			noteId : noteId
		},
		success : function(res) {
			// 자식 요소로 추가
			$('#alld').html(res);
		},
		error : function(xhr) {
			alert("상태" + xhr.status);
		}
	});
};

