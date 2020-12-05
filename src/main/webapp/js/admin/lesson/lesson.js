var selectPage = function(page, lesId) {
	$.ajax({
		url : '/admin/selectLessonIndex',
		method : 'post',
		data : {
			page : page,
			lesId : lesId
		},
		success : function(res) {
			$('#lesidx').html(res.split('fin')[0]);
			$('#d2').html(res.split('fin')[1]);
			$('#paging').html(res.split('fin')[2]);
		},
		error : function(xhr) {
			alert("상태" + xhr.status);
		}
	});
};
var selectPageLesson = function(page) {
	$.ajax({
		url : '/admin/selectAllPageLesson',
		method : 'post',
		data : {
			page : page
		},
		success : function(res) {
			// 자식 요소로 추가
			$('#lesTbody').html(res.split('fin')[0]);
			$('#pagingl').html(res.split('fin')[1]);
		},
		error : function(xhr) {
			alert("상태" + xhr.status);
		}
	});
};

