// 해당 필기노트 상세 페이지로 이동
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

var selectPageNote = function(page) {
	$.ajax({
		url : '/note/selectPageNote',
		method : 'post',
		data : {
			page : page
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

