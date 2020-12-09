

$(function(){
	var action='';
	var type='';
	var subno = 0;
	
	// 과목등록 버튼 클릭
	$('#addBtn').on('click',function(){
		action = 'insert';
//		method="post"
		$('#modal-title').text("과목 등록");
		$('#myModal').modal();
	})
	
	// 수정 버튼 클릭
	$('#subTbody').on('click','#upBtn',function(){
//		alert('수정 눌림');
		action = 'update';
		
		var row = $(this).parent().parent();
		var tr = row.children();
		var subId = tr.eq(1).text();
		var subNm = tr.eq(2).text();
		
		console.log(subId);
		console.log(subNm);
		
		$('#modal-title').text("과목 수정");
		$('#subId').val(subId);
		$('#subNm').val(subNm);
		$('#myModal').modal();
	})
	
	
	//Modal의 submit 버튼 클릭
	$('#modalSubmit').on('click',function(){
		console.log('눌림');
		var url='';
		
		if(action ==  'insert'){
			url='/admin/insertSubjcet';
			alert('등록되었습니다');
		}else if(action == 'update'){
			url='/admin/updateSubject';
			alert('수정되었습니다');
		}
		console.log(url);
		var data ={ "subNm" : $('#subNm').val(),
					 "subId" : $('#subId').val()
		}
	
		console.log(data);
		
		
		$.ajax({
			url : url,
			data : data,
			sucess : function(data){
						$('#myModal').modal('toggle');
			},
			complete : function(data){
						location.reload();
			},
			error : function(data){
						alert('안됨');
			}
		})
	})
	
	// 체크박스 전체선택&전체해제
	$('#mainCheckbox').on('click',function(){
		if($('#mainCheckbox').is(':checked')){
			$('input[name=checkRow]').prop('checked',true);
		}else{
			$('input[name=checkRow]').prop('checked',false);
		}
	})
	
})


