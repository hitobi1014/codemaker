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
	<form action="${cp}/teacher/signup" method="post">
		<div class="form-group">
			<label for="tchId">Email address:</label> 
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
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>
<script>
function codeChk(){
	var resCode = $("#resCode").val();
// 	console.log(resCode);
	$.ajax({
		url : "/teacher/chkResCode",
		data : {resCode : resCode},
		method : "get",
		dataType : "json",
		success : function(data){
			alert(data.chkMsg);
		},
		error : function(xhr){
			alert("실패");
		}
	})
}
</script>