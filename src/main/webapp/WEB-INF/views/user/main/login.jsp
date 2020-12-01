<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		var userid = $("#user").data("userid");
		$("input:checkbox[id='ckb1']").prop('checked',true);
		$("#userId").val(userid);
	}else{
		$("input:checkbox[id='ckb1']").prop('checked',false);
		$("#userId").val('');
	}
// 	var test = $("#user").data("userid");
// 	console.log(test);
	
})
</script>

<style>
.txt1:hover{
	text-decoration: underline;
}
#di{width: 1920px; height:70px; margin-left: 520px; padding-top: 85px;}
#logo{width:200px;height: 70px;}
.loginapi{margin-top: 5px;}
.row{width: 837px; height: 600px;margin-bottom: 100px;}
.cldiv{height: 570px;}
</style>
<body>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			Cookie c = cookies[i];
			URLDecoder.decode(c.getValue(),"UTF-8");
// 			String cName = c.getName();
			String cValue = URLDecoder.decode(c.getValue(),"UTF-8");
			if(c.getName().equals("userid")){
				out.print("<input id='user' data-userid='"+cValue+"' type='hidden'/>");
			}
		}
	}
%> 
	<div class="limiter" style="background-color:#f4f4f4">
		<div class="container-login100" >
			<div id="di">
				<a class="loginlogo" href="${cp}/user/main"><img id="logo" src="/img/mj/로고 작업.png"/></a>
			</div>
			<div class="row" style="border:1px solid #ededed; padding:20px;background-color:white;">
				<div class="cldiv col-xs-3 wrap-login100 p-t-50 p-b-90" style="margin-right:10px;">
					<form class="login100-form validate-form flex-sb flex-w" action="${cp}/user/login" method="post">
						<span class="login100-form-title p-b-51">Login</span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
							<input class="input100" type="text" id="userId" name="userId" placeholder="아이디">
							<span class="focus-input100"></span>
						</div>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
							<input class="input100" type="password" name="userPass" placeholder="비밀번호">
							<span class="focus-input100"></span>
						</div>
						
						<div class="flex-sb-m w-full p-t-3 p-b-24">
							<div class="contact100-form-checkbox">
								<input class="input-checkbox100" id="ckb1" type="checkbox" name="rememberMe" value="1">
								<label class="label-checkbox100" for="ckb1">아이디 저장</label>
							</div>
							<div>
								<a href="${cp}/user/findInfo?info=1" class="txt1">아이디</a>•
								<a href="${cp}/user/findInfo?info=2" class="txt1">비밀번호찾기</a>
							</div>
						</div>
						<span style="color:red;"><c:if test="${param.msg !=null}">${param.msg}</c:if></span>
						<div class="container-login100-form-btn m-t-17">
							<button class="login100-form-btn">
								코딩GO!
							</button>
						</div>
						<div style="margin:0 auto;">
							<a href="#"><img class="loginapi" src="/img/mj/네이버로그인.jpg"></a><br>
							<a href="#"><img class="loginapi" src="/img/mj/카카오로그인.jpg"></a>
						</div>
					</form>
				</div>
				
				<div class="cldiv col-xs-3 mb-4 wrap-login100 p-t-50 p-b-90" style="margin-left:5px;">
					<img src="/img/mj/로그인페이지사진.jpg"/>
				</div>
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