<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
	<title>회원로그인 페이지</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/user/login/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/user/login/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/vendor/user/login/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/user/login/util.css">
	<link rel="stylesheet" type="text/css" href="/css/user/login/main.css">
<!--===============================================================================================-->
</head>
<script>
$(function(){
	if(${cookie.remember.value}==1){
		$("input:checkbox[id='ckb1']").prop('checked',true);
		$("#user_id").val("${cookie.userid.value}");
	}else{
		$("input:checkbox[id='ckb1']").prop('checked',false);
		$("#user_id").val('');
	}
})
</script>
<style>
.txt1:hover{
	text-decoration: underline;
}
</style>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" action="${cp}/user/login" method="post">
					<span class="login100-form-title p-b-51">
						Login
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input class="input100" type="text" id="user_id" name="user_id" placeholder="아이디">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" type="password" name="user_pass" placeholder="비밀번호">
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="rememberMe" value="1">
							<label class="label-checkbox100" for="ckb1">
								아이디 저장
							</label>
						</div>

						<div>
							<a href="#" class="txt1">아이디</a>
							•
							<a href="#" class="txt1">비밀번호찾기</a>
						</div>
					</div>
					<span style="color:red;"><c:if test="${param.msg !=null}">${param.msg}</c:if></span>
					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn">
							코딩GO!
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/vendor/user/login/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/user/login/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/user/login/bootstrap/js/popper.js"></script>
	<script src="/vendor/user/login/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/user/login/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/user/login/daterangepicker/moment.min.js"></script>
	<script src="/vendor/user/login/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/user/login/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/js/user/login/main.js"></script>

</body>
</html>