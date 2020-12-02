<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>선생님 회원가입</title>
</head>
<body>
	<form action="${cp}/teacher/signup" method="post" id="frm" enctype="multipart/form-data">
		<div class="" id="pictureView" style="border: 1px solid green; height: 200px; width: 140px;">
			<img id="pictureViewImg" style="width: 100%; height: 100%;"/>
		</div>
		<div class="form-group">
			<label for="tchProfile">프로필 사진</label> 
			<input type="file" class="form-control" id="picture" name="picture" accept=".gif, .jpg, .png" value="사진 선택">
		</div>
		<div class="form-group">
			<label for="tchId">아이디</label> 
			<input type="text" class="form-control" placeholder="아이디(4~20자리)" id="tchId" name="tchId">
		</div>
		<div class="form-group">
			<label for="tchPass">비밀번호</label>
			<input type="password" class="form-control" placeholder="비밀번호(영문자 8~20자리)" id="tchPass" name="tchPass">
		</div>
		<div class="form-group">
			<label for="tchPassChk">비밀번호 확인</label>
			<input type="password" class="form-control" placeholder="비밀번호 확인" id="tchPassChk">
		</div>
		<div class="form-group">
			<label for="resCode">가입인증코드</label>
			<input type="text" class="form-control" placeholder="인증코드(5자리)" id="resCode" name="resCode" value="T0006">
			<button type="button" onclick="codeChk()">인증코드 확인</button>
			<input type="hidden" id="chkCode" value=""/>
		</div>
		<div class="form-group">
			<label for="tchIntro">소개말</label>
			<textarea rows="3" cols="30" name="tchIntro" id="tchIntro">
			</textarea>
		</div>
		<button onclick="subFrm()" type="button" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>
<script>
function codeChk(){
	var resCode = $("#resCode").val();
	$.ajax({
		url : "/teacher/chkResCode",
		data : {resCode : resCode},
		method : "get",
		dataType : "json",
		success : function(data){
			var msg = data.chkMsg; 
			if(msg == "success"){
				alert("확인되었습니다");
				$("#chkCode").val("1");
			}
		},
		error : function(xhr){
				alert("확인되지 않은 인증코드 입니다");
		}
	})
}

function subFrm(){
	var frmCont = $("#frm").serialize();
	var code = $("#chkCode").val();
	if(code == 1){
		$("#frm").submit();
	}else{
		alert("인증코드를 확인해주세요");
	}
}

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$('#pictureViewImg').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

$(function(){
	// picture input의 파일 변경시 이벤트 
	$("#picture").change(function() {
		readURL(this);
	});
})
</script>